//
//  ViewController.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/10/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var pwdField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    lazy var viewModel : LoginViewModel = {
        return LoginViewModel()
        }()
    
    var dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bindingViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindingViewModel()
    {
        combineLatest(self.nameField.rx_text, self.pwdField.rx_text) { (name : String, pwd : String) -> Bool in
            return name.characters.count > 6 && pwd.characters.count > 6
            }.bindTo(loginBtn.rx_enabled).addDisposableTo(self.dispose)
 
        loginBtn.rx_tap
            .doOn{ [unowned self] in
                self.loginBtn.enabled = false
                self.view.endEditing(true)
            }
            .flatMap {[unowned self] in
                self.viewModel.getUserInfo(self.nameField.text!, password: self.pwdField.text!)
            }
            .retry()
            .doOn({
                print($0)
                self.loginBtn.enabled = true
            })
            .subscribe(next: {[unowned self] (result:UserModel) -> Void in
                
                print(result)
        
                }, error: { [unowned self](error : ErrorType) -> Void in
                //TODO: error handle 
                    
            })
            .addDisposableTo(self.dispose)
     
    }
}

