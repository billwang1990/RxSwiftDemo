//
//  ClubTableCellViewModel.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation
import RxSwift


class ClubTableCellViewModel {
    
    var name : String
    
    init(club:ClubModel){
        self.name = club.name
    }
}
