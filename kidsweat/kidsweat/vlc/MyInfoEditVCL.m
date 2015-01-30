//
//  MyInfoEditVCL.m
//  kidsweat
//
//  Created by chenzf on 15/1/29.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyInfoEditVCL.h"
#import "MBProgressHUD+Add.h"

@interface MyInfoEditVCL ()


@property (weak, nonatomic) IBOutlet UIView *vAddress;
@property (weak, nonatomic) IBOutlet UITextView *txAddress;

@property (weak, nonatomic) IBOutlet UIView *vNickname;
@property (weak, nonatomic) IBOutlet UITextField *tfNickname;

@property (weak, nonatomic) IBOutlet UIView *vSex;
@property (weak, nonatomic) IBOutlet UIImageView *ivManSelected;
@property (weak, nonatomic) IBOutlet UIImageView *ivWomanSelected;

@end

@implementation MyInfoEditVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
}

- (void)initView{
    
    [self showRightBarButtonItemWithTitle:@"确认" BgImageName:@"myindex_xiaox_btn_nor" target:self action:@selector(modifyConfirm)];
    
    _vNickname.hidden = YES;
    _vAddress.hidden = YES;
    _vSex.hidden = YES;
    
    switch (_iInfoType) {
        case Enum_InfoType_Nickname:{
            self.title = @"昵称";
            _vNickname.hidden = NO;
            
            if(_strDefaultValue.length > 0){
                _tfNickname.text = _strDefaultValue;
            }
        }
            break;
            
        case Enum_InfoType_Address:{
            self.title = @"收货地址";
            _vAddress.hidden = NO;
            
            if(_strDefaultValue.length > 0){
                _txAddress.text = _strDefaultValue;
            }
        }
            break;
            
        case Enum_InfoType_Sex:{
            self.title = @"性别";
            _vSex.hidden = NO;
            
            if([_strDefaultValue isEqualToString:@"男"]){
                _ivManSelected.hidden = NO;
            }
            else if([_strDefaultValue isEqualToString:@"女"]){
                _ivWomanSelected.hidden = NO;
            }
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Function

- (IBAction)handleSelectSex:(id)sender {
    _ivManSelected.hidden = YES;
    _ivWomanSelected.hidden = YES;
    
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1:
            _ivManSelected.hidden = NO;
            break;
        case 2:
            _ivWomanSelected.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (void)modifyConfirm{
    
    if(![self checkValid]){
        return;
    }
    
    NSString *strValue;
    switch (_iInfoType) {
        case Enum_InfoType_Nickname:{
            strValue = _tfNickname.text;
        }
            break;
            
        case Enum_InfoType_Address:{
            strValue = _txAddress.text;
        }
            break;
            
        case Enum_InfoType_Sex:{
            if(!_ivManSelected.hidden){
                strValue = @"男";
            }else{
                strValue = @"女";
            }
        }
    }
    
    NSDictionary *dict = @{@"type":[NSString stringWithFormat:@"%d",_iInfoType],@"value":strValue};
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_EDITINFO_FIN object:dict];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)checkValid{
    switch (_iInfoType) {
        case Enum_InfoType_Nickname:{
            if(_tfNickname.text.length < 1){
                [MBProgressHUD showWarning:@"请输入昵称" toView:self.view];
                return NO;
            }
        }
            break;
            
        case Enum_InfoType_Address:{
            if(_txAddress.text.length < 1){
                [MBProgressHUD showWarning:@"请输入地址" toView:self.view];
                return NO;
            }
        }
            break;
            
        case Enum_InfoType_Sex:{
            if(_ivManSelected.hidden && _ivWomanSelected.hidden){
                [MBProgressHUD showWarning:@"请选择性别" toView:self.view];
                return NO;
            }
        }
    }
    
    
    return YES;
}

#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}


@end
