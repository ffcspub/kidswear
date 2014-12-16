//
//  ServerContext.h
//  belang
//
//  Created by mac on 14-9-10.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#pragma mark - URL

#define METHOD_POST @"POST"
#define METHOD_GET @"GET"
#define METHOD_PUT @"PUT"
#define METHOD_DELETE @"DELETE"
#define METHOD_PATCH @"PATCH"

#define URL_SERVER_BASE @"http://tz.tuishang.com.cn/api/"

#define API_LOGIN @"userapi.php?act=login"

#define API_LOGOUT @"userapi.php?act=logout"

#define API_REGSITER @"userapi.php?act=register"

#define API_VALIDATE_EMAIL @"userapi.php?act=validate_email"

#define API_SENDPWDTOEMAIL @"userapi.php?act=send_pwd_email"

#define API_OATH @"userapi.php?act=oath"

#define API_OATHBIND @"userapi.php?act=oath_login"

#define API_GET_USERINFO @"userapi.php?act=profile"

#define API_EDIT_USERINFO @"userapi.php?act=edit_profile"

#define API_GET_CARTLIST @"userapi.php?act=get_cart_list"

#define API_DROP_CARTGOODS @"userapi.php?act=drop_cart_goods"

#define API_UPDATE_CART @"userapi.php?act=update_cart"

#define API_GET_CONSIGNEE_LIST @"userapi.php?act=get_consignee_list"

#define API_DROP_CONSIGNEE @"userapi.php?act=drop_consignee"

#define API_ADDUPDATE_CONSIGNEE @"userapi.php?act=add_update_consignee"

#define API_GET_ORDER_LIST @"userapi.php?act=get_order_list"


#define API_GET_ORDER_INFO @"userapi.php?act=get_order_info"

#define NOTIFCATION_ERROR @"NOTIFCATION_ERROR"
#define ERROR_DESCRIPTION @"ERROR_DESCRIPTION"
#define ERROR_CODE @"ERROR_CODE"
