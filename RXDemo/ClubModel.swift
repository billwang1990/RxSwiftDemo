//
//  ClubModel.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation
import ObjectMapper

class ClubModel : Mappable {
    
    var name : String = ""

    func mapping(map: Map) {
        self.name <- map["name"]
    }
    
    required init?(_ map: Map) {
        
    }
    
}