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
    
    // loading sound settings
    let soundSettings = Sounds()
    
    
    //outlets
    @IBOutlet var gameSoundsSwitch : UISwitch!
    @IBOutlet var menuSoundsSwitch : UISwitch!
    @IBOutlet var gameMusicSwitch : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading offline settings for sound
        soundSettings.load()
        
        //setting switches to correct position
        gameSoundsSwitch.isOn = _GAME_SOUNDS
        menuSoundsSwitch.isOn = _MENU_SOUNDS
        gameMusicSwitch.isOn = _GAME_MUSIC
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
            _GAME_SOUNDS = true
        }
        else
        {
            //pause
            _GAME_SOUNDS = false
            
        }
        save()
    }
    
    @IBAction func menuSounds(_ sender: AnyObject)
    {
        
        if (sender.isOn == true)
        {
            //play
            _MENU_SOUNDS = true
        }
        else
        {
            //pause
            _MENU_SOUNDS = false
        }
        save()
    }


    @IBAction func gameMusic(_ sender: AnyObject)
    {
        if (sender.isOn == true)
        {
            //play background audio
            _GAME_MUSIC = true
            _MUSIC.play()
        }
        else
        {
            //stop background audio
            _GAME_MUSIC = false
            _MUSIC.stop()
        }
        save()
       
    }
    
    //saving sounds settings
    func save()
    {
        soundSettings.saveSettings()
    }
}
