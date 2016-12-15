//
//  ThirdViewController.swift
//  Tranquility
//
//  Created by Tyler Young on 12/8/16.
//  Copyright © 2016 Tyler Young, Mark Malburg. All rights reserved.
//
//  Code borrowed from "Build a Drawing App with Swift3 & iOS10" by Sandy Ludosky
//  https://www.skillshare.com/classes/technology/Build-a-Drawing-App-with-Swift3-iOS10/1131171117/classroom/discussions?enrolledRedirect=1
//

import UIKit

class ThirdViewController: UIViewController, UpdateSettingsDelegate {

    @IBOutlet weak var padImageView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    //last point touched on screen
    var lastPoint = CGPoint.zero
    
    //keeps track of the action of drawing
    var swiped:Bool = false
    
    //initialize the colors as black
    var red:CGFloat = 0
    var green:CGFloat = 0
    var blue:CGFloat = 0
    
    //set default brush width
    var brushWidth:CGFloat = 5.0
    
    //create an array of CGFloats that holds the rgb values of the color
    var colors:[(CGFloat, CGFloat, CGFloat)] = [(CGFloat, CGFloat, CGFloat)]()
    
    
    @IBAction func colorPickerAction(_ sender: UIButton) {
        
        //get the index of the button from sender by tag number of button
        (red, green, blue) = colors[sender.tag]
        //Convert colors to CGFloat
        (red, green, blue) = (red / 255.0, green / 255.0, blue / 255.0)
    }
    
    @IBAction func resetAction(_ sender: UIBarButtonItem) {
        
        padImageView.image = nil  //clears the UIimageview
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the rgb values of the colors on the toolbar, store in an array based on tag value of each button
        colors = [(255,0,0), //red
                  (14,0,255), //blue
                  (254,255,10), //yellow
                  (15,112,3), //green
                  (253,148,10), //orange
                  (131,57,2), //brown
                  (0,0,0)] //black
        
        addEraser()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //gets the location of where user initially places their finger on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //user hasn't moved finger yet
        swiped = false
        
        //sets lastPoint as location of where you place your finger
        if let touch = touches.first {
            lastPoint = touch.location(in: padImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //user has now moved finger
        swiped = true
        
        if let touch = touches.first {
            
            //get location of finger's location in CGPoints, set as currentPoint
            let currentPoint = touch.location(in: padImageView)
            //draw from last finger location to current finger location
            drawLines(from: lastPoint, to: currentPoint)
            //keeps last point in memory in order to draw the line
            lastPoint = currentPoint
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //if the swipe ended
        if !swiped {
            //draw the line
            drawLines(from: lastPoint, to: lastPoint)
            
        }
    }
    
    //add the eraser image to toolbar button and attach the erase function
    func addEraser() {
        
        let button :UIButton = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "eraser.png"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        
        button.addTarget(self, action: #selector(ThirdViewController.eraseFunction), for: .touchUpInside)
        
        let barBtn = UIBarButtonItem(customView: button)
        //assign eraser to middle button on toolbar
        toolbar.items?[1] = barBtn
    }
    
    //set brush color to white to erase
    func eraseFunction() {
         (red, green, blue) = (1,1,1)
    }
    
    //draw the line based on current rgb value, width, and start/end points
    func drawLines(from:CGPoint, to:CGPoint) {
        
        UIGraphicsBeginImageContext(padImageView.frame.size)
        padImageView.image?.draw(in: CGRect(x: 0, y: 0, width: padImageView.frame.width, height: padImageView.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: from.x, y: from.y))
        context?.addLine(to: CGPoint(x: to.x, y: to.y))
        
        context?.setBlendMode(.normal)
        //sets the stroke to a round shape
        context?.setLineCap(.round)
        //width of line based on brush width selection
        context?.setLineWidth(brushWidth)
        //set the color to the current rgb values
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
        //close the path
        context?.strokePath()
        //draw to UIimage view
        padImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //update the values based on values selected on the Settings page
    func updateSettings(_ settingsVC: SettingsViewController) {
        brushWidth = settingsVC.brushWidth!
        red = settingsVC.red!
        green = settingsVC.green!
        blue = settingsVC.blue!
    }
    
    //connects the settings bar button to the SettingsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSettings" {
            let settingsVC = segue.destination as! SettingsViewController
            //define the delegate as the ThirdViewController
            settingsVC.delegate = self
            //brushwidth in Settings View Controller set as brush width in Third View Controller           
            settingsVC.brushWidth = brushWidth
            settingsVC.red = red
            settingsVC.green = green
            settingsVC.blue = blue
        }
    }

    @IBAction func saveDrawing(_ sender: UIBarButtonItem) {
        
        //convert the UIImageView to UIImage and save to Camera Roll
        UIGraphicsBeginImageContextWithOptions(padImageView.bounds.size, padImageView.isOpaque, 0.0)
        padImageView!.drawHierarchy(in: padImageView.bounds, afterScreenUpdates: false)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print(snapshotImageFromMyView)
        padImageView.image = snapshotImageFromMyView
        UIImageWriteToSavedPhotosAlbum(snapshotImageFromMyView!, nil, nil, nil);
    }
    
}
