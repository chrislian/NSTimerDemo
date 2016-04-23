//
//  NSTimer+Safe.swift
//  NSTimerDemo
//
//  Created by Chris on 16/4/21.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

public extension NSTimer{
    
    private class CLObject{
        
        let closure:(Void->Void)
        init(closure:(Void->Void)){
            self.closure = closure
        }
    }
    
    /**
     定时器
     
     - parameter interval: NSTimeInterval
     - parameter repeats:  true or false
     - parameter closure:  Void->Void
     
     - returns: NSTimer
     */
    public class func cl_startTimer(interval:NSTimeInterval,repeats:Bool,closure:(Void->Void))->NSTimer{
        
        let obj = CLObject(closure: closure)
        
        //`userInfo`为AnyObject？ `closure`为Any 所以这里CLObject包装一下
        let timer = NSTimer(timeInterval: interval, target: self, selector: #selector(cl_closureInvoke(_:)), userInfo: obj, repeats: repeats)
        
        return timer
    }
    
    @objc private class func cl_closureInvoke(timer:NSTimer){
        
        if let obj = timer.userInfo as? CLObject{
            obj.closure()
        }
    }
}