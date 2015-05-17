//
//  JAGCSViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGCSViewController: JAGModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var textView = UITextView(frame: CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y+44,self.view.frame.width,self.view.frame.height-200))
        textView.textContainerInset = UIEdgeInsetsMake(30, 30, 30, 30)
        
        textView.text = "\n\nI’ve worked with technology and coded for the majority of my life now, and computers continue to fascinate me more and more every day.\n\nI’m well-versed in the following syntax:\n\n\t\tHTML5 CSS3 Javascript jQuery PHP C C++ Objective-C Python Java\n\nFor the following platforms:\n\n\t\tiOS Web Android Mac OS Microcontrollers\n\nAnd I use these major tools on a regular basis:\n\n\t\tAdobe Creative Suite Xcode Eclipse"
        textView.userInteractionEnabled = false
        textView.font = UIFont.systemFontOfSize(16.0)
        textView.textColor = UIColor.blackColor()
        
        self.view.addSubview(textView)
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
