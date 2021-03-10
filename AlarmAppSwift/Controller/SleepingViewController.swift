//
//  SleepingViewController.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import Foundation
import UIKit

class SleepingViewController: UIViewController{
    var currentTime = CurrentTime()
    
    @IBOutlet var timeLabel: UILabel!
    
    override func viewDidLoad(){
        currentTime.delegate = self
    }
    
    @IBAction func closeBtnWasPressed(_ sender: UIButton) {
        //移動先の画面でdismissを実行すると、移動前の画面に戻る
        dismiss(animated: true, completion: nil)
        
    }
    
    func updateTime(_ time:String){
        timeLabel.text = time
    }
}
