/* Copyright (C) 2010-2011, Mamadou Diop.
 * Copyright (c) 2011, Doubango Telecom. All rights reserved.
 *
 * Contact: Mamadou Diop <diopmamadou(at)doubango(dot)org>
 *       
 * This file is part of iDoubs Project ( http://code.google.com/p/idoubs )
 *
 * idoubs is free software: you can redistribute it and/or modify it under the terms of 
 * the GNU General Public License as published by the Free Software Foundation, either version 3 
 * of the License, or (at your option) any later version.
 *       
 * idoubs is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
 * See the GNU General Public License for more details.
 *       
 * You should have received a copy of the GNU General Public License along 
 * with this program; if not, write to the Free Software Foundation, Inc., 
 * 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 */
#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE
#	import <UIKit/UIKit.h>
#endif

typedef enum : NSUInteger {
    FACEPRO,
    EXPERT_SYSTEM,
    CSI,
    CCS,
    PORSCHE,
    VMEETING
}TARGET_APP;

@interface NgnStringUtils : NSObject {

}

+(const NSString*)emptyValue;
+(const NSString*)nullValue;
+(BOOL)isNullOrEmpty:(NSString*)string;
+(BOOL)contains:(NSString*) string subString:(NSString*)subStr;
+(BOOL)isContainOnlyNumber:(NSString *)string;
+(BOOL)isContainSpecialString:(NSString *)string;
+(NSString*) toNSString: (const char*)cstring;
+(const char*) toCString: (NSString*)nsstring;
+(NSString*) objectToNSString: (id)object;
#if TARGET_OS_IPHONE
+(UIColor*) colorFromRGBValue: (int)rgbvalue;
#endif
+ (NSString*)stringBetweenString:(NSString*)string startString:(NSString*)start andString:(NSString*)end;
+ (NSString *) generateUuidString;
+ (NSString *) genRandStringLength: (int) len;
+ (NSString *) urlEncodedString: (NSString*)input;
+ (NSString *) getTelephoneArea: (NSString*)countryCode;
+ (NSString *) getAgentString: (NSString*)stringCode;
+ (BOOL) isEmptyOrSpaceAndNewline:(NSString*)string;

+ (NSString*) hexString: (NSData*) input;
+ (NSString *) md5 : (NSString*)input;
+ (NSString *) sha1: (NSString*)input;
+ (NSString*) oddString:(NSString*)input;
+ (NSString *) base64Encoding:(NSData*) data;
+ (NSString *) base64EncodingWithLineLength:(NSData*) data lineLength: (unsigned int) lineLength;
+ (NSData *) base64Decoding:(NSString*) string;
+ (NSString *)convertToPinYin:(NSString *)str;//David added 18/03/2016

//  Add new by Khai Le on 25/10/2017
+ (NSDictionary *)convertToDictionaryFromJsonString: (NSString *)payload;
+ (NSString *)convertDictionaryToJsonString:(NSDictionary *)dictionary;
+ (NSString *)getGroupIdFromString: (NSString *)groupString;

//  Add new by Khai Le on 07/11/2017
+ (NSString *)transformedValue:(double)convertedValue;
+ (NSString *)getFullGroupIdFromString: (NSString *)groupString;

//  Add new by Khai Le on 30/11/2017
+ (NSString *)getValueOfKey: (NSString *)key fromString: (NSString *)string;

//  [Khai le - 31/20/2018]
+ (NSString*)decodeURLString: (NSString *)urlStr;
//Add new by Tran Toan 06/06/2019.
+ (TARGET_APP)flagTarget;
+ (BOOL)MCUVersionSupport:(NSString *)ver;
// Add new by Thanh Nguyen on 06/11/2019
+ (BOOL)detectAPIVersionForCheckPasswordMeeting:(NSString *)apiVersion;
+(BOOL)string:(NSString*)str1 isGreaterThanOrEqualToString:(NSString*)str2;
+ (BOOL)getInitResolutionFirstTime;
+ (void)setInitResolutionFirstTime:(BOOL)value;
+ (NSString *)ngnUniqueString ;
+ (BOOL)targetSupportRemoteGuidance;

+ (NSDictionary*) getQueryParameters: (NSURL*) url;
+ (NSString*) getQueryAfterRemoveKeys: (NSURL*) url withKeys: (NSArray*) keys;
+ (NSString*) decodeUriData: (NSString*) encryptContent;
@end
