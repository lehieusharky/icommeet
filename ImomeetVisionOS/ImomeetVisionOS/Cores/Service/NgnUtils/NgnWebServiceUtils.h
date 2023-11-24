//
//  NgnWebServiceUtils.h
//  ios-ngn-stack
//
//  Created by Wu Hailong on 13-7-3.
//  Copyright (c) 2013年 Doubango Telecom. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int NgnWebServiceRet;
#define NGN_WEBSERVICE_RESULT_OK    0
#define NGN_WEBSERVICE_RESULT_FAIL    1
#define NGN_WEBSERVICE_RESULT_AUTH    2
#define NGN_WEBSERVICE_RESULT_SERVER_NORET    3

#define NGN_CONFERENCE_INVALID_TIME    6010
#define NGN_CONFERENCE_NO_ROOM        6020
#define NGN_HAVE_CONFERENCE_ERROR    6050
#define NGN_MEETING_NOTCHAIR_ERROR    6060
#define NGN_MEETING_EXISTS_ERROR    6070
#define NGN_MEETING_CLOSED_ERROR    6080
#define NGN_MEETING_NOTIFY_ERROR    6090
#define NGN_MEETING_NO_VOIP_ACCESS_ERROR    7010

@interface NgnURLConnection : NSObject<NSURLConnectionDataDelegate, NSURLConnectionDelegate>
{
    NSURLRequest*     _request;
    NSURLConnection* _connection;
@private
    id            _delegate;
    NSCondition* _condition;
    BOOL         _finished;
    BOOL        _success;
    BOOL        _cancelled;
    BOOL        _noKeepData;
    NSURLResponse* _response;
    NSMutableData* _data;
    NSError* _error;
    
    NSThread* _connectonThread;
}
@property(readonly, strong) NSURLConnection* connection;
@property(readonly) BOOL cancelled;
@property(readonly, strong) NSURLResponse* response;
@property(readonly, strong) NSData* data;
@property(readonly, strong) NSError* error;
@property(readwrite) BOOL noKeepData;


- (id) initWithRequest: (NSURLRequest *)request delegate:(id)delegate;
- (void) start;
- (void) cancel;
- (BOOL) waitForFinsh;
+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error;
+ (NgnURLConnection*)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate;
+ (NgnURLConnection*)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate noKeepData: (BOOL)noKeepData;
@end

@interface NgnWebServiceUtils : NSObject
+ (dispatch_queue_t) serialQueue;
// Base
+ (NgnWebServiceRet) checkResult: (NSDictionary*) jsonResult;
+ (NSString*) getResultInfo: (NSDictionary*) jsonResult;

+ (NSDictionary*) postString: (NSString*)string url: (NSString*)url function: (NSString*)function;
+ (NSDictionary*) postDict: (NSDictionary*)dict url: (NSString*)url function: (NSString*)function;
+ (NSURLConnection*) asynPostString: (NSString*)string url: (NSString*)url delegate:(id)delegate;
+ (NSURLConnection*) asynPostDict: (NSDictionary*)dict url: (NSString*)url delegate:(id)delegate;

+ (NSDictionary*) postString: (NSString*)string url: (NSString*)url returningResponse:(NSURLResponse**)theResponse error: (NSError**)theError function: (NSString*)function;
+ (NSDictionary*) postString: (NSString*)string function: (NSString*)function;
+ (NSDictionary*) postDict: (NSDictionary*)dict function: (NSString*)function;
+ (NSURLConnection*) asynPostString: (NSString*)string delegate:(id)delegate;
+ (NSURLConnection*) asynPostDict: (NSDictionary*)dict delegate:(id)delegate;

//  Add new by Khai Le on 13/12/2017
+ (NSDictionary*)getString: (NSString*)string url: (NSString*)url function: (NSString*)function;

// this one function below is own by Ryan
+ (NSDictionary*) postStringAndDecompress: (NSString*)string url: (NSString*)url function: (NSString*)function;

// Profile
+ (NSDictionary*) getMyInfo;
+ (NSDictionary*) getUserList: (NSString*)keyword from:(NSString*)from to:(NSString*)to;
+ (NSDictionary*) changeMyNameWithPassEncrypted: (NSString*)name;
+ (NSDictionary*) changeMyPasswordWithEncrypt:(NSString*)oldPass withNewPassword:(NSString*)newPass;

+ (NSString *)getStringEncryptedFromDict:(NSDictionary *)dictPlanText;
+ (NSString *)getStringEncryptedFromString:(NSString *)strPlanText;
+ (NSString *)getStringDecryptedFromString:(NSString *)sourceString withVerifyCode:(NSString *)verifyCode;

+ (NSDictionary*) changeMyEmail: (NSString*)email;
+ (NSDictionary*) changeMyEmailWithPassEncrypted: (NSString*)email;
+ (NSDictionary*) changeMyPhoneNumberWithPassEncrypted: (NSString*)phoneNumber;
+ (NSDictionary*) changeMyAvataFile: (NSString*)filename;
+ (NSDictionary*) deleteMyAvata;
+ (NSData*) downloadAvatar: (NSString*)url;
+ (NSDictionary *) getuserInfo:(NSString *)userID;

// Contacts
+ (NSDictionary*) addContactByVmeetId: (NSString *)vmeet_id toGroup:(NSString *)group;
+ (NSDictionary*) deleteContactByVmeetId:(NSString *)vmeet_id;
+ (NSDictionary*) addContact: (NSString *)contact toGroup:(NSString *)group;
+ (NSDictionary*) deleteContact:(NSString *)contact;
+ (NSDictionary*) deleteContacts:(NSArray *)contacts;
+ (NSDictionary*) getAllVMEETContacts;
+ (NSDictionary*) deleteGroup:(NSString *)group;

