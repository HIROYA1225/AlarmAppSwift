//
//  CurrentTime.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import Foundation

//現在時間の取得と表示する
class CurrentTime{
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: WakeupTimeViewController?
    
    init(){
        if timer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼び出す
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateCurrentTime(){
        //フォーマットの指定
        df.dateFormat = "HH:mm"
        //タイムゾーンを端末のものに合わせる
        df.timeZone = TimeZone.current
        //現在の時間をフォーマットに合わせて設定する
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        //delegate?.updateTime(currentTime!)
    }
}
