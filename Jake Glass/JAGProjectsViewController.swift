//
//  JAGProjectsViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGProjectsViewController: JAGModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("this called")
        // Do any additional setup after loading the view.
        var projectsController = JAGProjectsTableViewController(style: UITableViewStyle.Plain)
        projectsController.view.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y+44,self.view.frame.width-100,self.view.frame.height)
        self.addChildViewController(projectsController)
        self.view.addSubview(projectsController.tableView)
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
