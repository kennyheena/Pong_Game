//
//  SettingsViewController.swift
//  PongGame
//
//  Created by Sandun Heenatigala on 15/5/17.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBAction func gameSounds(_ sender: UISwitch) {
        
        if (sender.isOn == true)
        {
            //code
        }
        else
        {
            //code
        }
    }
    
    @IBAction func menuSounds(_ sender: Any) {
        
        if ((sender as AnyObject).isOn == true)
        {
            //code
        }
        else
        {
            //code
        }
    }
    
    @IBAction func gameMusic(_ sender: Any) {
        
        if ((sender as AnyObject).isOn == true)
        {
            //code
        }
        else
        {
            //code
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
