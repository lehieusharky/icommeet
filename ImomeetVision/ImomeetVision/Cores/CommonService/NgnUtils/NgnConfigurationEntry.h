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

#ifndef NGNCONFIGURATIONENTRY_H
#define NGNCONFIGURATIONENTRY_H

//#define IMOMEET_LITE			1
//#define IMOMEET_CHINATELECOM	1
//#define SXT_VERSION		1
//#define VODAFONE_VERSION	1

#define PCSCF_DISCOVERY_DNS_SRV @"DNS_NAPTR_SRV"

#pragma mark - GENERAL
#define GENERAL_AUTOSTART @"GENERAL_AUTOSTART"
#define GENERAL_SHOW_WELCOME_SCREEN @"GENERAL_SHOW_WELCOME_SCREEN"
#define GENERAL_FULL_SCREEN_VIDEO @"GENERAL_FULL_SCREEN_VIDEO"
#define GENERAL_USE_FFC @"GENERAL_USE_FFC"
#define GENERAL_INTERCEPT_OUTGOING_CALLS @"GENERAL_INTERCEPT_OUTGOING_CALLS"
#define GENERAL_VIDEO_FLIP @"GENERAL_VIDEO_FLIP"
#define GENERAL_AUDIO_PLAY_LEVEL @"GENERAL_AUDIO_PLAY_LEVEL"
#define GENERAL_ENUM_DOMAIN @"GENERAL_ENUM_DOMAIN"
#define GENERAL_SEND_DEVICE_INFO @"GENERAL_SEND_DEVICE_INFO"

#pragma mark - IDENTITY
#define IDENTITY_DISPLAY_NAME @"IDENTITY_DISPLAY_NAME"
#define IDENTITY_IMPU @"IDENTITY_IMPU_2"
#define IDENTITY_IMPI @"IDENTITY_IMPI"
#define IDENTITY_PASSWORD_MD5 @"IDENTITY_PASSWORD_MD5"
#define REMEMBER_IDENTITY_PASSWORD	@"REMEMBER_IDENTITY_PASSWORD"
#define IDENTITY_OAUTH_USER  @"IDENTITY_OAUTH_USER"
#define IDENTITY_OAUTH_PASSWORD  @"IDENTITY_OAUTH_PASSWORD"
#define IDENTITY_API_VERSION @"IDENTITY_API_VERSION"
//David Added
#define IDENTITY_ACCOUNT_EMAIL @"ACCOUNT_EMAIL"
#define IDENTITY_ACCOUNT_PHONE_NUMBER @"IDENTITY_ACCOUNT_PHONE_NUMBER"
#define IDENTITY_ACCOUNT_GENDER @"IDENTITY_ACCOUNT_GENDER"
#define IDENTITY_ACCOUNT_LOCATION @"IDENTITY_ACCOUNT_LOCATION"
#define IDENTITY_ACCOUNT_USER_TITLE @"IDENTITY_ACCOUNT_USER_TITLE"
//Ryan added, May 2016
#define IDENTITY_ACCOUNT_POSITION_TITLE @"IDENTITY_ACCOUNT_POSITION_TITLE"

