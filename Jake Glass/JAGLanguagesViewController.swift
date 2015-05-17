//
//  JAGLanguagesViewController.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/26/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit

class JAGLanguagesViewController: JAGModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var imageView = UIImageView(frame: CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+44, self.view.frame.width, 200))
        imageView.image = UIImage(contentsOfFile: "langImage.jpg")
        // Do any additional setup after loading the view.
        var textView = UITextView(frame: CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y+44,self.view.frame.width,self.view.frame.height))
        textView.textContainerInset = UIEdgeInsetsMake(30, 30, 30, 30)
        
        textView.text = "I've always had a passion for learning languages. I enjoy exploring other cultures and linguistics fascinate me, all the way from Hemingway to Neitzsche. \n\nI can see a future in which I combine my computer science skills with my love for languages — I'm in awe of products like DuoLingo, which allows you to learn languages online for free. They make their revenue by selling extremely accurate human translation services in an effort to digitize the entire Web, whilst also providing their users with real-world translation practice.\n\n- Hablo español biene, y he estudiado el idioma por más de seis años.\n\n- Ich spreche ein bisschen Deutsch, aber ich lerne noch mehr täglich. Diese Sprache ist jetzt mein Lernfokus.\n\n- Also dabbling in French, Russian, and Mandarin."
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
