//
//  UserModel.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/24/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation
import ObjectMapper
class UserModel:Mappable {
    var name : String?
    var gender : Bool?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.gender  <- map["gender"]
    }
}