#pragma mark - NETWORK
#define NETWORK_REGISTRATION_TIMEOUT @"NETWORK_REGISTRATION_TIMEOUT"
#define NETWORK_REALM @"NETWORK_REALM"
#define NETWORK_SERVER @"NETWORK_SERVER"
#define NETWORK_SECURE @"NETWORK_SECURE"
#define NETWORK_USE_WIFI @"NETWORK_USE_WIFI"
#define NETWORK_USE_3G @"NETWORK_USE_3G"
#define NETWORK_USE_4G @"NETWORK_USE_4G"
#define NETWORK_USE_EARLY_IMS @"NETWORK_USE_EARLY_IMS"
#define NETWORK_IP_VERSION @"NETWORK_IP_VERSION"
#define NETWORK_PCSCF_DISCOVERY @"NETWORK_PCSCF_DISCOVERY"
#define NETWORK_PCSCF_DISCOVERY_USE_DNS @"NETWORK_PCSCF_DISCOVERY_USE_DNS"
#define NETWORK_PCSCF_DISCOVERY_USE_DHCP @"NETWORK_PCSCF_DISCOVERY_USE_DHCP"
#define NETWORK_PCSCF_HOST @"NETWORK_PCSCF_HOST_2"
#define NETWORK_PCSCF_PORT @"NETWORK_PCSCF_PORT"
#define NETWORK_USE_SIGCOMP @"NETWORK_USE_SIGCOMP"
#define NETWORK_USE_SIGBBQ @"NETWORK_USE_SIGBBQ"
#define NETWORK_USE_KEEPAWAKE @"NETWORK_USE_KEEPAWAKE"
#define NETWORK_TRANSPORT @"NETWORK_TRANSPORT"
#define NETWORK_WEBSERVER_LOGIN	@"NETWORK_WEBSERVER"
#define NETWORK_XMPP_SERVER_PORT @"NETWORK_XMPP_SERVER_PORT"
#define NETWORK_XMPP_SERVER_STR @"NETWORK_XMPP_SERVER_STR"
#define NEW_MEETING_API_CHANGE	@"NEW_MEETING_API_CHANGE"
#define NEW_MEETING_API_SERVER	@"NEW_MEETING_API_SERVER"
#define NETWORK_WEBSERVICE_PORT	@"NETWORK_WEBSERVICE_PORT"
#define SIP_OVER_TLS_PROXY_VALUE @"SIP_OVER_TLS_PROXY_VALUE"
#define NETWORK_SIP_OVER_TLS @"NETWORK_SIP_OVER_TLS"
#define STR_NETWORK_SIP_OVER_TLS @"STR_NETWORK_SIP_OVER_TLS"

#define NETWORK_PROXY_TYPE @"NETWORK_PROXY_TYPE"
#define NETWORK_PROXY_HOST @"NETWORK_PROXY_HOST"
#define NETWORK_PROXY_PORT @"NETWORK_PROXY_PORT"
#define NETWORK_PROXY_USER @"NETWORK_PROXY_USER"
#define NETWORK_PROXY_PASS @"NETWORK_PROXY_PASS"

#pragma mark - NAT
#define NATT_HACK_AOR @"NATT_HACK_AOR"
#define NATT_HACK_AOR_TIMEOUT @"NATT_HACK_AOR_TIMEOUT"
#define NATT_USE_STUN @"NATT_USE_STUN" // @deprecated
#define NATT_USE_STUN_FOR_SIP NATT_USE_STUN // must be named like this for backward compatibility
#define NATT_USE_STUN_FOR_ICE @"NATT_USE_STUN_FOR_ICE"
#define NATT_USE_TURN_FOR_ICE @"NATT_USE_TURN_FOR_ICE"
#define NATT_USE_ICE @"NATT_USE_ICE"
#define NATT_STUN_DISCO @"NATT_STUN_DISCO"
#define NATT_USE_STUN_DISCO @"NATT_USE_STUN_DISCO"
#define NATT_STUN_SERVER @"NATT_STUN_SERVER"
#define NATT_STUN_PORT @"NATT_STUN_PORT"
#define NATT_STUN_USERNAME @"NATT_STUN_USERNAME"
#define NATT_STUN_PASSWORD @"NATT_STUN_PASSWORD"

#pragma mark - TURN
#define DEFAULT_MISC_TURN_USERNAME      @"ninefingers"
#define DEFAULT_MISC_TURN_PASSWORD      @"youhavetoberealistic"
#define DEFAULT_TURN_SERVER             @""
#pragma mark - NTP
#define DEFAULT_NTP_SERVER      @""

#pragma mark - QOS
#define QOS_PRECOND_BANDWIDTH @"QOS_PRECOND_BANDWIDTH"
#define QOS_PRECOND_STRENGTH @"QOS_PRECOND_STRENGTH"
#define QOS_PRECOND_TYPE @"QOS_PRECOND_TYPE"
#define QOS_REFRESHER @"QOS_REFRESHER"
#define QOS_SIP_CALLS_TIMEOUT @"QOS_SIP_CALLS_TIMEOUT"
#define QOS_SIP_SESSIONS_TIMEOUT @"QOS_SIP_SESSIONS_TIMEOUT"
#define QOS_USE_SESSION_TIMERS @"QOS_USE_SESSION_TIMERS"


