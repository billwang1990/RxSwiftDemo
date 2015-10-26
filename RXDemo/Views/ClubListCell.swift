//
//  ClubListCell.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class ClubListCell: UITableViewCell {
    
    var dispose = DisposeBag()

     var viewModel : ClubTableCellViewModel! {
        
        didSet{
            
            //TODO: complte UI
            combineLatest(viewModel.expire, viewModel.name) { [weak self] (t, n) -> String in
                return ("\(self!.viewModel.name.value)剩余：\(self!.viewModel.expire.value)")
            }.subscribeNext { [weak self](s) -> Void in
                self!.textLabel?.text = s
            }.addDisposableTo(self.dispose)
            
         
        }
    }
    
}
