//
//  CircleAddNewVC.m
//  kidsweat
//
//  Created by chenzf on 15/2/2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CircleAddNewVC.h"
#import "LXActionSheet.h"
#import "MBProgressHUD+Add.h"
#import "UIColor+External.h"
#import "UIImage+External.h"
#import "ZYQAssetPickerController.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

#define AddImgWH 44
#define MAXIMGCOUNT 3

@interface CircleAddNewVC ()<LXActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,ZYQAssetPickerControllerDelegate,AMapSearchDelegate,MAMapViewDelegate>{
    
    UIImagePickerController *_picker;
    MBProgressHUD *_hud;
    
    NSMutableArray *_fileDatas;
    int _updateImageIndex;
    long long _currentWriten;
    long long _totalfilesize;
    
    // map
    NSString *_strAddress;
    AMapSearchAPI *_searcher;
    MAMapView *_mapView;
    AMapReGeocodeSearchRequest *_request;
}

@property (weak, nonatomic) IBOutlet UITextView *txContent;
@property (weak, nonatomic) IBOutlet UIScrollView *svImgContent;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (weak, nonatomic) IBOutlet UILabel *lbPermision;



@end

@implementation CircleAddNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self initView];
    [self reloadScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    _fileDatas = [[NSMutableArray alloc] init];
    _totalfilesize = 0;
    _currentWriten = 0;
    _updateImageIndex = 0;
}

- (void)initView{
    self.title = @"发布动态";
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, 50, 30);
    button.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [button setTitleColor:RGB(158, 208, 12) forState:UIControlStateNormal];
    [button setTitleColor:RGB(78, 100, 5) forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleSendAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark - Request

- (void)sendTrendReq{
    
}

- (void)uploadImageReq{
    if (_fileDatas.count <= _updateImageIndex) {
        _updateImageIndex = 0;
        [self sendTrendReq];
        return;
    }
    
    ImageFileInfo *fileInfo = [_fileDatas objectAtIndex:_updateImageIndex];
//    [LK_APIUtil uploadWBIMGFile:fileInfo.fileData fileName:fileInfo.fileName ProgressBlock:^(NSInteger bytesWritten, long long totalBytesWritten) {
//        _currentWriten += bytesWritten;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            _hud.progress = (float)_currentWriten/_totalfilesize;
//        });
//    } successBlock:^(NSString *fileid) {
//        [_aryImgFileid addObject:fileid];
//        _updateImageIndex ++;
//        
//        [self sendImages];
//        
//    } errorBlock:^(BOOL NotReachable) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            _updateImageIndex = 0;
//            _currentWriten = 0.0;
//            [_hud removeFromSuperview];
//            _hud = nil;
//            [MBProgressHUD showWarning:@"  网络不给力  " toView:self.view];
//            self.navigationItem.rightBarButtonItem.enabled = YES;
//        });
//    }];
}

#pragma mark - Function

#pragma mark Map

- (void)searchPosition{
    _searcher = [[AMapSearchAPI alloc] initWithSearchKey: @"9dfdf1c3299afea34b2c97c45010afaa" Delegate:self];
    _searcher.delegate = self;
    _mapView = [[MAMapView alloc]initWithFrame:CGRectZero];
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
}

#pragma mark Select Image

-(void)reloadScrollView{
    
    NSArray *subViews = _svImgContent.subviews;
    for (UIView *view in subViews) {
        [view removeFromSuperview];
    }
    
    int count = _fileDatas.count;
    NSInteger pointy = (_svImgContent.frame.size.height - AddImgWH)/2;
    NSInteger pointx = pointy;
    for (int i = 0; i<count; i++) {
        UIButton *imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(pointx, pointy, AddImgWH, AddImgWH)];
        imageBtn.tag = i;
        ImageFileInfo *fileInfo = [_fileDatas objectAtIndex:i];
        UIImage *image = fileInfo.image;
        [imageBtn setImage:image forState:UIControlStateNormal];
        imageBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        pointx += AddImgWH + pointy;
        [imageBtn addTarget:self action:@selector(handleImageClicked) forControlEvents:UIControlEventTouchUpInside];
        [_svImgContent addSubview:imageBtn];
    }
    
    if(count < MAXIMGCOUNT){
        UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(pointx, pointy, AddImgWH, AddImgWH)];
        [addBtn addTarget:self action:@selector(handleAddImageClicked) forControlEvents:UIControlEventTouchUpInside];
        [addBtn setImage:[UIImage imageNamed:@"zhenbpage_add_icon_nor"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"zhenbpage_add_icon_pre"] forState:UIControlStateHighlighted];
        [_svImgContent addSubview:addBtn];
        [_svImgContent setContentSize:CGSizeMake(pointx + AddImgWH + pointy, _svImgContent.frame.size.height)];
        if (pointx + AddImgWH + pointy > _svImgContent.frame.size.width) {
            [_svImgContent setContentOffset:CGPointMake(pointx + AddImgWH + pointy - _svImgContent.frame.size.width, 0) animated:YES];
        }
    }else{
        [_svImgContent setContentSize:CGSizeMake(pointx + pointy, _svImgContent.frame.size.height)];
    }
}