// Media
#define MEDIA_PROFILE @"MEDIA_PROFILE"
#define MEDIA_PREFERRED_VIDEO_SIZE @"MEDIA_PREFERRED_VIDEO_SIZE"
#define MEDIA_VIDEO_USE_ZERO_ARTIFACTS @"MEDIA_VIDEO_USE_ZERO_ARTIFACTS"
#define MEDIA_CODECS @"MEDIA_CODECS"
#define MEDIA_CODEC_USE_OPUS @"MEDIA_CODEC_USE_OPUS"
#define MEDIA_CODEC_USE_G722 @"MEDIA_CODEC_USE_G722"
#define MEDIA_CODEC_USE_G729AB @"MEDIA_CODEC_USE_G729AB"
#define MEDIA_CODEC_USE_AMR_NB_OA @"MEDIA_CODEC_USE_AMR_NB_OA"
#define MEDIA_CODEC_USE_AMR_NB_BE @"MEDIA_CODEC_USE_AMR_NB_BE"
#define MEDIA_CODEC_USE_GSM @"MEDIA_CODEC_USE_GSM"
#define MEDIA_CODEC_USE_PCMA @"MEDIA_CODEC_USE_PCMA"
#define MEDIA_CODEC_USE_PCMU @"MEDIA_CODEC_USE_PCMU"
#define MEDIA_CODEC_USE_SPEEX_NB @"MEDIA_CODEC_USE_SPEEX_NB"
#define MEDIA_CODEC_USE_SPEEX_WB @"MEDIA_CODEC_USE_SPEEX_WB"
#define MEDIA_CODEC_USE_SPEEX_UWB @"MEDIA_CODEC_USE_SPEEX_UWB"
#define MEDIA_CODEC_USE_OPUS @"MEDIA_CODEC_USE_OPUS"
#define MEDIA_CODEC_USE_OPUS16 @"MEDIA_CODEC_USE_OPUS16"

//#define MEDIA_CODEC_USE_OPUS16k @"MEDIA_CODEC_USE_OPUS16k"


#define MEDIA_CODEC_USE_VP8 @"MEDIA_CODEC_USE_VP8"
#define MEDIA_CODEC_USE_VP9 @"MEDIA_CODEC_USE_VP9"
#define MEDIA_CODEC_USE_RTX @"MEDIA_CODEC_USE_RTX"
#define MEDIA_CODEC_USE_FEC @"MEDIA_CODEC_USE_FEC"
#define MEDIA_CODEC_USE_RED @"MEDIA_CODEC_USE_RED"

#define MEDIA_CODEC_USE_H265BP @"MEDIA_CODEC_USE_H265BP"

#define MEDIA_CODEC_USE_H263 @"MEDIA_CODEC_USE_H263"
#define MEDIA_CODEC_USE_H263P @"MEDIA_CODEC_USE_H263P"
#define MEDIA_CODEC_USE_H264BP @"MEDIA_CODEC_USE_H264BP"
#define MEDIA_CODEC_USE_H264MP @"MEDIA_CODEC_USE_H264MP"
#define MEDIA_CODEC_USE_H264BP10 MEDIA_CODEC_USE_H264BP // deprecated
#define MEDIA_CODEC_USE_H264BP20 MEDIA_CODEC_USE_H264BP // deprecated
#define MEDIA_CODEC_USE_H264BP30 MEDIA_CODEC_USE_H264BP // deprecated


#define MEDIA_CODEC_USE_THEORA @"MEDIA_CODEC_USE_THEORA"
#define MEDIA_CODEC_USE_MP4VES @"MEDIA_CODEC_USE_MP4VES"
#define MEDIA_AUDIO_OPUS_MAXCAPTURERATE @"MEDIA_AUDIO_OPUS_MAXCAPTURERATE"
#define MEDIA_AUDIO_OPUS_MAXPLAYBACKRATE @"MEDIA_AUDIO_OPUS_MAXPLAYBACKRATE"
#define MEDIA_AUDIO_RESAMPLER_QUALITY @"MEDIA_AUDIO_RESAMPLER_QUALITY"
#define MEDIA_AUDIO_CONSUMER_GAIN @"MEDIA_AUDIO_CONSUMER_GAIN"
#define MEDIA_AUDIO_PRODUCER_GAIN @"MEDIA_AUDIO_PRODUCER_GAIN"
#define MEDIA_AUDIO_CONSUMER_ATTENUATION @"MEDIA_AUDIO_CONSUMER_ATTENUATION"
#define MEDIA_AUDIO_PRODUCER_ATTENUATION @"MEDIA_AUDIO_PRODUCER_ATTENUATION"

