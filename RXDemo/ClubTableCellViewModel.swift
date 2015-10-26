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

    var name : Variable<String> = Variable("")
    var timer : NSTimer? = nil
    var expire : Variable<String> = Variable("")
    var model : ClubModel
    
    init(club:ClubModel){
        
        self.model = club
        self.name.value = model.name
        self.expire.value = String(model.expire)
        if let _ = timer{
            timer!.invalidate()
        }else{
            timer = NSTimer.YQ_scheduledTimerWithTimeInterval(0.1, closure: {[unowned self]  in
                let cur = self.expire.value
                self.expire.value = String(Int(cur)! - 1)
                
                }, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        }
    }
    
    deinit{
        timer?.invalidate()
    }
    
    
    @objc func handleTimer(){
        let cur = self.expire.value
        self.expire.value = String(Int(cur)! - 1)
    }
    
}
