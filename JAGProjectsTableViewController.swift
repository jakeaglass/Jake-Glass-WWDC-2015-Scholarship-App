//
//  JAGProjectsTableViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGProjectsTableViewController: UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        println("the view loaded")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        println(NSBundle.mainBundle().bundlePath.stringByAppendingString(String(indexPath.row+1).stringByAppendingString(".png")))
        var imgData = NSFileManager.defaultManager().contentsAtPath(NSBundle.mainBundle().bundlePath.stringByAppendingString("/".stringByAppendingString(String(indexPath.row+1)).stringByAppendingString(".png")))
        var img = UIImage(data: imgData!)
        println("imageView here: \(img)")
        
        cell.imageView?.contentMode =  UIViewContentMode.ScaleAspectFit
        cell.imageView?.image = img
        // Configure the cell...
        
        var thatText = ""
        switch(indexPath.row){ // for the cell text
        case 0:
            thatText = "Codeday and Codini\n\n\t\tMy first hackathon was in November of this year, CodeDay Silicon Valley. I went with a couple of friends, Kevin Vincent and Mihir Trivedi. We had a great time and developed a pretty cool app for programmers:\n\n\tCode Completion, Documentation, and Programming Teaching App; a plugin for Sublime Text 2/3 with companion web app for live code suggestions and docs, like MAGIC!\nFeatures:\n\tAutomatic code completion and documentation\n\tProvides documentation with HTML, CSS, JavaScript\n\tProvides documentation for language defined words\n\tComment pseudocode\n\tFinds all your current comments; click on it and your cursor will jump to the comment.\n\tExpandable text -- see your code between two comments\n\nPlus, Codini won \"Best Overall Hack\" at CodeDay Silicon Valley, so I'd say that's pretty good for one's first time."
            break
        case 1:
            thatText = "MHacks and Cardboard for iOS\n\n\t\tThe Story\nAt the beginning of MHacks, during the expo, Google handed out some Cardboard units. Jake couldn't wait to assemble his, and put in his old Nexus 4. Many of the confused bystanders waiting patiently in the hardware line after kickoff remember how enthused Jake was with the awesomeness of Cardboard—he wouldn't put it down. Apparently panning around and staring at the intricacy of 3D worlds on your own free VR device is cool.\nThe Problem\n\t\tTristan was sad because he doesn't have an Android device. Searching for a cardboard-compatible app in the iOS app store produces zilch. We fixed that.\nSolution\n\t\tCardboard for iOS is quite aptly named. Dare we even say it's an extremely creative name? Probably not, but it does what it says it does, and it works well on the 5C and 4S we used for testing.\nCardboard for iOS does almost everything Google Cardboard does on Android, but mostly it provides a proof of concept demo and a jumping-off point for future development on the platform.\n\nTristan and I split the development of the project in Objective C between us, working in XCode with SceneKit and CMMotionManager (the sheer joy of hundreds of merge conflicts every time I committed—I should do that more often) and inspecting Google's code and published standards for rendering on the cardboard."
            break
        case 2:
            thatText = "ÜberHighlighter\n\n\t\tÜberHighlighter makes capturing the Internet easier than ever before; I developed it as a project to help out my Speech and Debate team in archiving and highlighting articles, since my school has an iPad One-to-One program.\n\nPeruse websites using the app's built-in browser, and highlight their content as you please quickly and easily.\n\nThen, you can export and share the webpage as a PDF document at the tap of a button — whether to Dropbox, via email or iMessage, or Airdrop to a friend, we have you covered."
            break
        default:
            //nothing happens here
            println("DEFAULT")
            thatText = ""
        }
        var textView = UITextView(frame: CGRectMake(230, 0, cell.frame.width-250, 200))
        textView.text = thatText
        textView.scrollEnabled=true
        textView.editable = false
        textView.textContainerInset = UIEdgeInsetsMake(30, 30, 30, 30)
        textView.font = UIFont.systemFontOfSize(16.0)
        textView.textColor = UIColor.blackColor()
        
        cell.addSubview(textView)
        
        println("done with cell: \(indexPath.row)")
        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    
}