#define MEDIA_VIDEO_BANDWIDTH	@"MEDIA_VIDEO_BANDWIDTH"
#define WLAN_MEDIA_VIDEO_BANDWIDTH	@"WLAN_MEDIA_VIDEO_BANDWIDTH_2"
#define MOBILE_MEDIA_VIDEO_BANDWIDTH	@"3G_MEDIA_VIDEO_BANDWIDTH_2"
#define WLAN_MEDIA_VIDEO_SIZE	@"WLAN_MEDIA_VIDEO_SIZE"
#define WLAN_MEDIA_VIDEO_SIZE_P2P	@"WLAN_MEDIA_VIDEO_SIZE_P2P"
#define WLAN_MEDIA_VIDEO_SIZE_MCU    @"WLAN_MEDIA_VIDEO_SIZE_MCU"
#define AUTO_MEDIA_VIDEO_SIZE	@"AUTO_MEDIA_VIDEO_SIZE"
#define CAMERA_FRAME_RATE       @"CAMERA_FRAME_RATE"
#define AUTO_MEDIA_VIDEO_SIZE_P2P	@"AUTO_MEDIA_VIDEO_SIZE_P2P"
#define MOBILE_MEDIA_VIDEO_SIZE	@"3G_MEDIA_VIDEO_SIZE"
#define CAMERA_FRAME_RATE_AUTO       100
#define MEDIA_VIDEO_HARDWARE_ENCODER	@"MEDIA_VIDEO_HARDWARE_ENCODER"

#define MEDIA_VIDEO_TRANSPORT_TCP		@"MEDIA_VIDEO_TRANSPORT_TCP_2"
#define MEDIA_AUDIO_TRANSPORT_TCP		@"MEDIA_AUDIO_TRANSPORT_TCP_2"

//quanghuynh added
#define MEDIA_AV_TRANSPORT_TCP		@"MEDIA_AV_TRANSPORT_TCP"
#define MEDIA_TRANSPORT_PROTOCOL    @"MEDIA_TRANSPORT_PROTOCOL"   //0 for AUTO, 1 for UDP, 2 for TCP
#define MCU_LAYOUT_STYLE @"MCU_LAYOUT_STYLE"
#define WEB_API_VERSION @"WEB_API_VERSION"

// Security
#define SECURITY_IMSAKA_AMF @"SECURITY_IMSAKA_AMF"
#define SECURITY_IMSAKA_OPID @"SECURITY_IMSAKA_OPID"
#define SECURITY_SSL_FILE_KEY_PRIV @"SECURITY_SSL_FILE_KEY_PRIV"
#define SECURITY_SSL_FILE_KEY_PUB @"SECURITY_SSL_FILE_KEY_PUB"
#define SECURITY_SSL_FILE_KEY_CA @"SECURITY_SSL_FILE_KEY_CA"
#define SECURITY_SSL_VERIFY @"SECURITY_SSL_VERIFY"
#define SECURITY_SRTP_MODE @"SECURITY_SRTP_MODE"
#define SECURITY_SRTP_TYPE @"SECURITY_SRTP_TYPE"

// XCAP
#define XCAP_PASSWORD @"XCAP_PASSWORD"
#define XCAP_USERNAME @"XCAP_USERNAME"
#define XCAP_ENABLED @"XCAP_ENABLED"
#define XCAP_XCAP_ROOT @"XCAP_XCAP_ROOT"

