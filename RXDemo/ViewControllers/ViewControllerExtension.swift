//
//  ViewControllerExtension.swift
//  RXDemo
//
//  Created by Yaqing Wang on 9/25/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true )
    }
}