//
//  JAGInformationViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGInformationViewController: JAGModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create our info textview
        var textView = UITextView(frame: CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y+44,self.view.frame.width,self.view.frame.height))
        textView.textContainerInset = UIEdgeInsetsMake(30, 30, 30, 30)
        
        textView.text = "Use gestures like single-finger-drag to rotate, two-finger-drag to pan, and two-finger-pinch to zoom around the brain. Each colored region corresponds to a part of Jake's brain — although many regions share similar functions, the descriptions of Jake's interests and skills roughly correlate with their respective brain areas.\n\nTo learn about a specific interest or quality of Jake from any particular brain region, double-tap it."
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
