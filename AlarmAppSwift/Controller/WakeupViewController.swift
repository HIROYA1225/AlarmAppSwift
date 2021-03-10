//
//  WakeupViewController.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/03/10.
//

import Foundation
import UIKit

class WakeupViewController: UIViewController {
    var currentTime = CurrentTime()
    
    override func viewDidLoad(){
        //currentTime.delegate = self
    }
    
    func updateTime(_ time:String){
        timeLabel.text = time
    }
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBAction func stopBtnWasPressed(_ sender: UIButton) {
        //移動先の画面でdismissを実行すると、移動前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
}
