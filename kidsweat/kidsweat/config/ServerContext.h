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

#define API_GET_CARTDATA @"userapi.php?act=get_cart_data"

#define NOTIFCATION_ERROR @"NOTIFCATION_ERROR"
#define ERROR_DESCRIPTION @"ERROR_DESCRIPTION"
#define ERROR_CODE @"ERROR_CODE"
