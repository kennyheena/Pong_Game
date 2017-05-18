//
//  MainScreenViewController.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 18/05/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Starting music if needs
            let music = Sounds()
            music.load()
            music.startMusic()
    
    }

}
