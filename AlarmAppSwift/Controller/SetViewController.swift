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
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //datePickerMode -> 日付ピッカーのモード設定
        //dateAndTime -> The mode determines whether dates, times, or both dates and times are displayed
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        //sets the date to display in the date picker
        print(#function, sleepTimePicker.date)
        sleepTimePicker.setDate(Date(), animated: false)
        print(#function, sleepTimePicker.date)
    }
    
    override func viewDidAppear(_ animated: Bool){
        //sleepTimerがnil出ない場合
        if alarm.sleepTimer != nil{
            //再生されているタイマーを止める。
            alarm.stopTimer()
        }
    }
    //SETボタンが押されたときの処理
    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        //selectedWakeUpTimeにユーザーの入力した日付を代入
        alarm.selectedWakeUpTime = sleepTimePicker.date
        //タイマー実行
        alarm.runTimer()
        //画面移動
        performSegue(withIdentifier: "setToSleeping", sender: nil)
    }
    
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
    }
    
}
