//
//  CommonTableDataSource.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public typealias ConfigCellBlock = (table:UITableView, item:Any, indexPath:NSIndexPath)->UITableViewCell

public class CommonTableDataSource: NSObject, UITableViewDataSource {
    
    var items : [Any]?
    
    var cellFactory : ConfigCellBlock! = nil

    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.items?.count)!
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let item = self.items![indexPath.row]
        return self.cellFactory(table: tableView,item: item,indexPath: indexPath)
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
