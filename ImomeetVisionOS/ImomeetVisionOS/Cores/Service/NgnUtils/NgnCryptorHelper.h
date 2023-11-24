//
//  NgnCryptorHelper.h
//  ios-ngn-stack
//
//  Created by Wu Hailong on 15/3/9.
//  Copyright (c) 2015年 Softfoundry. All rights reserved.
//

//
//  Utility.h
//  TheDealersForum
//
//  Created by Hailong Zhang on 5/3/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@interface NgnCryptorHelper : NSObject {
	
}
+ (NSString *) doCipher:(NSString *)strContent key:(NSString *)key IV: (NSString*)iv context:(CCOperation)encryptOrDecrypt;
+ (NSString *) encrypt:(NSString *)strContent key:(NSString *)key IV: (NSString*)iv;
+ (NSString *) decrypt:(NSString *)strContent key:(NSString *)key IV: (NSString*)iv;


@end

