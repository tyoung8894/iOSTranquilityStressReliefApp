//
//  GameScene.swift
//  Tranquility
//
//  Created by Mark Malburg on 12/5/16.
//  Copyright © 2016 Mark Malburg. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    let ball = SKSpriteNode(imageNamed: "Ball")
    let finishHole = SKSpriteNode(imageNamed: "FinishHole")
    //let hole = SKNode.unarchiveFromFile("hole")
    
    let motionManager = CMMotionManager()
    let ballSpeed: CGFloat = 15.0
    
    var mazeGame : SKNode?
    var holesTotal:Int = 0
    //var backgroundImage : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        ball.position = CGPoint(x: size.width * 0.08, y: size.height * 0.04)
        finishHole.position = CGPoint(x: size.width - finishHole.size.width / 2, y: size.height - finishHole.size.height / 2)
        mazeGame = childNode(withName: "mazeGame")
        addChild(finishHole)
        addChild(ball)
        //addChild(hole!)
        
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
            
            ball.physicsBody = SKPhysicsBody(circleOfRadius: (UIImage(named: "Ball")?.size.width)!/2)
            
            if (ball.position.x == finishHole.position.x && ball.position.y == finishHole.position.y) {
                let winner = SKLabelNode(text: "You Win!")
                winner.position = CGPoint(x: size.width/2, y: size.height/2)
                winner.fontSize = 94.0
                winner.fontName = "Gill Sans SemiBold"
                winner.fontColor = UIColor(red: 113/255, green: 238/255, blue: 184/255, alpha: 1)
                addChild(winner)
                ball.removeFromParent()
                //winner.run(SKAction.sequence([SKAction.wait(forDuration: 2.5), SKAction.removeFromParent()]))
                
            }
            
            //if (ball.position.x == hole?.position.x && ball.position.y == hole?.position.y) {
            //    ball.position = CGPoint(x: size.width * 0.01, y: size.height * 0.01)
            //}
        }
    }
    
}
