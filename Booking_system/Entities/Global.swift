//
//  Global.swift
//  SwiftDemo
//
//  Created by TopsTech on 02/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.


struct Global {
    
    // API base Url
    static let g_APIBaseURL = "http://192.168.0.19/lyst_app/trunk/ws/"
    
    //static let g_APIBaseURL = "http://topsdemo.co.in/webservices/lyst_app/ws/"
    
    static let appdel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    static let iceBreackerArray:NSMutableArray = NSMutableArray()
    static var arrInApp_purchased:NSMutableArray = NSMutableArray()
    static let arrReminder:NSMutableArray = NSMutableArray()
    static let DailyLikeCount:Int = 20
    static let DailyWaitListCount:Int = 20
    static var serverDate:NSDate!
    static var receipt1:NSData!
    
    //Instagram
    static let IGretunURL =  "http://topsdemo.in/"
    
    struct g_UserData {
        static let USERID = "id"
        static let FB_USERID = "FBid"
        static let LD_USERID = "LDid"
        static let IN_USERID = "INid"
        static let USERPASSWORD = "password"
        static let USEREMAIL = "EmailAddress"
        static let USERFIRSTNAME = "FirstName"
        static let USERLASTNAME = "Surname"
        static let USERNAME = "Username"
        static let USERWEBSITEURL = "WebsiteUrl"
        static let USER_DOB = "DOB"
        static let USER_IS_PROFILE_COMPETE = "is_profile_complete"
        
        static let USER_AGE_MAX = "age_maximun"
        static let USER_AGE_MIN = "age_minimum"//
        static let USER_DISTANCE = "distance"
        static let USER_SHOW = "user_show"
        
        static let USERGENDER = "gender"
        static let USER_STATUS = "status"
        static let USER_ABOUT = "about"
        static let USER_DESIGNATION = "designation"
        static let USER_LOOKIN1 = "lookingfor1"
        static let USER_LOOKIN2 = "lookingfor2"
        static let USER_LOOKIN3 = "lookingfor3"
        static let USER_REFER1 = "referred1"
        static let USER_REFER2 = "referred2"
        static let USER_REFER3 = "referred3"
        static let USER_IMP1 = "important1"
        static let USER_IMP2 = "important2"
        static let USER_IMP3 = "important3"
        static let USERPROFILEIMAGEURL = "ProfileImageUrl"
        static let USER_SONG_ID = "song_id"
        static let USER_SONG_ONOFF = "song_on_off"
        static let USER_Hide_PROFILE = "hide_profile"
        static let USER_PUSH_ONOFF = "pushnotification_on"
        static let USER_LIKE_COUNT = "user_likeCount"
        static let USER_TOTAL_WAITLIST_COUNT = "total_wait_list_count"
        static let USER_WAITLIST_RANK = "user_waitList_rank"
        static let USER_RADIUS = "radius"
        static let USER_APP_IMAGE_BG = "user_imageBG_set_local"
        
        static let USER_TODAYLIKE_COUNT = "today_like_count"
        static let USER_TODAYWAITLIST_COUNT = "today_waitlist_count"
        
        static let USERPOSTCODE = "Postcode"
        static let USERPHONENO = "PhoneNo"
        static let USERPHONISPUBLIC = "PhoneNoPublic"
        static let USERPOSTCODEISPUBLIC = "PostcodePublic"
        static let USEREMAILISPUBLIC = "EmailAddressPublic"
        static let USERACCOUNTTYPE = "accounttype"
        
    }
    
    
    struct g_UserDefaultKey {
        static let latitude    = "latitude"
        static let longitude   = "longitude"
        static let DeviceToken = "DeviceToken"
        static let address     = "address"
        static let IS_USERLOGIN     = "USER_LOGIN"
        static let city     = "City"
    }
    
    struct directoryPath {
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    //Device Compatibility
    struct is_Device {
        static let _iPhone = (UIDevice.currentDevice().model as NSString).isEqualToString("iPhone") ? true : false
        static let _iPad = (UIDevice.currentDevice().model as NSString).isEqualToString("iPad") ? true : false
        static let _iPod = (UIDevice.currentDevice().model as NSString).isEqualToString("iPod touch") ? true : false
    }
    //IOS Version Compatibility
    struct is_Ios {
        static let _9 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 9.0) ? true : false
        static let _8 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0 && (UIDevice.currentDevice().systemVersion as NSString).floatValue < 9.0) ? true : false
        static let _7 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7.0 && (UIDevice.currentDevice().systemVersion as NSString).floatValue < 8.0) ? true : false
        static let _6 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue <= 6.0 ) ? true : false
    }
    
    //Display Size Compatibility
    struct is_Iphone {
        static let _6p = (UIScreen.mainScreen().bounds.size.height >= 736.0 ) ? true : false
        static let _6 = (UIScreen.mainScreen().bounds.size.height <= 667.0 && UIScreen.mainScreen().bounds.size.height > 568.0) ? true : false
        static let _5 = (UIScreen.mainScreen().bounds.size.height <= 568.0 && UIScreen.mainScreen().bounds.size.height > 480.0) ? true : false
        static let _4 = (UIScreen.mainScreen().bounds.size.height <= 480.0) ? true : false
    }
    
    struct inApp {
        
        //7days
        static let inapp2  = "com.lystiosapp.swipes7"
        static let inapp3  = "com.lystiosapp.waitlist7"
        static let inapp4  = "com.lystiosapp.messageReminder7"
        static let inapp5  = "com.lystiosapp.SearchLocation7"
        static let inapp6  = "com.lystiosapp.Alltheabove7"
        
        //1month
//        static let inapp2  = "com.lystiosapp.swipes1"
//        static let inapp3  = "com.lystiosapp.waitlist"
//        static let inapp4  = "com.lystiosapp.messageReminder"
//        static let inapp5  = "com.lystiosapp.SearchLocation"
//        static let inapp6  = "com.lystiosapp.Alltheabove"
        
    }
    
    struct   local {
        static let LocalDocument = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    }
    
}

