//
//  NSTimer+Safe.swift
//  NSTimerDemo
//
//  Created by Chris on 16/4/21.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

public extension Timer{
    
    /**
     定时器
     
     - parameter interval: NSTimeInterval
     - parameter repeats:  true or false
     - parameter closure:  Void->Void
     
     - returns: NSTimer
     */
    public class func cl_startTimer(_ interval:TimeInterval,repeats:Bool,closure:@escaping ((Void)->Void))->Timer{
        
        
        let timer = Timer(timeInterval: interval, target: self, selector: #selector(cl_closureInvoke(_:)), userInfo:closure, repeats: repeats)
        
        return timer
    }
    
    @objc fileprivate class func cl_closureInvoke(_ timer:Timer){
        
        if let clourse = timer.userInfo as? ((Void)->Void) {
            clourse()
        }
        
    }
}
