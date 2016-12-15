//
//  GameScene.swift
//  Tranquility
//
//  Created by Mark Malburg on 12/5/16.
//  Copyright © 2016 Mark Malburg, Tyler Young. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    let ball = SKSpriteNode(imageNamed: "Ball")
    let finishHole = SKSpriteNode(imageNamed: "FinishHole")
    
    let motionManager = CMMotionManager()
    let ballSpeed: CGFloat = 15.0
    
    var mazeGame : SKNode?
    var holesTotal:Int = 0

    
    override func didMove(to view: SKView) {
        ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
        finishHole.position = CGPoint(x: size.width - finishHole.size.width / 2, y: size.height - finishHole.size.height / 2)
        
        mazeGame = childNode(withName: "mazeGame")
        addChild(finishHole)
        addChild(ball)
        
        motionManager.startAccelerometerUpdates()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if let accelData = motionManager.accelerometerData {
        
            
            let newX = ball.position.x + CGFloat(accelData.acceleration.x) * ballSpeed
            let newY = ball.position.y + CGFloat(accelData.acceleration.y) * ballSpeed
            
            ball.position.x = newX
            ball.position.y = newY
            
            let halfWidth = ball.size.width / 2
            let halfHeight = ball.size.height / 2
            
            
            // The following if statements reset the ball if it falls in one of the holes
            if (ball.position.x > (22.5-halfWidth) && ball.position.x < (22.5+halfWidth) && (ball.position.y > (172.5-halfHeight) && ball.position.y < (172.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (125.934-halfWidth) && ball.position.x < (125.934+halfWidth) && (ball.position.y > (90.297-halfHeight) && ball.position.y < (90.297+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (247.5-halfWidth) && ball.position.x < (247.5+halfWidth) && (ball.position.y > (22.5-halfHeight) && ball.position.y < (22.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (352.5-halfWidth) && ball.position.x < (352.5+halfWidth) && (ball.position.y > (120.5-halfHeight) && ball.position.y < (120.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (177.934-halfWidth) && ball.position.x < (177.934+halfWidth) && (ball.position.y > (107.5-halfHeight) && ball.position.y < (107.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (321.801-halfWidth) && ball.position.x < (321.801+halfWidth) && (ball.position.y > (252.892-halfHeight) && ball.position.y < (252.892+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (356.513-halfWidth) && ball.position.x < (356.513+halfWidth) && (ball.position.y > (352.445-halfHeight) && ball.position.y < (352.445+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (247.5-halfWidth) && ball.position.x < (247.5+halfWidth) && (ball.position.y > (454.407-halfHeight) && ball.position.y < (454.407+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (44.346-halfWidth) && ball.position.x < (44.346+halfWidth) && (ball.position.y > (241.191-halfHeight) && ball.position.y < (241.191+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (70.303-halfWidth) && ball.position.x < (70.303+halfWidth) && (ball.position.y > (333.192-halfHeight) && ball.position.y < (333.192+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (22.5-halfWidth) && ball.position.x < (22.5+halfWidth) && (ball.position.y > (391.191-halfHeight) && ball.position.y < (391.191+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (275.934-halfWidth) && ball.position.x < (275.934+halfWidth) && (ball.position.y > (614.5-halfHeight) && ball.position.y < (614.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (360.801-halfWidth) && ball.position.x < (360.801+halfWidth) && (ball.position.y > (534.851-halfHeight) && ball.position.y < (534.851+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (107.253-halfWidth) && ball.position.x < (107.253+halfWidth) && (ball.position.y > (411.5-halfHeight) && ball.position.y < (411.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (181.997-halfWidth) && ball.position.x < (181.997+halfWidth) && (ball.position.y > (474.5-halfHeight) && ball.position.y < (474.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (51.346-halfWidth) && ball.position.x < (51.346+halfWidth) && (ball.position.y > (508.851-halfHeight) && ball.position.y < (508.851+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (24.722-halfWidth) && ball.position.x < (24.722+halfWidth) && (ball.position.y > (636.844-halfHeight) && ball.position.y < (636.844+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            if (ball.position.x > (160-halfWidth) && ball.position.x < (160+halfWidth) && (ball.position.y > (644.5-halfHeight) && ball.position.y < (644.5+halfHeight))) {
                ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
            }
            
            // The following if statements keep the ball within the bounds of the screen - code borrowed from "Rollerball" by Joel Hollingsworth
            if ball.position.x < halfWidth {
                ball.position.x = halfWidth
            } else if ball.position.x + halfWidth > size.width {
                ball.position.x = size.width - halfWidth
            }
            if ball.position.y < halfHeight {
                ball.position.y = halfHeight
            } else if ball.position.y + halfHeight > size.height {
                ball.position.y = size.height - halfHeight
            }
            
            // Gives the ball a physics body so it is affected by the walls in "GameScene.sks"
            ball.physicsBody = SKPhysicsBody(circleOfRadius: (UIImage(named: "Ball")?.size.width)!/2)
        }
        
            // Creates the winner text and removes the ball from the scene
            if (ball.position.x == finishHole.position.x && ball.position.y == finishHole.position.y) {
                let winner = SKLabelNode(text: "You Win!")
                winner.position = CGPoint(x: size.width/2, y: size.height/2)
                winner.fontSize = 94.0
                winner.fontName = "Gill Sans SemiBold"
                winner.fontColor = UIColor(red: 113/255, green: 238/255, blue: 184/255, alpha: 1)
                addChild(winner)
                ball.removeFromParent()
                
            }
        }
    }
    

