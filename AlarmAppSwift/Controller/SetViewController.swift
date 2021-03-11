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
    
    var timeArray: [Date] = []
    
    @IBOutlet var sleepTimePicker: UIDatePicker!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //datePickerMode -> 日付ピッカーのモード設定
        //dateAndTime -> The mode determines whether dates, times, or both dates and times are displayed
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        //sets the date to display in the date picker
        sleepTimePicker.setDate(Date(), animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool){
        //sleepTimerがnil出ない場合
        if alarm.sleepTimer != nil{
            //再生されているタイマーを止める。
            alarm.stopTimer()
        }
    }
    //SETボタンが押されたときの処理
    @IBAction func setBtnWasPressed(_ sender: Any) {
        //selectedWakeUpTimeにユーザーの入力した日付を代入
        //alarm.selectedWakeUpTime = sleepTimePicker.date
        timeArray.append(sleepTimePicker.date)
        //タイマー実行
        //alarm.runTimer()
        //画面移動
        self.performSegue(withIdentifier: "goHome", sender: nil)
    }
    
    
}