// CUG Groups
+ (NSDictionary*) getAllVMEETCUGGroups;
+ (NSDictionary*) getAllVMEETCUGContactsInGroup: (NSString*)group;
+ (NSDictionary*) getCUGUserGoupTree; //Alton added 08/04/2015
+ (NSDictionary*) getCUGGoupUser: (NSString *)group; //Alton added 08/04/2015
+ (NSDictionary*) getCUGData; // added by Ryan 2016
+ (NSDictionary *)getAppVersionInfor;//Added by David 14/03/2016

// MCU Meeting
#pragma mark - MCU Meetings
+ (NSDictionary*) newWebAPIPostString: (NSString*)string url: (NSString*)url function: (NSString*)function;
+ (NSString *)newWebAPIGetStringEncryptedFromDict:(NSDictionary *)mulDict accessToken:(NSString*) token;
typedef void (^APISuccessBlock)(BOOL success,id responseObject);
+(void)getMeetingsFromRecent:(NSString *)recent_meeting recSize:(NSInteger) rec_size lastDay:(int)lastDay APISuccessCallback:(APISuccessBlock)callback;
//Add new by Tam Nguyen 04/08/2020
//+(void)getMeetingsFromEnded:(NSString *)ended_meeting recSize:(NSInteger) rec_size lastDay:(int)lastDay fromItem:(NSInteger)fromItem APISuccessCallback:(APISuccessBlock)callback;
+ (NSDictionary *)getMeetings;
+ (NSDictionary *)getMeetings:(NSString *)recent_meeting recSize:(NSInteger )rec_size;//Added by David 17/03/2016
+ (NSDictionary *)getMeetings:(NSString *)recent_meeting recSize:(NSInteger )rec_size lastDay:(int)lastDay;
+ (NSDictionary *)getMeetingInfo:(NSString *)meeting_id;
+ (NSDictionary *)getMeetingInfo:(NSString *)meeting_id withPasswordMD5:(NSString *)passwordMD5;
+ (NSDictionary *)createMeeting: (NSString*)strTopic :(NSString*)strDescription :(NSString*)chair :(NSString*)strPassword :(NSInteger)secondDuration :(NSInteger)timeZone :(BOOL)isStartNow :(NSString*)strStartDateTime :(BOOL)isSendSMS :(NSString*)str_vmeetid_list;
+ (NSDictionary *)createMeeting: (NSString*)strTopic :(NSString*)strDescription :(NSString*)chair :(NSString*)strPassword :(NSInteger)secondDuration :(NSInteger)timeZone :(BOOL)isStartNow :(NSString*)strStartDateTime :(BOOL)isSendSMS :(NSString*)str_vmeetid_list :(NSString *) audio_only;
+ (NSDictionary *)updateMeeting:(NSString*)strTopic
                    description:(NSString*)strDescription
                          chair:(NSString*)chair
                       password:(NSString*)strPassword
                       duration:(NSInteger)secondDuration
                       timezone:(NSInteger)timeZone
                     isStartNow:(BOOL)isStartNow
                  startDateTime:(NSString*)strStartDateTime
                      isSendSMS:(BOOL)isSendSMS
                    vmeetIDList:(NSString*)str_vmeetid_list
                      meetingId:(NSString *)meeting_id
                           mode:(NSString*)mode ;

+ (NSDictionary *)updateMeeting:(NSString*)strTopic
                      description:(NSString*)strDescription
                            chair:(NSString*)chair
                         password:(NSString*)strPassword
                         duration:(NSInteger)secondDuration
                         timezone:(NSInteger)timeZone
                       isStartNow:(BOOL)isStartNow
                    startDateTime:(NSString*)strStartDateTime
                        isSendSMS:(BOOL)isSendSMS
                      vmeetIDList:(NSString*)str_vmeetid_list
                        meetingId:(NSString *)meeting_id
                        isAudio:(NSString *) audio_only
                           mode:(NSString*)mode ;

+ (NSDictionary *)cancelMeeting:(NSString *)meeting_id;
+ (NSDictionary *)deleteMeeting:(NSString *)meeting_id;
+ (NSDictionary *)inviteParticipant:(NSString *)participant intoMeeting: (NSString*)meeting_id andRole: (int)nRole;
+ (NSDictionary *)inviteParticipants:(NSArray *)participants intoMeeting: (NSString*)meeting_id andRole: (int)nRole;
+ (NSDictionary *)haveOngoingMeetings;

+ (NSString*)getIPWithHostName:(const NSString*)hostName;

//  Add new by Khai Le on 27/08/2018:
+ (NSDictionary *)extendMeetingDuration: (NSString*)meetingID addTime: (long)addTime fromUserId: (NSString *)userId;

#pragma mark - Saving data.

+ (NSString *)getRootGroupIdKey;
+ (NSString *)getMeetingIdKey;
+ (NSString *)getExtraMTagKey;
+ (void)saveRootGroupIdKeyWithValue:(NSString *)newRootGroupId;
+ (void)saveMeetingIdKeyWithValue:(NSString *)meetingId;
+ (void)saveExtraMTagKeyWithValue:(NSString *)extraMTag;
+ (void)resetMeetingIdKey;
+ (void)resetExtraMTagKey;

+ (void)saveAccessToken:(NSString *)access_token;
+ (NSString *)getAccessToken;
+ (BOOL)isGreaterThanOrEqualToAPI603;
+ (BOOL)isGreaterThanOrEqualToAPI610;
@end