// RCS (Rich Communication Suite)
#define RCS_AVATAR_PATH @"RCS_AVATAR_PATH"
#define RCS_USE_BINARY_SMS @"RCS_USE_BINARY_SMS"
#define RCS_CONF_FACT @"RCS_CONF_FACT"
#define RCS_FREE_TEXT @"RCS_FREE_TEXT"
#define RCS_HACK_SMS @"RCS_HACK_SMS"
#define RCS_USE_MSRP_FAILURE @"RCS_USE_MSRP_FAILURE"
#define RCS_USE_MSRP_SUCCESS @"RCS_USE_MSRP_SUCCESS"
#define RCS_USE_MWI @"RCS_USE_MWI"
#define RCS_USE_OMAFDR @"RCS_USE_OMAFDR"
#define RCS_USE_PARTIAL_PUB @"RCS_USE_PARTIAL_PUB"
#define RCS_USE_PRESENCE @"RCS_USE_PRESENCE"
#define RCS_USE_RLS @"RCS_USE_RLS"
#define RCS_SMSC @"RCS_SMSC"
#define RCS_STATUS  @"RCS_STATUS"
#define RCS_AUTO_ACCEPT_PAGER_MODE_IM	@"RCS_AUTO_ACCEPT_PAGER_MODE_IM"

// Messages Chat

#define MSG_ENTER_TO_SEND_MESSAGE	@"MSG_ENTER_TO_SEND_MESSAGE"

// Notifical

#define NTC_ALLOW_PLAY_TONE @"NTC_ALLOW_PLAY_TONE"
#define NTC_ALLOW_VIBRATE_DEVICE	@"NTC_ALLOW_VIBRATE_DEVICE"
#define NTC_ALLOW_PREVIEW_MESSAGE	@"NTC_ALLOW_PREVIEW_MESSAGE"
#define NTC_ALLOW_HIDE_NOTIFICATION_CONTENT @"NTC_ALLOW_HIDE_NOTIFICATION_CONTENT"

// TimeOut

#define DEV_OPTION_INCOMING_DATA_TIMEOUT    @"DEV_OPTION_INCOMING_DATA_TIMEOUT"

//
//      Default values
//

// General
#define DEFAULT_GENERAL_SHOW_WELCOME_SCREEN YES
#define DEFAULT_GENERAL_FULL_SCREEN_VIDEO YES
#define DEFAULT_GENERAL_INTERCEPT_OUTGOING_CALLS YES
#define DEFAULT_GENERAL_USE_FFC YES
#define DEFAULT_GENERAL_FLIP_VIDEO NO
#define DEFAULT_GENERAL_AUTOSTART YES
#define DEFAULT_GENERAL_AUDIO_PLAY_LEVEL 0.25f
#define DEFAULT_GENERAL_ENUM_DOMAIN @"e164.org"
#define DEFAULT_GENERAL_SEND_DEVICE_INFO	NO

//      Identity
#define DEFAULT_IDENTITY_DISPLAY_NAME @""
#define DEFAULT_IDENTITY_IMPU @""
#define DEFAULT_IDENTITY_IMPI @""
#define DEFAULT_IDENTITY_PASSWORD @""
#define DEFAULT_REMEMBER_IDENTITY_PASSWORD	YES

// Network
//1800
#define DEFAULT_NETWORK_REGISTRATION_TIMEOUT 3600
#define DEFAULT_NETWORK_REALM @"mm.world-telephone.com"
#define DEFAULT_NETWORK_PCSCF_PORT 5088
#define DEFAULT_WEBSERVER_IP	@"http://www.sfvmeet.com"
#define DEFAULT_WEBSERVER_PORT	80
#define DEFAULT_WEBSERVER_HTTPS_PORT	443
#define DEFAULT_NETWORK_TRANSPORT @"tcp"
#define DEFAULT_NEW_MEETING_API_CHANGE NO
#define DEFAULT_NEW_MEETING_API_SERVER @"htpp://113.161.98.42:9000/api"
#define DEFAULT_WEB_API_VERSION 0



#define DEFAULT_NETWORK_USE_WIFI YES
#define DEFAULT_NETWORK_USE_3G YES
#define DEFAULT_NETWORK_PCSCF_DISCOVERY @"None"
#define DEFAULT_NETWORK_PCSCF_HOST @""
#define DEFAULT_NETWORK_USE_SIGCOMP NO

#define DEFAULT_NETWORK_USE_SIGBBQ NO

#define DEFAULT_NETWORK_PCSCF_DISCOVERY_USE_DNS NO
#define DEFAULT_NETWORK_PCSCF_DISCOVERY_USE_DHCP NO

