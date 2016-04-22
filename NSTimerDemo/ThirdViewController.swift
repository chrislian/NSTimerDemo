//
//  ThirdViewController.swift
//  NSTimerDemo
//
//  Created by Chris on 16/4/21.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Third"
    }
    
    deinit{
        print("\(#file) deninit")
        //stopTimer()
    }
    
    //MARK: - event response
    @IBAction func startButtonClicked(sender: AnyObject) {
        startTimer()
    }
    
    @IBAction func stopButtonClicked(sender: AnyObject) {
        stopTimer()
    }
    
    func timeFire(){
        print("\(#file) fire...Count:\(count)")
        count += 1
    }
    
    //MARK: - private method
    private func startTimer(){
        
        if let _ = lTimer{
            print("\(#file) timer is already running")
            return
        }
        print("\(#file) start timer")
        
        
        lTimer = NSTimer.cl_startTimer(1.0, repeats: true){ [weak self] in
            self?.timeFire()
            //这里`self`必须申明为`unowned` or `weak`, 否则会造成循环引用
        }
    }
    
    private func stopTimer(){
        
        if let timer = lTimer{
            timer.invalidate()
            print("\(#file) stop timer")
            count = 0
            lTimer = nil
        }
    }
    
    //MARK: - var & let
    var lTimer:NSTimer?
    var count = 0
}
