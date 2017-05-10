//
//  GameScene.swift
//  PongGame
//
//  Created by Sandun Heenatigala on 9/4/17.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //making three variables for 3 objects (paddle1, paddle2 and ball)
    public var paddle1 = SKSpriteNode ()
    public var paddle2 = SKSpriteNode ()
    public var ball = SKSpriteNode ()
    
    //and score
    public var score = [Int]()
    public var paddle1score = SKLabelNode ()
    public var paddle2score = SKLabelNode ()
    public var multiplier = 1;
    public var baseScore = 0;
    public var difficultyMultiplier = 0;
    public var velocityIncrease = 1.05
    public var playerMisses = 0
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node == paddle1 && contact.bodyB.node == ball)
        {
            collisionBetween(object0: contact.bodyB.node!, object1: contact.bodyA.node!)
        }
        else if (contact.bodyB.node == ball && contact.bodyA.node == paddle1)
        {
            collisionBetween(object0: contact.bodyB.node!, object1: contact.bodyA.node!)
        }
    }
    
    override func didMove(to view: SKView) {
        
        _ENDGAME = false
        
        //assigning variables for the sprites
        paddle1 = self.childNode(withName: "paddle1") as! SKSpriteNode
        paddle2 = self.childNode(withName: "paddle2") as! SKSpriteNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
    
        //asssigning variables for the score
        paddle1score = self.childNode(withName: "paddle1score") as! SKLabelNode
        paddle2score = self.childNode(withName: "paddle2score") as! SKLabelNode
        
        //setting label values for scores
        if(_MODE == Mode.RapidFire)
        {
            paddle1score.text = String(0)
            paddle2score.text = String(multiplier) + "x"
        }
        else
        {
            paddle1score.text = String(0)
            paddle2score.text = String(0)
        }
        
        //setting difficulty multipler
        switch _DIFFICULTY {
        case Difficulty.Easy:
            difficultyMultiplier = 1;
            break;
        case Difficulty.Medium:
            difficultyMultiplier = 2;
            break;
        case Difficulty.Hard:
            difficultyMultiplier = 3;
            break;
        default:
            difficultyMultiplier = 1;
        }
        
        //ball bounce angle
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border

        // setting physics information for handling collision - required for RapidFireScoring mode
        physicsWorld.contactDelegate = self
        ball.physicsBody!.contactTestBitMask = ball.physicsBody!.collisionBitMask
    }
    
    //called when the ball collides with an object
    func collisionBetween(object0: SKNode, object1: SKNode) {
        //Checking if RapidFire more is enabled
        if(_MODE == Mode.RapidFire)
        {
            //Checking the colliding object is player 1 paddle
            if(object1 == paddle1)
            {
                //incrementing multiplier
                multiplier = multiplier + 1;
                //Updating Multiplier field
                paddle2score.text = String(multiplier) + "x"
                baseScore = baseScore + 1
                
                //Increasing score - only using player 1 score
                score[0] = baseScore * multiplier * difficultyMultiplier;
                
                //setting text for score
                paddle1score.text = String(score[0])
                
                //increasing the speed of the ball each time it collides with the player one paddle
                ball.physicsBody?.velocity.dx = (ball.physicsBody?.velocity.dx)! * 1.05
                ball.physicsBody?.velocity.dy = (ball.physicsBody?.velocity.dy)! * 1.05
            }
        }
    }
    
//    func inBounds(touch: UITouch, object: SKNode) -> Bool
//    {
//        let location = touch.location(in: self)
//        
//        let check = ((location.x <= object.frame.maxX) &&
//                    (location.x >= object.frame.minX) &&
//                    (location.y <= object.frame.maxY) &&
//                    (location.y >= object.frame.minY));
//        return check;
//        
//    }
    
    
 //adding touch functionality
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
     //adding 2 player touch mode. when you touch top half of the screen it moves paddle2 and when you touch bottom half of the screen it moves paddle 1
            if(_MODE == Mode.Multiplayer){
            
            if location.y > 0 {
                paddle2.run(SKAction.moveTo(x: location.x , duration: 0.1))
            }
            
            if location.y < 0 {
                self.paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
            }
            
            }
            else {
                paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
            }
            
//            if(inBounds(touch: touch, object: paddle1))
//            {
//                paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
//            }
            
            //Implementing 2-player mode control
            
//            if(_MODE == Mode.Multiplayer)
//            {
//                if(inBounds(touch: touch,object: paddle2))
//                {
//                    paddle2.run(SKAction.moveTo(x: location.y , duration: 0.1))
//                }
//            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if(_MODE == Mode.Multiplayer){
                
                if location.y > 0 {
                    paddle2.run(SKAction.moveTo(x: location.x , duration: 0.1))
                }
                
                if  location.y < 0 {
                    self.paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
                }
                
                }
                
            else {
                paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
            }
            
//            if(inBounds(touch: touch, object: paddle1))
//            {
//                paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
//            }
            
            //Implementing 2-player mode control
            
//            if(_MODE == Mode.Multiplayer)
//            {
//                if(inBounds(touch: touch,object: paddle2))
//                {
//                    paddle2.run(SKAction.moveTo(x: location.y , duration: 0.1))
//                }
//            }
        }
    }
    
    func addScore(winner: SKSpriteNode)
    {
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        //paddle1.position = CGPoint(x: 0 , y: paddle1.position.y)
        //commented this out because it causes the reset on paddle's to the middle of the screen and looses control if you are touching it.
        //paddle2.position = CGPoint(x: 0 , y: paddle2.position.y)
        
        if(_MODE != Mode.RapidFire)
        {
        if (winner == paddle1)
        {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else if (winner == paddle2)
        {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        }
        // resetting ball if enemy loses
        else
        {
                ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        
        if(_MODE == Mode.RapidFire && winner == paddle2 && playerMisses == 4)
        {
            // Condition when rapid fire mode has been lost
            //Setting score
            score[0] = baseScore * multiplier * difficultyMultiplier;
            
            // setting global for score
            _SCORE = score[0]
            
            _ENDGAME = true
            //self.view?.window?.rootViewController?.present((GameModesViewController as? UIViewController)!, animated: true, completion: nil)
            self.view?.window?.rootViewController?.presentViewController(GameModesViewController as UIViewController, animated: true, completion: nil)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
//        switch CurrentGameType {
//        case Mode.Multiplayer:
//             break
//        }
//        
        //paddle2 slider movement when the ball travel (paddle 2 is tracking the ball)
        
        if (_MODE != Mode.Multiplayer)
        {
            paddle2.run(SKAction.moveTo(x: ball.position.x, duration: _DIFFICULTY))
        }

        // Rapid Fire must be treated differently due to scoring
        if(_MODE != Mode.RapidFire)
        {
        //adding checks for when ball reaches bottom or top
        if (ball.position.y <= paddle1.position.y - 50)
        {
            addScore(winner: paddle2)
        }
        else if(ball.position.y >= paddle2.position.y + 50)
        {
            addScore(winner: paddle1)
        }
        }
        
        //Implementing rapid fire mode code
        if (ball.position.y >= paddle2.position.y + 50 && _MODE == Mode.RapidFire)
        {
            //TODO: Implement code when player loses rapid fire
            addScore(winner: paddle1);
            //Implemented below using playerMisses variable
            //this must be when the padlle 1 loose 3 times then the final score must appear. so he is able to bat the ball 3 times till the game over and then finalise the scores.
        }
        
        if (ball.position.y <= paddle1.position.y - 50 && _MODE == Mode.RapidFire)
        {
            playerMisses = playerMisses + 1
            addScore(winner: paddle2);
        }

    }
}
