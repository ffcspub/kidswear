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

//#define URL_SERVER_BASE @"http://192.168.9.204/rest/v1/"
#define URL_SERVER_BASE @"http://121.207.243.132/rest/v1/"

#define API_LOGIN @"account/auth/login"

#define API_LOGOUT @"account/auth/logoff"

#define API_REGSITER @"account/user/register"

#define API_USERINFO @"account/user/userinfo"

#define API_DEVICEINFO @"account/hardware/deviceinfo"

#define API_BINDINGBYINFO @"dream/bindingbyinfo"

#define API_BINDINGDEVICE @"dream/binding"

#define API_AUTHORIZE @"dream/role"

#define API_COMMAND @"dream/command"

#define API_NOTIFY @"dream/querynotify"

#define API_STATUS @"dream/devicestatus"

#define API_SUBDEVICESTATUS @"ndhub/subdevicestatus"

#define API_SUBDEVICE @"ndhub/subdevice"

#define API_DEVICECLASS @"irlib/class"

#define API_DEVICEBRAND @"irlib/brand"

#define API_DEVICEPRODUCT @"irlib/product"

#define API_IR @"irlib/ir"

#define API_PUSH @"push/device"

#define API_WEATHER_PROVINCE @"bazaars/weather/province"

#define API_WEATHER_CITY @"bazaars/weather/city"

#define API_WEATHER_REPORT @"bazaars/weather/report"

#define NOTIFCATION_ERROR @"NOTIFCATION_ERROR"
#define ERROR_DESCRIPTION @"ERROR_DESCRIPTION"
#define ERROR_CODE @"ERROR_CODE"
