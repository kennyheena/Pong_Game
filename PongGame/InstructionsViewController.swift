//
//  InstructionsViewController.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 14/05/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import Foundation
import UIKit


internal class InstructionsViewController : UIViewController {
    
    @IBOutlet var txtInstructions : UITextView?
    
    override internal func viewDidLoad()
    {
        txtInstructions?.setContentOffset(CGPoint.zero, animated: false)
}
}
