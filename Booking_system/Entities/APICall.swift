//
//  APICall.swift
//  AvailabilityManager_Freelancer
//
//  Created by TopsTech on 04/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

import UIKit

import Foundation

@objc(community)
class APICall :NSObject {
    
    class var sharedAPICall: APICall {
        struct Static {
            static var instance: APICall?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = APICall()
        }
        return Static.instance!
    }
    
    func callApiUsingGET (urlPath: NSString, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {

        if(showLoader){
            AppDelegate().startSpinerWithOverlay(true)
        }

        let manager = AFHTTPRequestOperationManager()
        let emptyDic = [String: String]()
        let urlPath1 = Global.g_APIBaseURL + (urlPath as String)
        let operation = manager.GET(urlPath1 as String, parameters: emptyDic, success: { (operations: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
                if(showLoader) {
                   AppDelegate().stopSpiner()
                }
              success(responceData: responseObject)
            }) { (operation, error) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                    print(error, terminator: "")
        }
        operation!.start()
        
    }
    
    func callApiUsingWithFixURLGET (urlPath: NSString, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        
        if(showLoader){
            AppDelegate().startSpinerWithOverlay(true)
        }
        
        let manager = AFHTTPRequestOperationManager()
        let emptyDic = [String: String]()
        let urlPath1 = (urlPath as String)
        let operation = manager.GET(urlPath1 as String, parameters: emptyDic, success: { (operations: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
            if(showLoader) {
                AppDelegate().stopSpiner()
            }
            success(responceData: responseObject)
            }) { (operation, error) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                print(error, terminator: "")
        }
        operation!.start()
        
    }
    
    func callApiUsingGETWithDict (urlPath: NSString,withParameter dictData: NSMutableDictionary, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        if(showLoader){
            AppDelegate().startSpinerWithOverlay(true)
        }
        
        let manager = AFHTTPRequestOperationManager()
        let urlPath1 = Global.g_APIBaseURL + (urlPath as String)
        
        let operation = manager.GET(urlPath1 as String, parameters: dictData, success: { (operations: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
            if(showLoader) {
                AppDelegate().stopSpiner()
            }
            success(responceData: responseObject)
            }) { (operation, error) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                print(error, terminator: "")
        }
        operation!.start()
        
        
    }
    
    func callApiUsingPOST (urlPath: NSString, withParameter dictData: NSMutableDictionary, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        
        if(showLoader){
            AppDelegate().startSpinerWithOverlay(true)
        }
        
        let urlPath1 = Global.g_APIBaseURL + (urlPath as String)
        let manager = AFHTTPRequestOperationManager()
        print("Parameter :\(dictData)")
        manager.POST(urlPath1 as String, parameters: dictData, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
            if(showLoader) {
                AppDelegate().stopSpiner()
            }
             success(responceData: responseObject)
            }) { (operation, error) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                print(error, terminator: "")
        }
        
    }
    
    func callApiUsingPOST_LoderStop (urlPath: NSString, withParameter dictData: NSMutableDictionary, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        
        if(showLoader){
            AppDelegate().startSpinerWithOverlay(true)
        }
        
        let urlPath1 = Global.g_APIBaseURL + (urlPath as String)
        let manager = AFHTTPRequestOperationManager()
        print("Parameter :\(dictData)")
        manager.POST(urlPath1 as String, parameters: dictData, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
            
            success(responceData: responseObject)
            }) { (operation, error) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                print(error, terminator: "")
        }
        
    }
    
    
    func callApiUsingPOST_Image (urlPath: NSString, withParameter dictData: NSMutableDictionary, withImage image: UIImage, WithImageName imageName: NSString, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        
        if(showLoader){
            AppDelegate().startSpinerWithOverlay(true)
        }
        
        let urlPath1 = Global.g_APIBaseURL + (urlPath as String)
        
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer.acceptableStatusCodes = NSIndexSet(indexesInRange: NSMakeRange(200, 400))
        var Timestamp: String {
            return "\(NSDate().timeIntervalSince1970 * 1000)"
        }

        let operation =  manager.POST(urlPath1 as String, parameters: dictData, constructingBodyWithBlock: { (data:AFMultipartFormData!) -> Void in

            let image1: UIImage? = image
             if image1 != nil {
                data.appendPartWithFileData(UIImageJPEGRepresentation(image1!, 1)!, name: imageName as String, fileName: "\(Timestamp).png", mimeType: "image/png")
             }
            }, success: { (operation, responseObject) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                success(responceData: responseObject)
            }) { (operation, error) -> Void in
                if(showLoader) {
                    AppDelegate().stopSpiner()
                }
                print(error, terminator: "")
        }
        
        operation?.start()
    }
    
    
    func downloadImage(url:String,name:String,success: (response: String!) -> Void, failure: (error: NSError?) -> Void){
        
        let photourl: String = url//"http://cdn4.raywenderlich.com/wp-content/uploads/2015/03/lets_do_this.jpg"
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: photourl)!)
        
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory: AnyObject = paths[0]
        let dataPath = documentsDirectory.stringByAppendingPathComponent("MyFolder")
        do {
            try NSFileManager.defaultManager().createDirectoryAtPath(dataPath, withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }
        
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        let filename = name
        let filePath = documentsURL.URLByAppendingPathComponent(filename)
        print("save Image file path \(filePath)")
        
        let operation: AFImageRequestOperation = AFImageRequestOperation(request: request, success: {(image: UIImage!) -> Void in
            
            let provider: CGDataProviderRef = CGImageGetDataProvider(image.CGImage)!

            let imageData: NSData = (CGDataProviderCopyData(provider)) as! AnyObject as! NSData
           // let imageData: NSData = UIImageJPEGRepresentation(image, 90)!
            
            imageData.writeToFile("\(dataPath)/\(name)", atomically: true)
            success(response: filename)
        })
        operation.start()
        
    }
    
    
    func downloadGif(url:String,name:String,success: (response: String!) -> Void, failure: (error: NSError?) -> Void){
        
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: url)!)
        let fileoperation:AFHTTPRequestOperation = AFHTTPRequestOperation(request: request)
       
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        let filename = name
        let path = documentsURL.URLByAppendingPathComponent("MyFolder/\(filename)")
        
        fileoperation.outputStream = NSOutputStream(toFileAtPath: path.path!, append: false)

        fileoperation.setCompletionBlockWithSuccess({(operation: AFHTTPRequestOperation, responseObject: AnyObject) -> Void in
            print("GIF downloaded")
            }, failure: {(operation: AFHTTPRequestOperation, error: NSError) -> Void in
                NSLog("Error: %@", error)
        })
        fileoperation.start()
    }
    
}

/*
http://192.168.3.16/idea_management/trunk/ws/user/upload_image

idea_id

image

*/
