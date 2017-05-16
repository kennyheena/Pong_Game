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
    
    //function for game over - due to global variables can take
    public func gameOver(gameScene : GameScene, winner : SKNode)
    {
        //message local variable for showing information
        var message = ""
        
        //Rapid fire mode
        if(_MODE == Mode.RapidFire)
        {
            message = "Score: " + String(_SCORE) + " points"
        }
        //If single player or multiplayer mode
        else
        {
            if(_MODE == Mode.SinglePlayer)
            {
                if(winner == gameScene.paddle1)
                {
                    message = "Winner!!"
                }
                else
                {
                    message = "You Lose!!"
                }
            }
            else
            {
                if(winner == gameScene.paddle1)
                {
                    message = "Player 1 Wins"
                }
                else
                {
                    message = "Player 2 Wins"
                }
            }
        }
        
        
        //Showing message
        // Message for rapid fire modee
        if(_MODE == Mode.RapidFire)
        {
            let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
            
            //Adding text field for capturing name
            alert.addTextField { (textField) in
                textField.text = "Enter Name"
            }
            
            //Adding action when button gets pressed
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in

                
                // Creating and adding score
                let textField = (alert?.textFields![0])! as UITextField
                let value = textField.text!
                //Getting the name value from the scores
                let score = Score();
                score.setScore(score: _SCORE, name: value)
                score.Save()
                
                self.performSegue(withIdentifier: "toScore", sender: nil);
                
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
        //presenting alert
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // User resumes game
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "leaveGame", sender: nil);
        }))
        
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (action: UIAlertAction!) in
            gameScene.removeFromParent()
            
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
        }))
        present(alert, animated: true, completion: nil)
        }
    }
    
    

    // function called when game is paused
    public func gamePaused(gameScene : GameScene)
    {
        //presenting alert
        let alert = UIAlertController(title: "Paused", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        // User resumes game
        alert.addAction(UIAlertAction(title: "Resume", style: .default, handler: { (action: UIAlertAction!) in
            gameScene.isPaused = false
        }))
        
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (action: UIAlertAction!) in
            gameScene.removeFromParent()
            
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
        }))
        
        // user exiting game
        alert.addAction(UIAlertAction(title: "Exit", style: .cancel, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "leaveGame", sender: nil);
        }))
        
        present(alert, animated: true, completion: nil)    }
    
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
