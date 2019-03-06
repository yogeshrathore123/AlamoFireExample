//
//  ServiceWrapper.swift
//  SwiftTutorial
//
//  Created by Yogesh Rathore on 01/03/19.
//  Copyright © 2019 Yogesh Rathore. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ServiceWrapper: NSObject {
    // Get Method
    class func requestGETURL(_ strURL: String, success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                if let resJson = responseObject.data {
                    success(resJson)
                }
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
   
    // Post Method
    class func requestPOSTURL(_ strURL : String, params : [String : Any]?, headers : [String : String]?, success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void){
        
        // Add Headers
        let headers = [
            "Content-Type":"application/json",
            ]
        
        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            
            print("responseObject::- \(responseObject)")
            
            if responseObject.result.isSuccess {
                if let resJson = responseObject.data {
                    success(resJson)
                }
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}
