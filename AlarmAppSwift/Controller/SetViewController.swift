//
//  SetViewController.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import UIKit
import AVFoundation

class SetViewController: UIViewController{
    
    let alarm = Alarm()
    //A control for the inputting of date and time values
    
    @IBOutlet var sleepTimePicker: UIDatePicker!
    
    var timeArray: [Date] = []
    
    var resultHandler: (([Date]) -> Void)?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //datePickerMode -> 日付ピッカーのモード設定
        //dateAndTime -> The mode determines whether dates, times, or both dates and times are displayed
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        //sets the date to display in the date picker
        sleepTimePicker.setDate(Date(), animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool){
        //sleepTimerがnilでない場合
        if alarm.sleepTimer != nil{
            //再生されているタイマーを止める。
            alarm.stopTimer()
        }
    }
    //SETボタンが押されたときの処理
    @IBAction func setBtnWasPressed(_ sender: Any) {
        //selectedWakeUpTimeにユーザーの入力した日付を代入
        //alarm.selectedWakeUpTime = sleepTimePicker.date
        
        let vc = self.presentingViewController as! WakeupTimeViewController
        vc.timeArray2nd.append(sleepTimePicker.date)
        
        self.dismiss(animated: true, completion: nil)
        //タイマー実行
        //alarm.runTimer()
        
        //アラートを設定 p.275
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // segueのIDを確認して特定のsegueのときのみ動作させる
//        if segue.identifier == "goTimeSetting" {
//            // 遷移先のViewControllerを取得
//            let next = segue.destination as? SetViewController
//            // 遷移先のプロパティに処理ごと渡す
//
//
//            }
//        }
}