#define DEFAULT_NETWORK_USE_KEEPAWAKE NO



#define DEFAULT_NETWORK_IP_VERSION @"ipv4"
#define DEFAULT_NETWORK_USE_EARLY_IMS NO

#define DEFAULT_NETWORK_XMPP_SERVER_PORT @"80"
#define DEFAULT_NETWORK_XMPP_SERVER_STR @"chat.sfvmeet.com"

// NAT Traversal
#define DEFAULT_NATT_HACK_AOR_TIMEOUT 2000
#define DEFAULT_NATT_HACK_AOR NO
#define DEFAULT_NATT_USE_STUN NO
#define DEFAULT_NATT_USE_ICE NO
#define DEFAULT_NATT_STUN_DISCO NO
#define DEFAULT_NATT_USE_STUN_DISCO NO

#define DEFAULT_NATT_USE_STUN_FOR_SIP NO
#define DEFAULT_NATT_USE_STUN_FOR_ICE YES
#define DEFAULT_NATT_USE_TURN_FOR_ICE NO

#pragma mark - STUN DEFAULT
#define DEFAULT_NATT_STUN_SERVER @"stun.world-telephone.com"
#define DEFAULT_NATT_STUN_PORT 3478
#define DEFAULT_NATT_STUN_USERNAME @""
#define DEFAULT_NATT_STUN_PASSWORD @""
#define DEFAULT_STUN_SERVER @"stun.l.google.com:19302;stun1.l.google.com:19302;stun2.l.google.com:19302;stun3.l.google.com:19302"

// QoS
#define DEFAULT_QOS_PRECOND_BANDWIDTH @"Low"
//#define DEFAULT_QOS_PRECOND_STRENGTH tmedia_qos_strength_t.tmedia_qos_strength_none.toString()
//#define DEFAULT_QOS_PRECOND_TYPE tmedia_qos_stype_t.tmedia_qos_stype_none.toString()
#define DEFAULT_QOS_REFRESHER @"none"
#define DEFAULT_QOS_SIP_SESSIONS_TIMEOUT 600000
#define DEFAULT_QOS_SIP_CALLS_TIMEOUT 3600
#define DEFAULT_QOS_USE_SESSION_TIMERS NO

// Media
#define kDefaultMediaProfile_Default 0
#define kDefaultMediaProfile_RTCWeb 1

#define kDefaultMediaVsize_sqcif 100
#define kDefaultMediaVsize_qcif 1
#define kDefaultMediaVsize_qvga 2
#define kDefaultMediaVsize_cif 3
#define kDefaultMediaVsize_hvga 4
#define kDefaultMediaVsize_vga 5
#define kDefaultMediaVsize_4cif 6
#define kDefaultMediaVsize_svga 7
#define kDefaultMediaVsize_480p 8
#define kDefaultMediaVsize_720p 9
#define kDefaultMediaVsize_16cif 10
#define kDefaultMediaVsize_1080p 11

#define DEFAULT_MEDIA_PROFILE kDefaultMediaProfile_Default
#define DEFAULT_MEDIA_PREFERRED_VIDEO_SIZE kDefaultMediaVsize_cif

#define DEFAULT_MEDIA_VIDEO_USE_ZERO_ARTIFACTS NO

#define DEFAULT_MEDIA_CODECS -1
#define DEFAULT_MEDIA_CODEC_USE_G722 NO
#define DEFAULT_MEDIA_CODEC_USE_G729AB NO
#define DEFAULT_MEDIA_CODEC_USE_AMR_NB_OA NO
#define DEFAULT_MEDIA_CODEC_USE_AMR_NB_BE NO
#define DEFAULT_MEDIA_CODEC_USE_GSM NO
#define DEFAULT_MEDIA_CODEC_USE_PCMA NO
#define DEFAULT_MEDIA_CODEC_USE_PCMU NO

#define DEFAULT_MEDIA_CODEC_USE_SPEEX_NB NO
#define DEFAULT_MEDIA_CODEC_USE_SPEEX_WB NO
#define DEFAULT_MEDIA_CODEC_USE_SPEEX_UWB NO

