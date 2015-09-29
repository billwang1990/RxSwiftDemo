//
//  ClubListViewModel.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/28/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ClubListViewModel {
    
    init(){
    }
    
    var cellViewModels = [ClubTableCellViewModel]()
    
    func fetchClubList(fromPage page:Int) -> Observable<[ClubTableCellViewModel]>{
        
        return create{ (observer ) -> Disposable in
            Alamofire.request(Method.GET, "http://www.mocky.io/v2/560a046995e00cc208981280").responseArray{[unowned self]
                 (results:[ClubModel]?, err:ErrorType?) -> Void in
                    if let _ = err{
                        observer.on(Event.Error(err!))
                    }else{
                        if let cellVMs = (results?.map{ClubTableCellViewModel(club: $0)}){
                            
                            if page == 0{
                                self.cellViewModels.removeAll()
                            }
                            self.cellViewModels.appendContentsOf(cellVMs)
                            
                            observer.on(Event.Next(self.cellViewModels))
                            observer.on(Event.Completed)
                        }else{
                            //TODO: error handle
                        }
                    }
                }
            
            return NopDisposable.instance
        }
    }
}
