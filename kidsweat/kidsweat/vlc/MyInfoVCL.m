//
//  MyInfoVCL.m
//  kidsweat
//
//  Created by chenzf on 15-1-5.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyInfoVCL.h"
#import "LXActionSheet.h"
#import "MBProgressHUD+Add.h"
#import "UIColor+External.h"
#import "UserIconSettingViewController.h"
#import "UIImage+External.h"
#import "MyInfoEditVCL.h"
#import "AlertListManagement.h"

@implementation ImageFileInfo

-(id)initWithImage:(UIImage *)image;{
    self = [super init];
    if (self) {
        if (image) {
            _name = @"file";
            _mimeType = @"image/jpg";
            _fileData = UIImageJPEGRepresentation(image, 0.5);
            if (_fileData == nil)
            {
                _fileData = UIImagePNGRepresentation(image);
                _fileName = [NSString stringWithFormat:@"%f.png",[[NSDate date ]timeIntervalSinceNow]];
                _mimeType = @"image/png";
            }
            else
            {
                _fileName = [NSString stringWithFormat:@"%f.jpg",[[NSDate date ]timeIntervalSinceNow]];
            }
            self.filesize = _fileData.length;
        }
    }
    return self;
}

@end

@interface MyInfoVCL ()<LXActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UserIconSettingDelegate,AlertListManagementDelegate>{
    UIImagePickerController *_picker;
    UIImage *_userPhoto;
    MBProgressHUD *_hud;
    long long _currentWriten;
    
    AlertListManagement *_areaSelectView;
    NSString *_strProvinceSel;
    NSString *_strCitySel;
}

@property (weak, nonatomic) IBOutlet UIScrollView *svContain;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (weak, nonatomic) IBOutlet UIImageView *ivUsericon;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbMail;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (weak, nonatomic) IBOutlet UILabel *lbSex;
@property (weak, nonatomic) IBOutlet UILabel *lbArea;

@end

@implementation MyInfoVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyEditInfoFin:) name:NOTIFY_EDITINFO_FIN object:nil];
    
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    _userPhoto = nil;
}