#define DEFAULT_MEDIA_CODEC_USE_OPUS NO
#define DEFAULT_MEDIA_CODEC_USE_OPUS16 YES
#define DEFAULT_MEDIA_CODEC_USE_VP8 NO
#define DEFAULT_MEDIA_CODEC_USE_VP9 YES
#define DEFAULT_MEDIA_CODEC_USE_RTX YES
#define DEFAULT_MEDIA_CODEC_USE_FEC YES
#define DEFAULT_MEDIA_CODEC_USE_RED YES

#define DEFAULT_MEDIA_CODEC_USE_H263 NO
#define DEFAULT_MEDIA_CODEC_USE_H263P NO
#define DEFAULT_MEDIA_CODEC_USE_H264BP YES
#define DEFAULT_MEDIA_CODEC_USE_H264MP NO

#define DEFAULT_MEDIA_CODEC_USE_H265BP YES

#define DEFAULT_MEDIA_CODEC_USE_H264BP10 NO
#define DEFAULT_MEDIA_CODEC_USE_H264BP20 NO
#define DEFAULT_MEDIA_CODEC_USE_H264BP30 NO

#define DEFAULT_MEDIA_CODEC_USE_THEORA NO
#define DEFAULT_MEDIA_CODEC_USE_MP4VES NO

#define DEFAULT_MEDIA_AUDIO_OPUS_MAXCAPTURERATE     16000
#define DEFAULT_MEDIA_AUDIO_OPUS_MAXPLAYBACKRATE    16000
#define DEFAULT_MEDIA_AUDIO_RESAMPLER_QUALITY 0
#define DEFAULT_MEDIA_AUDIO_CONSUMER_GAIN 0 // disabled
#define DEFAULT_MEDIA_AUDIO_PRODUCER_GAIN 0 // disabled
#define DEFAULT_MEDIA_AUDIO_CONSUMER_ATTENUATION 1.f // disabled
#define DEFAULT_MEDIA_AUDIO_PRODUCER_ATTENUATION 1.f // disabled

#define DEFAULT_MEDIA_VIDEO_BANDWIDTH	64
#define DEFAULT_WWAN_MEDIA_VIDEO_BANDWIDTH	384
#define DEFAULT_WLAN_MEDIA_VIDEO_BANDWIDTH	384
#define DEFAULT_WWAN_MEDIA_VIDEO_SIZE	0			// Auto QCIF
#define DEFAULT_AUTO_MEDIA_VIDEO_SIZE   1
#define DEFAULT_WLAN_MEDIA_VIDEO_SIZE	0			// CIF, VGA, HD
#define DEFAULT_AUTO_MEDIA_VIDEO_SIZE_P2P   1       // CIF, VGA, HD->0,1,2
#define DEFAULT_CAMERA_FRAME_RATE           0      // 15,25,30fps->0,1,2
#define DEFAULT_WLAN_MEDIA_VIDEO_SIZE_P2P	1

#define DEFAULT_MEDIA_VIDEO_HARDWARE_ENCODER	3	// 3High Profile Hardware Encoder
#define DEFAULT_MEDIA_VIDEO_TRANSPORT_TCP	NO
#define DEFAULT_MEDIA_AUDIO_TRANSPORT_TCP	NO
#define DEFAULT_MEDIA_AV_TRANSPORT_TCP      NO
//quanghuynh added
#define DEFAULT_MEDIA_TRANSPORT_PROTOCOL    1 //0 for AUTO, 1 for UDP, 2 for TCP

// Security
#define kDefaultSecuritySRtpMode_None 0
#define kDefaultSecuritySRtpMode_Optional 1
#define kDefaultSecuritySRtpMode_Mandatory 2
#define kDefaultSecuritySRtpType_Sdes 0
#define kDefaultSecuritySRtpType_Dtls 1
#define kDefaultSecuritySRtpType_Both 2

#define DEFAULT_SECURITY_SSL_VERIFY NO

#define DEFAULT_SECURITY_IMSAKA_AMF @"0x0000"
#define DEFAULT_SECURITY_IMSAKA_OPID @"0x00000000000000000000000000000000"
#define DEFAULT_SECURITY_SSL_FILE_KEY_PRIV @""
#define DEFAULT_SECURITY_SSL_FILE_KEY_PUB @""
#define DEFAULT_SECURITY_SSL_FILE_KEY_CA @""
#define DEFAULT_SECURITY_SRTP_MODE kDefaultSecuritySRtpMode_None
#define DEFAULT_SECURITY_SRTP_TYPE kDefaultSecuritySRtpType_Sdes


