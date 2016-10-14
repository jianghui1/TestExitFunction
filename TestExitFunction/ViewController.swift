//
//  ViewController.swift
//  TestExitFunction
//
//  Created by ys on 16/8/22.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonAction(sender: UIButton) {
        
        print("退出前")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            self.exitAnimation()
        }
        
    }
    
    func exitAnimation() -> Void {
        UIView.beginAnimations("exit", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationTransition(UIViewAnimationTransition.None, forView: view.window!, cache: false)
                UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector(#selector(ViewController.animationFinished(_:finished:context:)))
        view.window?.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.commitAnimations()
    }
    
    func animationFinished(animationID: String, finished: NSNumber, context: AnyObject) -> Void {
        let result: NSComparisonResult = animationID.compare("exit")
        if result.rawValue == 0 {
            exit(0)
        }
    }
}

