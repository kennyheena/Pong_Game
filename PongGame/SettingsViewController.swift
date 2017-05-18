//
//  SettingsViewController.swift
//  PongGame
//
//  Created by Sandun Heenatigala on 15/5/17.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import UIKit
import AVFoundation


class SettingsViewController: UIViewController {
    
    //variable for background music play
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // address of the music file
        let music = Bundle.main.path(forResource: "255576__moz5a__man-meets-earth", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
        }
        catch
        {
            print(error)
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gameSounds(_ sender: AnyObject)
        
    {
        
        if (sender.isOn == true)
        {
            //play
            
            
        }
        else
        {
            //pause
            
            
        }
    }
    
    @IBAction func menuSounds(_ sender: AnyObject)
        
    {
        
        if (sender.isOn == true)
        {
            //play
        }
        else
        {
            //pause
        }
    }


    @IBAction func gameMusic(_ sender: AnyObject)
        
    {
        
        if (sender.isOn == true)
        {
            //play background audio
            audioPlayer.play()
        }
        else
        {
            //stop background audio
            audioPlayer.stop()
        }
       
    }
}
