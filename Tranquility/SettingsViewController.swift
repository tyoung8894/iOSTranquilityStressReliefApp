//
//  SettingsViewController.swift
//  Tranquility
//
//  Created by Tyler Young on 12/8/16.
//  Copyright © 2016 Tyler Young, Mark Malburg. All rights reserved.
//
//  Code borrowed from "Build a Drawing App with Swift3 & iOS10" by Sandy Ludosky
//  https://www.skillshare.com/classes/technology/Build-a-Drawing-App-with-Swift3-iOS10/1131171117/classroom/discussions?enrolledRedirect=1
//

import UIKit

protocol UpdateSettingsDelegate: class {
    func updateSettings(_ settingsVC: SettingsViewController)
}

class SettingsViewController: UIViewController {
    
    //labels
    @IBOutlet weak var brushLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    //previews
    @IBOutlet weak var brushImageView: UIImageView!
    @IBOutlet weak var colorsImageView: UIImageView!
    
    //sliders
    @IBOutlet weak var brushSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //settings
    var red:CGFloat?
    var green:CGFloat?
    var blue:CGFloat?
    var brushWidth:CGFloat?
    
    var delegate: UpdateSettingsDelegate?
    
    //set the brush width to selection of user on the Settings page
    @IBAction func changeBrushWidth(_ sender: UISlider) {
        
        if sender == brushSlider {
            //allow the brush width to grow larger
            brushWidth = CGFloat(sender.value * 50.0)
            brushLabel.text = "brush: " + String(format: "%2i", Int(brushWidth!)) as String
        }
        
        drawPreview(imgView: brushImageView, width: brushWidth!)
    }
    
    //changes the rgb values to what the user selects on the settings page, draws the previews
    @IBAction func changeColorAction(_ sender: UISlider) {
        
        //set red rgb value to redSlider value
        red = CGFloat(redSlider.value)
        redLabel.text = "red: " + String(format: "%d", Int(redSlider.value * 255.0)) as String
        
        //same for green value
        green = CGFloat(greenSlider.value)
        greenLabel.text = "green: " + String(format: "%d", Int(greenSlider.value * 255.0)) as String
        
        //same for blue value
        blue = CGFloat(blueSlider.value)
        blueLabel.text = "blue: " + String(format: "%d", Int(blueSlider.value * 255.0)) as String
        
        //adjust preview for brush
        drawPreview(imgView: brushImageView, width: brushWidth!)
        
        //draw preview
        drawPreview(imgView: colorsImageView, width: 30.0)

    }
    
    //dismiss the SettingsViewController and go back to source, the ThirdViewController when Cancel button is pressed
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //saves the settings when Save button is pressed
    @IBAction func saveSettingsAction(_ sender: UIBarButtonItem) {
        
        //dismiss view controller and go back to source(the ThirdViewController)
        dismiss(animated: true, completion: nil)
        //the delegate(thirdviewcontroller) will execute the updateSettings function
        delegate?.updateSettings(self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("brush width is \(brushWidth!)")
        
        //draw the previews of the stroke
        drawPreview(imgView: brushImageView, width: brushWidth!)
        //sets preview size to 30
        drawPreview(imgView: colorsImageView, width: 30.0)
        setSlidersValues()
    }
    
    
    //draw the previews the strokes on the Settings page
    func drawPreview(imgView:UIImageView, width:CGFloat) {
        
        //display the preview image views
        UIGraphicsBeginImageContext(CGSize(width: 70.0, height: 70.0))
       
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: 35.0, y: 35.0))
        context?.addLine(to: CGPoint(x: 35.0, y: 35.0))
        
        context?.setBlendMode(.normal)
        //set round stroke shape
        context?.setLineCap(.round)
        //set width of line based on brush width selection
        context?.setLineWidth(width)
        //set the stroke color to chosen red, green, blue slider values
        context?.setStrokeColor(UIColor(red: red!, green: green!, blue: blue!, alpha: 1.0).cgColor)
        //close the path
        context?.strokePath()
        //draw to UIimage view
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //set the values of the sliders based on user's selection on the Settings page
    func setSlidersValues() {
        
        //brush
        //convert CGFloat to Float. allow to grow bigger by /50
        brushSlider.value = Float(brushWidth! / 50)
        //two decimal value of type integer, convert CG to Int
        brushLabel.text = "brush: " + String(format: "%2i", Int(brushWidth!)) as String
        
        //colors
        redSlider.value = Float(red!)
        redLabel.text = "red: " + String(format: "%d", Int(redSlider.value * 255.0)) as String
        
        greenSlider.value = Float(green!)
        greenLabel.text = "green: " + String(format: "%d", Int(greenSlider.value * 255.0)) as String

        
        blueSlider.value = Float(blue!)
        blueLabel.text = "blue: " + String(format: "%d", Int(blueSlider.value * 255.0)) as String
    }

}
