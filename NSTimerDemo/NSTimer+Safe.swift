//
//  NSTimer+Safe.swift
//  NSTimerDemo
//
//  Created by Chris on 16/4/21.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

public extension NSTimer{
    
    private class CLTimerObj{
        
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
        
        let obj = CLTimerObj(closure: closure)
        
        //`userInfo`为AnyObject？ `closure`为Any 所以这里CLTimerObj包装一下
        let timer = NSTimer(timeInterval: interval, target: self, selector: #selector(cl_closureInvoke(_:)), userInfo: obj, repeats: repeats)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        return timer
        
    }
    
    @objc private class func cl_closureInvoke(timer:NSTimer){
        
        if let obj = timer.userInfo as? CLTimerObj{
            obj.closure()
        }
    }
}