//
//  DifficultySelect.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 30/04/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import UIKit
import Foundation

class DifficultSelectController : UIViewController
{
    @IBOutlet var btnEasy : UIButton!
    @IBOutlet var btnMedium : UIButton!
    @IBOutlet var btnHard : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    // Setting the difficulty variable based on button pressed
    @IBAction func btnEasy_Click(_ sender: UIButton) {
        _DIFFICULTY = Difficulty.Easy;
    }

    @IBAction func btnMedium_Click(_ sender: UIButton) {
        _DIFFICULTY = Difficulty.Medium;
    }
    
    @IBAction func btnHard_Click(_ sender: UIButton) {
        _DIFFICULTY = Difficulty.Hard;
    }
    
}

