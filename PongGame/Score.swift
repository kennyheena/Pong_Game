//
//  Score.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 11/05/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import Foundation

var _SCORES = [Score]() as Array;

//Class used for storing data
class Score
{
    var Key = "ScoresList"
    var Score = 0
    var Name = ""
    
    public func setScore(score : Int32, name : String)
    {
        Score = Int(score)
        Name = String(name)
    }
    
    public func Save()
    {
        _SCORES.append(self)
        _SCORES.sort(by: {$0.Score > $1.Score})

        /*
        if(_SCORES.count > 10)
        {
            _SCORES.removeLast()
        }
        
        //Saving to user defaults values
        var scores : String
        var names : String
        var i = 0
        
        while (i < _SCORES.count)
        {
            //adding initial score value - no comma needed
            if(i == 0)
            {
                scores = String(_SCORES[i].Score)
                names = _SCORES[i].Name
            }
            
            // Adding a comma to seperate values if it is not the last score
            if(i < _SCORES.count)
            {
                scores = scores + ","
                names = names + ","
            }
            
            i = i + 1;
        }*/
        
        //Saving NSuserdefaults values
        let userDefaults = UserDefaults.standard
        userDefaults.set(_SCORES, forKey: Key)
        
    }
    
    public func LoadScores() -> [Score]
    {
        let userDefaults = UserDefaults.standard
        return userDefaults.value(forKey: Key) as! Array<Score>
    }
}
