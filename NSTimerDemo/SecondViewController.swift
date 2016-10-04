//
//  SecondViewController.swift
//  NSTimerDemo
//
//  Created by Chris on 16/4/21.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Second"
    }
    deinit{
        print("\(#file) deninit")
        stopTimer()
    }
    
    //MARK: - event response
    @IBAction func startButtonClicked(_ sender: AnyObject) {
        
        startTimer()
    }
    
    @IBAction func stopButtonClicked(_ sender: AnyObject) {
        
        stopTimer()
    }
    
    func timeFire(_ timer:Timer){
        
        print("\(#file) fire...Count:\(count)")
        count += 1
    }
    
    //MARK: - private method
    fileprivate func startTimer(){
        
        if let _ = cTimer{
            print("\(#file) timer is already running")
            return
        }
        
        cTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(timeFire(_:)), userInfo: nil, repeats: true)
        RunLoop.current.add(cTimer!, forMode: RunLoopMode.commonModes)
        print("\(#file) start timer")
    }
    
    fileprivate func stopTimer(){
        
        if let timer = cTimer{
            timer.invalidate()
            print("\(#file) stop timer")
            count = 0
            cTimer = nil
        }
    }
    
    //MARK: - var & let
    var cTimer:Timer?
    var count = 0

}
