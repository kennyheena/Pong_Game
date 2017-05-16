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
class Score: NSObject, NSCoding
{
    var Key = "ScoresList"
    var Score = 0
    var Name = ""
    
    public func setScore(score : Int, name : String)
    {
        Score = score
        Name = String(name)
    }
    
    override init()
    {
    }
    
    public func Save()
    {
        _SCORES.append(self)
        _SCORES.sort(by: {$0.Score > $1.Score})
        
        //Saving NSuserdefaults values
        let userDefaults = UserDefaults.standard
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: _SCORES)
        userDefaults.set(encodedData, forKey: Key)
        userDefaults.synchronize()
        
    }
    
    public func LoadScores()
    {
        let userDefaults = UserDefaults.standard
        
        let decoded  = userDefaults.object(forKey: Key) as! Data
        _SCORES = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Score]
    }
    
    
    required convenience init(coder aDecoder: NSCoder) {
        let score = aDecoder.decodeInteger(forKey: "Score")
        let name = aDecoder.decodeObject(forKey: "Name") as! String
        self.init()
        self.setScore(score: score, name: name)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(Score, forKey: "Score")
        aCoder.encode(Name, forKey: "Name")
    }
}
