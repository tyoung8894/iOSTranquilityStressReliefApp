//
//  Hole.swift
//  Tranquility
//
//  Created by Mark Malburg on 12/12/16.
//  Copyright © 2016 Mark Malburg. All rights reserved.
//

import Foundation
import SpriteKit

class Hole : SKNode {

    var holeSprite : SKSpriteNode?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        holeSprite = SKSpriteNode(imageNamed: "Hole")
        addChild(holeSprite!)
        
        createPhysicsBody()
    }
    
    func createPhysicsBody() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: (holeSprite?.size.width)!)
    }
}
