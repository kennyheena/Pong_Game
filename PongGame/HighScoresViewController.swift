//
//  HighScoresViewController.swift
//  PongGame
//
//  Created by Ashleigh Pinch on 16/05/2017.
//  Copyright © 2017 Sandun Heenatigala. All rights reserved.
//

import UIKit
import Foundation

class HighScoresViewController : UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cellEmpty = tableView.dequeueReusableCell(withIdentifier: "highScoreCell")
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "highScoreCell", for: indexPath as IndexPath)
        cell.textLabel?.textColor = UIColor.white
        
        let name = _SCORES[indexPath.row].Name
        let score = String(_SCORES[indexPath.row].Score)
        let pos = String(indexPath.row + 1)
        
        // Setting cell text
        cell.textLabel?.text = pos + ". " + name + " : " + score + "pts"
        
        return cell
    }


    var score : Score!
    
    @IBOutlet var TableView : UITableView!
        {didSet { TableView.dataSource = self} }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Loading scores into global _SCORES array
        score = Score()
        score.LoadScores()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _SCORES.count
    }
    /*
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellEmpty = tableView.dequeueReusableCell(withIdentifier: "highScoreCell")
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "highScoreCell", for: indexPath as IndexPath)

        
        let name = _SCORES[indexPath.row].Name
        let score = String(_SCORES[indexPath.row].Score)
        let pos = String(indexPath.row + 1)
        
        // Setting cell text
        cell.textLabel?.text = pos + ". " + name + " : " + score + "pts"
        
        return cell
    }*/
}
