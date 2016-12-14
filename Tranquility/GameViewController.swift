//
//  GameViewController.swift
//  Tranquility
//
//  Created by Mark Malburg on 12/5/16.
//  Copyright © 2016 Mark Malburg. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

extension SKNode {
    class func unarchiveFromFile(_ file : String) -> SKNode? {
        if let path = Bundle.main.path(forResource: file, ofType: "sks") {
            let sceneData = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            let skView = view as! SKView
            skView.ignoresSiblingOrder = true
            scene.size = skView.bounds.size
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
    func resetGame() {
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            let skView = view as! SKView
            skView.ignoresSiblingOrder = true
            scene.size = skView.bounds.size
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
}
