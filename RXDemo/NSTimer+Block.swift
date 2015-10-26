//
//  NSTimer+Block.swift
//  RXDemo
//
//  Created by Yaqing Wang on 10/14/15.
//  Copyright © 2015 billwang1990.github.io. All rights reserved.
//

import Foundation

public typealias TimerExcuteClosure = @convention(block)()->()
extension NSTimer{
    public class func YQ_scheduledTimerWithTimeInterval(ti:NSTimeInterval, closure:TimerExcuteClosure, repeats yesOrNo: Bool) -> NSTimer{
        return self.scheduledTimerWithTimeInterval(ti, target: self, selector: "excuteTimerClosure:", userInfo: unsafeBitCast(closure, AnyObject.self), repeats: true)
    }
    
    class func excuteTimerClosure(timer: NSTimer)
    {
        let closure = unsafeBitCast(timer.userInfo, TimerExcuteClosure.self)
        closure()
    }
}