//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        _picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
        //设置拍照后的图片可被编辑
        _picker.allowsEditing = NO;
        _picker.sourceType = sourceType;
        [self presentViewController:_picker animated:YES completion:nil];
    }
    else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册-第三方可多选
-(void)LocalPhoto
{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkTextColor],UITextAttributeTextColor,[UIFont boldSystemFontOfSize:18],UITextAttributeFont,@0.0,UITextAttributeTextShadowOffset, nil];
    picker.maximumNumberOfSelection = MAXIMGCOUNT - _fileDatas.count;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    UIImage* image = nil;
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        image = [image fixOrientation];
    }
    [picker dismissViewControllerAnimated:YES completion:^{
        if(image){
            ImageFileInfo *imageInfo = [[ImageFileInfo alloc]initWithImage:image];
            [_fileDatas addObject:imageInfo];
            _totalfilesize += imageInfo.filesize;
            
            [self reloadScrollView];
        }
    }];
    _picker = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
    _picker = nil;
}

#pragma mark Click Event

- (void)handleAddImageClicked{
    [_txContent resignFirstResponder];
    
    LXActionSheet *sheet = [[LXActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"立即拍照" otherButtonTitles:@"相册选择",nil];
    sheet.tag = 12;
    [sheet setdestructiveButtonColor:RGB(158, 208, 12) titleColor:[UIColor whiteColor] icon:nil];
    [sheet setCancelButtonColor:[UIColor whiteColor] titleColor:[UIColor redColor] icon:nil];
    [sheet setButtonIndex:1 buttonColor:[UIColor whiteColor] titleColor:[UIColor darkTextColor] icon:nil];
    [sheet showInView:self.view];
}

- (void)handleImageClicked{
    
}

- (void)handleSendAction{
    [_txContent resignFirstResponder];
    
    if(_txContent.text.length > 0){
        NSString *tempContent = [_txContent.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if(tempContent.length < 1){
            [MBProgressHUD showError:@"内容为空" toView:self.view];
            return;
        }
    }
    
    if(_fileDatas.count == 0 && _txContent.text.length == 0){
        [MBProgressHUD showError:@"不能发空内容哦" toView:self.view];
        return;
    }else{
//        [_photoInfos removeAllObjects];
//        [_aryImgFileid removeAllObjects];
        self.navigationItem.rightBarButtonItem.enabled = NO;
        
        if(_fileDatas.count > 0){
            _hud = [[MBProgressHUD alloc]initWithView:self.view];
            _hud.progress = 0.0/ _totalfilesize;
            _hud.mode = MBProgressHUDModeAnnularDeterminate;
            _hud.labelText = @"正在上传文件";
            [self.view addSubview:_hud];
            [_hud show:YES];
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self uploadImageReq];
        });
    }
}

- (IBAction)handleFunctionClicked:(id)sender {
    [_txContent resignFirstResponder];
    
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 0:{
            // 位置
        }
            break;
            
        case 1:{
            // 查看权限
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - LXActionSheetDelegate

- (void)lxactionSheet:(LXActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;{
    if (actionSheet.tag == 12){
        if (buttonIndex == 0) {
            [self takePhoto];
        }else if (buttonIndex == 1){
            [self LocalPhoto];
        }
    }
}

#pragma mark  ZYQAssetPickerControllerDelegate

-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    _hud = [[MBProgressHUD alloc]initWithWindow:ShareAppDelegate.window];
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.labelText = @"正在加载...";
    [picker.view addSubview:_hud];
    [_hud show:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<assets.count; i++) {
            ALAsset *asset=assets[i];
            UIImage *image=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        
            ImageFileInfo *imageInfo = [[ImageFileInfo alloc]initWithImage:image];
            [_fileDatas addObject:imageInfo];
            _totalfilesize += imageInfo.filesize;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if(_hud){
                [_hud hide:YES];
                _hud = nil;
            }
            
            [picker dismissViewControllerAnimated:YES completion:^{
                [self reloadScrollView];
            }];
            
        });
        
        
    });
}

#pragma mark - AMapSearchDelegate

-(void)mapView:(MAMapView*)mapView didUpdateUserLocation:(MAUserLocation*)userLocation updatingLocation:(BOOL)updatingLocation
{
    mapView.showsUserLocation = NO;
    _request = [[AMapReGeocodeSearchRequest alloc]init];
    _request.searchType = AMapSearchType_ReGeocode;
    _request.location = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
    _request.radius = 10000;
    _request.requireExtension = NO;
    [_searcher AMapReGoecodeSearch:_request];
}

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    _strAddress = response.regeocode.formattedAddress;
    NSLog(@"address: %@", _strAddress);
}

- (void)search:(id)searchRequest error:(NSString*)errInfo;{
    if (errInfo) {
        NSLog(@"%@",errInfo);
    }
}


#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}

@end
