//
//  JAGModalViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGModalViewController: UIViewController {
    var frame:CGRect?
    var extraBtn:UIBarButtonItem?
    var titleName:String?
    
    init(titleName: String, frame: CGRect?, button: UIBarButtonItem?){
        super.init(nibName:nil,bundle:nil)
        if let specificFrame = frame{
            self.frame = specificFrame
        }
        if let extraBtn = button{
            self.extraBtn = button
        }
        self.titleName = titleName
        
        
    }
    
    required init(coder: NSCoder){
        super.init(nibName:nil,bundle:nil)
    }
    func dismissThis(){
        UIApplication.sharedApplication().keyWindow?.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theFrame = frame{
            self.view.frame = theFrame
        }else{
            //create the frame
            self.view.frame = CGRectMake(50, 100, UIScreen.mainScreen().bounds.width-100, UIScreen.mainScreen().bounds.height - 200)
        }
        
        var topBar = UIToolbar(frame: CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.bounds.width, 44))
        let backButton = UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.Done, target: self, action: "dismissThis")
        
        var titleLabel = UILabel(frame: CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.width, 44.0))
        titleLabel.text = titleName
        titleLabel.textAlignment = NSTextAlignment.Center
        let titleButton = UIBarButtonItem(customView:titleLabel)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        if let theBtn = extraBtn{
            topBar.setItems([backButton,spacer,theBtn], animated: false)
        }
        else{
            topBar.setItems([backButton], animated: false)
        }
        self.view.addSubview(topBar)
        self.view.addSubview(titleLabel)
        self.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        
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
