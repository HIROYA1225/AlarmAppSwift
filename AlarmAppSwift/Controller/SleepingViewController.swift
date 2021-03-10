//
//  SleepingViewController.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import Foundation
import UIKit

class SleepingViewController: UIViewController{
    
    @IBOutlet var timeArray: UITableView!
    
    @IBAction func addTimeBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "goTimeSetting", sender: nil)
    }
    
}
