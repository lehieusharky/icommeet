//
//  NgnWebServiceUtils.m
//  ImomeetVisionOS
//
//  Created by Thien Vu on 22/10/2023.
//

#import "NgnWebServiceUtils.h"
#import "NgnStringUtils.h"
#import "NgnCryptorHelper.h"

@implementation NgnWebServiceUtils

+ (NSString *)getStringDecryptedFromString:(NSString *)sourceString withVerifyCode:(NSString *)verifyCode {
    NSString *key = [NgnStringUtils oddString: [[NgnStringUtils md5:verifyCode] substringWithRange:NSMakeRange(8, 16)]];
    NSString *result = [NgnCryptorHelper decrypt:sourceString key:key IV:verifyCode];
    if (result.length >= 32) {
        result = [result substringFromIndex: 32];
    }
    
    return result;
}

+ (NSString *)newWebAPIGetStringEncryptedFromDict:(NSDictionary *)mulDict accessToken:(NSString*) token {
    NSString *access_token = token;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mulDict options:0 error:nil];
    NSString *strContent = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    strContent = [strContent stringByRemovingPercentEncoding];
    #define SF(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]
    strContent = SF(@"%@%@",[NgnStringUtils md5:strContent],strContent);
    NSString *iv = @"";
    if (access_token.length > 8) {
        iv = [[NgnStringUtils md5:access_token] substringToIndex:8];
    }
    NSString *key = [NgnStringUtils oddString: [[NgnStringUtils md5:iv] substringWithRange:NSMakeRange(8, 16)]];
    NSString *strEncyrpt = [NgnCryptorHelper encrypt:strContent key: key IV: iv];
    return strEncyrpt;
}

@end
