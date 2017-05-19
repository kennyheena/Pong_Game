//
//  Sounds.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 18/05/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import Foundation
import AVFoundation

var _MUSIC = AVAudioPlayer()

class Sounds
{
    // address of the music file
    let music = Bundle.main.path(forResource: "255576__moz5a__man-meets-earth", ofType: "mp3")
    //link for the audio file that has been used in here given credit and the licence has been shown above
    //http://www.freesound.org/people/moz5a/sounds/255576/
    //https://creativecommons.org/publicdomain/zero/1.0/
    
    //var audioPlayer = AVAudioPlayer()
    
    //keys
    var menuMusicKey = "menuMusic"
    var gameMusicKey = "gameMusic"
    var gameSoundsKey = "gameSounds"
    

    public func startMusic()
    {
        do
        {
            _MUSIC = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
        }
        catch
        {
            return
        }
        
        if(_GAME_MUSIC == true)
        {
            _MUSIC.numberOfLoops = -1
            _MUSIC.play()
        }
    }
    
    // Saving settings for offline
    public func saveSettings()
    {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(_MENU_SOUNDS, forKey: menuMusicKey)
        userDefaults.set(_GAME_MUSIC, forKey: gameMusicKey)
        userDefaults.set(_GAME_SOUNDS, forKey: gameSoundsKey)
        userDefaults.synchronize()
    }
    
    //loading settings
    public func load()
    {
        let userDefaults = UserDefaults.standard
        
        _MENU_SOUNDS  = userDefaults.bool(forKey: menuMusicKey)
        _GAME_MUSIC  = userDefaults.bool(forKey: gameMusicKey)
        _GAME_SOUNDS  = userDefaults.bool(forKey: gameSoundsKey)
    }
}