// XCAP
#define DEFAULT_XCAP_ENABLED NO
#define DEFAULT_XCAP_ROOT @"http://softfoundry.com:8080/services"
#define DEFAULT_XCAP_USERNAME @"sip:momeet@softfoundry.com"
#define DEFAULT_XCAP_PASSWORD @""

// RCS (Rich Communication Suite)
#define DEFAULT_RCS_AVATAR_PATH @""
#define DEFAULT_RCS_USE_BINARY_SM NO
#define DEFAULT_RCS_CONF_FACT @"sip:Conference-Factory@softfoundry.com"
#define DEFAULT_RCS_FREE_TEXT @"Hello world"
#define DEFAULT_RCS_HACK_SMS NO
#define DEFAULT_RCS_USE_MSRP_FAILURE YES
#define DEFAULT_RCS_USE_MSRP_SUCCESS NO
#define DEFAULT_RCS_USE_BINARY_SMS NO
#define DEFAULT_RCS_USE_MWI NO
#define DEFAULT_RCS_USE_OMAFDR NO
#define DEFAULT_RCS_USE_PARTIAL_PUB NO
#define DEFAULT_RCS_USE_PRESENCE NO
#define DEFAULT_RCS_USE_RLS NO
#define DEFAULT_RCS_SMSC @"sip:+331000000000@softfoundry.com"
// static const NgnPresenceStatus DEFAULT_RCS_STATUS NgnPresenceStatus.Online
#define DEFAULT_RCS_AUTO_ACCEPT_PAGER_MODE_IM YES

// Messages Chat

#define DEFAULT_MSG_ENTER_TO_SEND_MESSAGE NO

// Notifical

#define DEFAULT_NTC_ALLOW_PLAY_TONE YES
#define DEFAULT_NTC_ALLOW_VIBRATE_DEVICE	YES
#define DEFAULT_NTC_ALLOW_PREVIEW_MESSAGE	NO
#define DEFAULT_NTC_ALLOW_HIDE_NOTIFICATION_CONTENT NO

// TimeOut

#define DEFAULT_DEV_OPTION_INCOMING_DATA_TIMEOUT    7

//  [Khai le - 12/11/2018]
#define WEB_SERVER @"WEB_SERVER"
#define XPERT_WORK_SERVER @"KXPERT_WORK_SERVER"
//update by TranToan 08/06/2020.
#define VIDEO_QCIF_SIZE (CGSizeMake(176, 144))
#define VIDEO_CIF_SIZE (CGSizeMake(352, 288))
#define VIDEO_VGA_SIZE (CGSizeMake(640, 480))
#define VIDEO_HD_SIZE (CGSizeMake(1280, 720))
#define VIDEO_FHD_SIZE (CGSizeMake(1920, 1080))
#define VIDEO_2K_SIZE (CGSizeMake(2048, 1080))
#define VIDEO_4K_SIZE (CGSizeMake(3840, 2160))

// Add new by Thanh Nguyen on 15/07/2019
#define kUserDefaultGroupId      @"kUserDefaultGroupId"
#define kUserDefaultMeetingId    @"kUserDefaultMeetingId"
#define kUserDefaultExtraMTag    @"kUserDefaultExtraMTag"

#define kCurrentAppversionHeader    @"4"
#define TRANSFER_MEDIA_VIA_PROXY_SERVER @"KTRANSFER_MEDIA_VIA_PROXY_SERVER"
#define TRANSFER_MEDIA_USING_TCP_PROTOCOL @"KTRANSFER_MEDIA_USING_TCP_PROTOCOL"
#define DIFFSYNC_FEATURE_SUPPORT @"DIFFSYNC_FEATURE_SUPPORT"
#define CODEC_QUANTIZIZE_PARAMS @"CODEC_QUANTIZIZE_PARAMS"
#define AUTO_TRANSLATE @"AUTO_TRANSLATE"
#endif /* NGNCONFIGURATIONENTRY_H *///Diffsync feature support
