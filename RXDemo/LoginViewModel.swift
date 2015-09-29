//
//  LoginViewModel.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/10/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewModel{

    func getUserInfo(username:String, password:String) -> Observable<UserModel>{

        return create { (observer ) -> Disposable in
            APIService.getUserInfo(username, password: password, completeHandler: { (result:UserModel?, err:ErrorType?) -> Void in
                if let _ = err{
                    observer.on(Event.Error(err!))
                }else{
                    observer.on(Event.Next(result!))
                    observer.on(Event.Completed)
                }
            })
            return NopDisposable.instance
        }
    }

}
