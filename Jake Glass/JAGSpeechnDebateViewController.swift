//
//  JAGSpeechnDebateViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGSpeechnDebateViewController: JAGModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var textView = UITextView(frame: CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y+44,self.view.frame.width,self.view.frame.height-200))
        textView.textContainerInset = UIEdgeInsetsMake(30, 30, 30, 30)
        
        textView.text = "I have been active in the Speech and Debate programme for my entire time at Bellarmine. I compete in Foreign and Domestic Extemporaneous Speech, Policy Debate, Public Forum Debate, and Congressional Debate.\n\n\t- Leadership: Point Secretary (10th grade), Junior Policy Captain (11th grade).\n\n\t- Debate Camp: Northwestern Debate Institute 2014 (oceans topic in Policy Debate) and Cal National Debate Institute 2013 (at UC Berkeley, Latin America topic)."
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
