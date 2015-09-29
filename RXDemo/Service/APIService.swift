//
//  APIService.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/24/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class APIService {
    class func getUserInfo<T:Mappable>(username:String, password:String, completeHandler:(T?,ErrorType?)->Void){
        Alamofire.request(.GET, "http://www.mocky.io//5604ad1514d5deb30d2a81c1").responseObject(completeHandler)
    }
    
}