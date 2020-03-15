//
//  StopwatchVC.swift
//  clockDemo
//
//  Created by Hasan Ali on 15.03.2020.
//  Copyright © 2020 Hasan Ali Şişeci. All rights reserved.
//

import UIKit

class StopwatchVC: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var pauseOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    
    var myTimer = Timer()
    var counter : Int = 0
    
    @objc func timerRun() {
        counter += 1
        timeLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startClicked(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        startOutlet.isEnabled = false
    }
    

    @IBAction func pauseClicked(_ sender: Any) {
        myTimer.invalidate()
        startOutlet.isEnabled = true
    }
    
    
    @IBAction func resetClicked(_ sender: Any) {
        myTimer.invalidate()
        counter = 0
        timeLabel.text = String(counter)
        startOutlet.isEnabled = true
    }
}
