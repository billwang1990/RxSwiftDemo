//
//  ClubViewController.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ClubViewController: BaseViewController, UITableViewDelegate  {
    
    @IBOutlet weak var clubList: UITableView!
    var refreshCtrl = UIRefreshControl()
    var page : Variable<Int> = Variable(0)
    lazy var dispose = DisposeBag()
    var viewModel : ClubListViewModel! = ClubListViewModel()

    override func viewDidLoad() {
        self.setupUI()
        self.bindingViewModel()
    }
    
    func setupUI(){
        self.clubList.registerClass(ClubListCell.self, forCellReuseIdentifier: "clubCell")
        self.clubList.addSubview(self.refreshCtrl)
        self.clubList.rowHeight = 50
        self.refreshCtrl.addTarget(self, action: "handleRefresh", forControlEvents: .ValueChanged)
    }
    
    func bindingViewModel(){
        
        self.page
            .throttle(0.5, MainScheduler.sharedInstance)
            .doOn{ [unowned self] value in
                self.refreshCtrl.enabled = false
            }
            .flatMap {[unowned self] in
                self.viewModel.fetchClubList(fromPage: $0)
                    .observeOn(MainScheduler.sharedInstance)
                    .doOn{ [unowned self] in
                        self.refreshCtrl.endRefreshing()
                        self.refreshCtrl.enabled = true
                    }
                    .retry()
                    .catchErrorJustReturn([])
            }
            .bindTo(self.clubList.rx_itemsWithCellIdentifier("clubCell")){(_, viewModel, cell: ClubListCell) in
                cell.viewModel = viewModel
            }
            .addDisposableTo(self.dispose)
        
        self.clubList.rx_setDelegate(self)
        self.clubList.rx_itemSelected.subscribeNext{[unowned self] value in
            //TODO:handle select event
                self.clubList.deselectRowAtIndexPath(value , animated: false)
            }
            .addDisposableTo(self.dispose)
    }
    
    func handleRefresh(){
        self.page.value = 0
    }

    
}
