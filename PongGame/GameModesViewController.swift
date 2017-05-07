//
//  GameModesViewController.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 30/04/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import UIKit
import Foundation

class GameModesViewController : UIViewController
{
    @IBOutlet var btnSinglePlayer : UIButton!
    @IBOutlet var btnMultiplayer : UIButton!
    @IBOutlet var btnRapidFire : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnSinglePlayer_Click(_ sender: UIButton) {
        _MODE = Mode.SinglePlayer;
    }
    
    @IBAction func btnMultiplayer_Click(_ sender: UIButton) {
        _MODE = Mode.Multiplayer;
    }
    
    @IBAction func btnRapidFire_Click(_ sender: UIButton) {
        _MODE = Mode.RapidFire;
    }
    
   
}