- (void)initView{
    self.title = @"我的资料";
    [_svContain setContentSize:CGSizeMake(_svContain.frame.size.width, _btnConfirm.frame.origin.y + _btnConfirm.frame.size.height + 10)];
    
    _ivUsericon.layer.cornerRadius = _ivUsericon.frame.size.width/2;
    _ivUsericon.layer.masksToBounds = YES;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Request

- (void)updateUserInfoReq{
    
}

- (void)uploadImageReq{
//    _userPhoto = [_userPhoto imageByScaleForSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.width)];
//    ImageFileInfo *fileInfo = [[ImageFileInfo alloc]initWithImage:_userPhoto];
//    
//    [LK_APIUtil uploadFile:fileInfo.fileData name:fileInfo.name fileName:fileInfo.fileName mimeType:fileInfo.mimeType ProgressBlock:^(NSInteger bytesWritten, long long totalBytesWritten) {
//        _currentWriten += bytesWritten;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            _hud.progress = (float)_currentWriten/fileInfo.filesize;
//        });
//    } successBlock:^(NSString *filepath) {
//        [_hud removeFromSuperview];
//        _hud = nil;
//        
//        _registUser.usericon = filepath;
//        [self sendRegistReq];
//        
//    } errorBlock:^(BOOL NotReachable){
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [_hud removeFromSuperview];
//            _hud = nil;
//            [MBProgressHUD showError:@"网络不给力" toView:self.view];
//        });
//    }];
}

#pragma mark - Function

- (IBAction)handleItemClicked:(id)sender {
    NSString *strValue = @"";
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1:{
            // 头像
            LXActionSheet *sheet = [[LXActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"立即拍照" otherButtonTitles:@"相册选择",nil];
            sheet.tag = 12;
            [sheet setdestructiveButtonColor:RGB(86, 170, 14) titleColor:[UIColor whiteColor] icon:[UIImage imageNamed:@"micon-camera"]];
            [sheet setCancelButtonColor:[UIColor whiteColor] titleColor:[UIColor redColor] icon:nil];
            [sheet setButtonIndex:1 buttonColor:[UIColor whiteColor] titleColor:[UIColor darkTextColor] icon:[UIImage imageNamed:@"micon-album"]];
            [sheet showInView:self.view];
        }
            break;
            
        case 2:{
            // 昵称
            strValue = _lbName.text;
        }
            break;
            
        case 3:{
            // 地址
            strValue = _lbAddress.text;
        }
            break;
            
        case 4:{
            // 性别
            strValue = _lbSex.text;
        }
            break;
            
        case 5:{
            // 地区
            _strProvinceSel = @"";
            _strCitySel = @"";
            [self showAreaSelectView];
        }
            break;
            
        default:
            break;
    }
    
    if(button.tag != 1 &&
       button.tag != 5){
        MyInfoEditVCL *vcl = [[MyInfoEditVCL alloc] init];
        vcl.iInfoType = button.tag;
        vcl.strDefaultValue = strValue;
        [self.navigationController pushViewController:vcl animated:YES];
    }
    
    
}

- (IBAction)handleBtnConfirmClicked:(id)sender {
}

- (void)updateUserInfo{
    if(!_userPhoto)
    {
        [self updateUserInfoReq];
    }
    else
    {
        // send photo, then update
        _hud = [[MBProgressHUD alloc]initWithView:self.view];
        _hud.progress = 0.0;
        _hud.mode = MBProgressHUDModeAnnularDeterminate;
        _hud.labelText = @"正在上传文件";
        [self.view addSubview:_hud];
        [_hud show:YES];
        
        [self performSelector:@selector(uploadImageReq) withObject:nil afterDelay:0.1f];
    }
}

- (NSArray *)getProvinceData{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    NSArray *aryCity = [[NSArray alloc] initWithContentsOfFile:plistPath];
    for(NSDictionary *dict in aryCity){
        [result addObject:dict[@"state"]];
    }
    
    return result;
}

- (NSArray *)getCityDataByProvince:(NSString *)province{
    if(province.length < 1){
        return @[@"未找到城市"];
    }
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    NSArray *aryCity = [[NSArray alloc] initWithContentsOfFile:plistPath];
    for(NSDictionary *dict in aryCity){
        NSString *strProvince = dict[@"state"];
        if([strProvince isEqualToString:province]){
            NSArray *cities = dict[@"cities"];
            return cities;
        }
    }
    
    return @[@"未找到城市"];
}

- (void)showAreaSelectView{
    _areaSelectView = [[[NSBundle mainBundle] loadNibNamed:@"AlertListManagement" owner:nil options:nil] lastObject];
    _areaSelectView.levelCount = 2;
    _areaSelectView.delegate = self;
    [_areaSelectView show];
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

//打开本地相册
-(void)LocalPhoto
{
    _picker = [[UIImagePickerController alloc] init];
    _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _picker.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1],UITextAttributeTextColor,[UIFont systemFontOfSize:18],UITextAttributeFont, nil];
    _picker.delegate = self;
    //设置选择后的图片可被编辑
    _picker.allowsEditing = NO;
    [self presentViewController:_picker animated:YES completion:nil];
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
    [picker dismissViewControllerAnimated:NO completion:^{
        if(image)
        {
            UserIconSettingViewController *controller = [[UserIconSettingViewController alloc] initWithImage:image cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
            controller.delegate = self;
            controller.selectedImg = image;
            [self.navigationController pushViewController:controller animated:YES];
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

#pragma mark - LXActionSheetDelegate

- (void)lxactionSheet:(LXActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;{
    if (buttonIndex == 0) {
        [self takePhoto];
    }else if (buttonIndex == 1){
        [self LocalPhoto];
    }
}

#pragma mark - AlertListManagementDelegate

-(void)dataSelected:(NSObject *)data inLevelIndex:(int)levelIndex management:(AlertListManagement *)management{
    if (levelIndex == 0 && data){
        _strProvinceSel = (NSString *)data;
    }else if(levelIndex == 1 && data){
        _strCitySel = (NSString *)data;
        _lbArea.text = [NSString stringWithFormat:@"%@ %@",_strProvinceSel,_strCitySel];
    }
}

-(void)willNextLevel:(int)levelIndex management:(AlertListManagement *)management{
    if (levelIndex == 0) {
        [management setTitle:@"请选择" levelIndex:0];
        [management setDataList:[self getProvinceData] levelIndex:levelIndex selectedObject:nil];
        management.levelIndex = levelIndex;
        [management reload];
    }else if(levelIndex == 1){
        [management setTitle:@"请选择" levelIndex:0];
        [management setDataList:[self getCityDataByProvince:_strProvinceSel] levelIndex:levelIndex selectedObject:nil];
        management.levelIndex = levelIndex;
        [management reload];
    }
}

-(void)alertListManagementWillFinish:(AlertListManagement *)management{
    
}

#pragma mark - UserIconSettingDelegate

- (void)imageCropper:(UserIconSettingViewController *)userIconSettingViewController didFinished:(UIImage *)editedImage {
    _userPhoto = editedImage;
    _ivUsericon.image = editedImage;
}

- (void)imageCropperDidCancel:(UserIconSettingViewController *)userIconSettingViewController {
}

#pragma mark - NSNotification

- (void)notifyEditInfoFin:(NSNotification *)note{
    NSDictionary *dict = [note object];
    NSString *type = dict[@"type"];
    NSString *value = dict[@"value"];
    
    switch (type.intValue) {
        case Enum_InfoType_Nickname:{
            _lbName.text = value;
        }
            break;
            
        case Enum_InfoType_Address:{
            _lbAddress.text = value;
        }
            break;
            
        case Enum_InfoType_Sex:{
            _lbSex.text = value;
        }
    }
    
}

#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}

@end
