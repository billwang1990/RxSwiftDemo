//
//  ClubListCell.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//


import UIKit

class ClubListCell: UITableViewCell {
    var viewModel : ClubTableCellViewModel! {
        didSet{
            
            //TODO: complte UI
            self.textLabel?.text = viewModel.name
        }
    }
    
}
