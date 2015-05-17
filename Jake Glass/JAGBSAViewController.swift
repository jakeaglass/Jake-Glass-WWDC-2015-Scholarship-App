//
//  JAGBSAViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGBSAViewController: JAGModalViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add an image for intrigue
        var imgData = NSFileManager.defaultManager().contentsAtPath(NSBundle.mainBundle().bundlePath.stringByAppendingString("/hdrValley.png"))
        var img = UIImage(data: imgData!)
        var imageViewA = UIImageView(image: img)
        imageViewA.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+44, self.view.frame.width/2, 200)
        
        //set up the second image, the bsa logo
        var imageViewB = UIImageView(frame: CGRectMake(self.view.frame.origin.x+(self.view.frame.width/2), self.view.frame.origin.y+44, self.view.frame.width/2, 200))
        imgData = NSFileManager.defaultManager().contentsAtPath(NSBundle.mainBundle().bundlePath.stringByAppendingString("/fleurdelis300x300.jpg"))
        imageViewB.image = UIImage(data: imgData!)
        imageViewB.backgroundColor = UIColor.whiteColor()
        imageViewB.contentMode = UIViewContentMode.ScaleAspectFit
        
        
        // Do any additional setup after loading the view.
        var textView = UITextView(frame: CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y+244,self.view.frame.width,self.view.frame.height-200))
        textView.textContainerInset = UIEdgeInsetsMake(30, 30, 30, 30)
        
        textView.text = "\n\nI've been active in the BSA since 2011, and I've worked my way up to the rank of Life Scout. Thus far, I have served as the Senior Patrol leader in Troop 339 and imbibed many a younger scout with what I hope is valuable leadership knowledge.\n\nNow I'm finishing up the rank of Eagle Scout and doing my best to be a leader within my troop and community. What I really love about Scouting is getting outside and hiking, biking, and running."
        textView.userInteractionEnabled = false
        textView.font = UIFont.systemFontOfSize(16.0)
        textView.textColor = UIColor.blackColor()
        
        self.view.addSubview(textView)
        self.view.addSubview(imageViewA)
        self.view.addSubview(imageViewB)
        
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
