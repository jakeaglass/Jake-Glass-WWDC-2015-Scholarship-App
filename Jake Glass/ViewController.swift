//
//  ViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/23/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.blackColor()
        
        let thisCoder = NSCoder();
        self.view = JAGView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.height, (UIScreen.mainScreen().bounds.width)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

