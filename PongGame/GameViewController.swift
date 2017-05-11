//
//  GameViewController.swift
//  PongGame
//
//  Created by Sandun Heenatigala on 9/4/17.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if  let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit any size of screens in the ios device lineup
                //.fill is used here as reference the given link would help
                //http://stackoverflow.com/questions/33968046/sprite-kit-scene-editor-gamescene-sks-scene-width-and-height
                scene.scaleMode = .fill
                // Present the scene
                scene.score = [0,0]
                scene.viewController = self
                view.presentScene(scene)
                
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
