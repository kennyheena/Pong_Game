//
//  GameScene.swift
//  PongGame
//
//  Created by Sandun Heenatigala on 9/4/17.
//  Updated by Sandun Heenatigala on 23/4/17
//  Copyright © 2017 Sandun Heenativara. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //making three variables for 3 objects (paddle1, paddle2 and ball)
    var paddle1 = SKSpriteNode ()
    var paddle2 = SKSpriteNode ()
    var ball = SKSpriteNode ()
    public var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        //assigning variables for the sprites
        paddle1 = self.childNode(withName: "paddle1") as! SKSpriteNode
        paddle2 = self.childNode(withName: "paddle2") as! SKSpriteNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
    
        
        //ball bounce angle and ball speed
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
            
            //Implementing 2-player mode control
            
            if(_MODE == Mode.Multiplayer)
            {
                paddle2.run(SKAction.moveTo(x: location.y , duration: 0.1))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            paddle1.run(SKAction.moveTo(x: location.x , duration: 0.1))
            
            //Implementing 2-player mode control
            if(_MODE == Mode.Multiplayer)
            {
                paddle2.run(SKAction.moveTo(x: location.y , duration: 0.1))
            }
        }
    }
    
    func addScore(winner: SKSpriteNode)
    {
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        paddle1.position = CGPoint(x: 0 , y: paddle1.position.y)
        paddle2.position = CGPoint(x: 0 , y: paddle2.position.y)
        
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
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //paddle2 slider movement when the ball travel (paddle 2 is tracking the ball)
        
        if (_MODE == Mode.SinglePlayer)
        {
            paddle2.run(SKAction.moveTo(x: ball.position.x, duration: _DIFFICULTY))
        }

        
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
}
