//
//  JAGView.swift
//  Jake Glass
//
//  Created by Jake Glass on 4/23/15.
//  Copyright (c) 2015 Squee! Apps. All rights reserved.
//

import UIKit
import SceneKit

/* allows one to read floatValue and intValue on a String*/
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    var integerValue: Int {
        return (self as NSString).integerValue
    }
}

class JAGView: SCNView {

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        self.configureView()
    }
    
    override init(frame: CGRect, options: [NSObject : AnyObject]?) {
        super.init(frame: frame, options: options)
        self.configureView()
    }

    /*func configureView(){
        //let's do some initial setup, loading in the model
        scene = SCNScene(named:"human-brain-test-1.dae")!
        self.backgroundColor = UIColor.blackColor()
        
        //let the user see the model and pan around a bit
        self.autoenablesDefaultLighting = true
        self.allowsCameraControl = true
    
    }
    */
    
    func configureView(){
        var topBar:UILabel = UILabel(frame: CGRectMake(0, 0, self.bounds.height, 60))
        var nameLabel:UILabel = UILabel(frame:CGRectMake(0, 20, self.bounds.height, 40))
        nameLabel.text = "Jake Glass's Brain"
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Center
        topBar.alpha = 0.3
        
        var qButton = UIButton.buttonWithType(UIButtonType.InfoDark) as! UIButton
        qButton.tintColor = UIColor.whiteColor()
        qButton.frame = CGRectMake(self.bounds.height-40, 20, 40, 40)
        qButton.addTarget(self, action: "helpModal", forControlEvents: UIControlEvents.TouchUpInside)
        topBar.backgroundColor = UIColor.whiteColor()
        
        self.addSubview(nameLabel)
        self.addSubview(topBar)
        self.addSubview(qButton)
        
        //let's do some initial setup, loading in the model
        scene = SCNScene(named: "human-brain-min-3.dae")
        self.backgroundColor = UIColor.blackColor()
        
        //color the model
        var redColorMaterial = SCNMaterial(), orangeColorMaterial = SCNMaterial(), yellowColorMaterial = SCNMaterial(), greenColorMaterial = SCNMaterial(), blueColorMaterial = SCNMaterial(), purpleColorMaterial = SCNMaterial()
        
        redColorMaterial.diffuse.contents = UIColor.redColor()
        orangeColorMaterial.diffuse.contents = UIColor.orangeColor()
        yellowColorMaterial.diffuse.contents = UIColor.yellowColor()
        greenColorMaterial.diffuse.contents = UIColor.greenColor()
        blueColorMaterial.diffuse.contents = UIColor.blueColor()
        purpleColorMaterial.diffuse.contents = UIColor.purpleColor()
        
        //language
        var languageLh = scene?.rootNode.childNodeWithName("lh_pial_DK_middletemporal_Mesh", recursively: true)
        var languageRh = scene?.rootNode.childNodeWithName("rh_pial_DK_middletemporal_Mesh", recursively: true)
        languageLh?.geometry?.materials? = [redColorMaterial]
        languageRh?.geometry?.materials? = [redColorMaterial]
        
        //BSA
        var bsaLh = scene?.rootNode.childNodeWithName("lh_pial_DK_postcentral_Mesh", recursively: true)
        var bsaRh = scene?.rootNode.childNodeWithName("rh_pial_DK_postcentral_Mesh", recursively: true)
        bsaLh?.geometry?.materials? = [orangeColorMaterial]
        bsaRh?.geometry?.materials? = [orangeColorMaterial]

        //projects
        var projectLh = scene?.rootNode.childNodeWithName("lh_pial_DK_rostralmiddlefrontal_Mesh", recursively: true)
        var projectRh = scene?.rootNode.childNodeWithName("rh_pial_DK_rostralmiddlefrontal_Mesh", recursively: true)
        projectLh?.geometry?.materials? = [yellowColorMaterial]
        projectRh?.geometry?.materials? = [yellowColorMaterial]
        
        //computer science
        var csLh = scene?.rootNode.childNodeWithName("lh_pial_DK_superiorfrontal_Mesh", recursively: true)
        var csRh = scene?.rootNode.childNodeWithName("rh_pial_DK_superiorfrontal_Mesh", recursively: true)
        csLh?.geometry?.materials? = [greenColorMaterial]
        csRh?.geometry?.materials? = [greenColorMaterial]
        
        //future -- cerebellum
        var futureLh = scene?.rootNode.childNodeWithName("lh_pial_DK_superiortemporal_Mesh", recursively: true)
        var futureRh = scene?.rootNode.childNodeWithName("rh_pial_DK_superiortemporal_Mesh", recursively: true)
        futureLh?.geometry?.materials? = [blueColorMaterial]
        futureRh?.geometry?.materials? = [blueColorMaterial]
        
        //speech and debate
        var sndLh = scene?.rootNode.childNodeWithName("lh_pial_DK_caudalmiddlefrontal_Mesh", recursively: true)
        sndLh?.geometry?.materials? = [purpleColorMaterial]
        
        //photog
        var photogLh = scene?.rootNode.childNodeWithName("lh_pial_DK_lingual_Mesh", recursively: true)
        var photogRh = scene?.rootNode.childNodeWithName("rh_pial_DK_lingual_Mesh", recursively: true)
        photogLh?.geometry?.materials? = [purpleColorMaterial]
        photogRh?.geometry?.materials? = [purpleColorMaterial]

        
        //let the user see the model and pan around a bit
        self.autoenablesDefaultLighting = true
        self.allowsCameraControl = true
        
    }
    func helpModal(){
        println("called")
        var helpModal = JAGInformationViewController(titleName: "Information",frame:CGRectMake(200, 200, UIScreen.mainScreen().bounds.width-400, UIScreen.mainScreen().bounds.height-540),button:nil)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(helpModal, animated: true, completion: nil)
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if touches.count != 0 {
            //get the touch event(s) from this callback
            for touch in touches{
                
                //get the node of the model on which the user tapped
                let aTouch = touch as! UITouch
                if let lobeTouched = hitTest(aTouch.locationInView(self), options: nil){
                    if let nodeName = lobeTouched.first{
                        
                        //make sure they double-tapped the lobe
                        if(aTouch.tapCount >= 2){
                            //call back to this class again to figure out what to do next
                            didTouchLobe(nodeName.node.name!)
                        }
                        else{
                            println("didn't tap twice \(nodeName.node.name!)")
                        }
                    }
                    else{
                        println("No lobe touched!!!")
                    }
                }
                else{
                    println("No lobe touched!")
                }
            }
        }else{
            println("No lobe touched!!")
        }
    }
    
    func didTouchLobe(lobeName:NSString){
        
        //which lobe did they touch? we pop up a different message for each!
        switch(lobeName){
            case "lh_pial_DK_middletemporal_Mesh": //languages
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGLanguagesViewController(titleName: "Linguistics & Languages",frame: nil,button: nil), animated: true, completion: nil)
        case "rh_pial_DK_middletemporal_Mesh": //languages rh
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGLanguagesViewController(titleName: "Linguistics & Languages",frame: nil,button: nil), animated: true, completion: nil)
        case "lh_pial_DK_postcentral_Mesh": //bsa
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGBSAViewController(titleName: "Boy Scouts and the Outdoors",frame: nil,button: nil), animated: true, completion: nil)
        case "rh_pial_DK_postcentral_Mesh": //bsa rh
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGBSAViewController(titleName: "Boy Scouts and the Outdoors",frame: nil,button: nil), animated: true, completion: nil)
        case "lh_pial_DK_rostralmiddlefrontal_Mesh": //projects
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGProjectsViewController(titleName: "Projects and Hackathons",frame: nil,button: nil), animated: true, completion: nil)
        case "rh_pial_DK_rostralmiddlefrontal_Mesh": //projects rh
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGProjectsViewController(titleName: "Projects and Hackathons",frame: nil,button: nil), animated: true, completion: nil)
        case "lh_pial_DK_superiorfrontal_Mesh": //cs
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGCSViewController(titleName: "Computer Science",frame: nil,button: nil), animated: true, completion: nil)
        case "rh_pial_DK_superiorfrontal_Mesh": //cs rh
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGCSViewController(titleName: "Computer Science",frame: nil,button: nil), animated: true, completion: nil)
        case "lh_pial_DK_superiortemporal_Mesh": //future
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGFutureViewController(titleName: "The Future",frame: nil,button: nil), animated: true, completion: nil)
        case "rh_pial_DK_superiortemporal_Mesh": //future rh
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGFutureViewController(titleName: "The Future",frame: nil,button: nil), animated: true, completion: nil)
        case "lh_pial_DK_caudalmiddlefrontal_Mesh": //speech and debate
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGSpeechnDebateViewController(titleName: "Speech & Debate",frame: nil,button: nil), animated: true, completion: nil)
        case "rh_pial_DK_caudalmiddlefrontal_Mesh": //speech and debate rh
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(JAGSpeechnDebateViewController(titleName: "Speech & Debate",frame: nil,button: nil), animated: true, completion: nil)
        default:
            println("you didn't tap a known region")
        }
    }

    
    func getSceneFromObjFilesInFolder(folderName:String) -> SCNScene{
        var newScene = SCNScene()
    
        var fullFolderName = ""
    
        if folderName.0 != "/"{
            fullFolderName = "/".stringByAppendingString(folderName)
        }
        else{
            fullFolderName = folderName
        }
        //let's load in the files in the folder into an array of datas
        let bundlePath = NSBundle.mainBundle().resourcePath
        var error:NSError?

        let completePath = bundlePath!.stringByAppendingString(fullFolderName.stringByAppendingString("/"))
        let fileNames = NSFileManager.defaultManager().contentsOfDirectoryAtPath(completePath,error:&error)
        
        //toss off an error
        if  !(fileNames != nil) {
            println(error?.localizedDescription)
        }
        
        println("length of fileNames for some reason: \(fileNames!.count)")
        for var i=0; i</*fileNames!.count*/2; ++i{
        //get the filename we're currently at
        let fileName = (fileNames! as Array)[i] as! String
            println("i is \(i)")
            //create the node for this particular file
            var node:SCNNode
            
            //init the arrays containing the vertex and face vertex connection points
            var vertexArray:[SCNVector3] = Array()
            var faceArray:[Int] = Array()
            
            //println("here's the filename: \(fileName) and here's the path: \(completePath.stringByAppendingString((fileName as! String)))")
            
                //get the contents of the file and put them into a string, checking to make sure this works
                var content = String(contentsOfFile: completePath.stringByAppendingString((fileName as String)), encoding: NSUTF8StringEncoding, error: &error)
                
                //separate out the file by line
                var lineArray = content!.componentsSeparatedByString("\n")
                //println("\(lineArray[10])")
                
                //create counters to parse through them
                var vertexCounter = 0
                var faceCounter = 0
                
                //iterate through each line in the file
                for line in lineArray{
                    var firstChar:Character
                    
                    //get the identifier for the line, then check if the line is populated
                    if !(line as String).isEmpty{
                        firstChar = Array(line)[0]
                    }
                    else{
                        break
                    }
                    
                    //if the line starts with v, it'll be parsed as a vertex
                    if firstChar == "v"{
                        //get each float value in the line ("v" followed by 3 floats will populate pointData)
                        var pointData = line.componentsSeparatedByString(" ")
                        //println("pointdata: \(pointData)")
                        vertexArray.append(SCNVector3Make(pointData[1].floatValue, pointData[2].floatValue, pointData[3].floatValue))
                        //println("this is pointDataA: \(pointData)")
                    }
                    
                    //note: a "face" is really an index relative to the vertices arrays for the data property of the geom object
                        
                    //if the line starts with f, it'll be parsed as a face
                    else if firstChar == "f"{
                        //get each int value in the line ("f" followed by 3 ints will populate pointData)
                        var pointData = line.componentsSeparatedByString(" ")
                        //println("this is pointDataB: \(pointData)")
                        //now add them to
                        faceArray.append(pointData[1].integerValue)
                        faceArray.append(pointData[2].integerValue)
                        faceArray.append(pointData[3].integerValue)
                    }
                
                }
            
            //let's take this geometry and add it to the scene
            
            //declare the geometry source containing the vertices, then the faces (interconnects b/n vertices) into the element
            var vertexSource = SCNGeometrySource(vertices: vertexArray, count: vertexArray.count)
            var faceData = NSData(bytes: faceArray, length: (sizeof(Int)*faceArray.count))
            var element:SCNGeometryElement = SCNGeometryElement(data: faceData, primitiveType: SCNGeometryPrimitiveType.Triangles, primitiveCount: faceArray.count, bytesPerIndex: 4)
            
            //arrayify them so we can make a new SCNGeometry object
            let vertexSources = [vertexSource]
            let elements = [element]
            let completedGeometry = SCNGeometry(sources: vertexSources,elements: elements)
            
            //create a node
            node = SCNNode(geometry: completedGeometry)
            newScene.rootNode.addChildNode(node)
            println("added a new node! with name \(fileName)")
  
        }// for{} loop for parsing through the file names
        
        return newScene;
    }
    
    
}
