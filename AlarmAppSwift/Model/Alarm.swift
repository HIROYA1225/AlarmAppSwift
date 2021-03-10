//
//  Alarm.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import UIKit
import AVFoundation

//ユーザーが設定した時刻までタイマーでカウントダウンを行う
class Alarm{
    var selectedWakeUpTime:Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0
    
    //タイマー実行
    func runTimer(){
        //カウントダウンに必要な秒数の計算
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        //sleepTimerがnilなら続けて、nilでなければrunTimer()を出る
        guard sleepTimer == nil else{
            return
        }
        //sleepTimerがnilだった場合、updateTimerを一秒間隔で呼び出す
        if sleepTimer == nil{
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    //一秒ごとにsleepTimerに呼ばれる
    @objc private func updateTimer(){
        //secondsが一秒以上なら
        if seconds != 0{
            //-1秒する
            seconds -= 1
            print(seconds)
        }else{//secondsが0になったら
            //タイマーを止める
            sleepTimer?.invalidate()
            //sleepTimerにnilを代入
            sleepTimer = nil
            //音源のパスを指定
            let soundPath = Bundle.main.bundleURL.appendingPathComponent("dog.mp3")
            do{
                //AVAudioPlayerを作成
                audioPlayer = try AVAudioPlayer(contentsOf: soundPath, fileTypeHint: nil)
                //バックグラウンド再生
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            }catch{
                print("Could not load file")
            }
            //アラーム音再生
            audioPlayer.play()
        }
    }
    
    //カウントダウンに必要な秒数の計算
    private func calculateInterval(userAwakeTime:Date)->Int{
        //現在時刻から設定時刻までの秒数をintervalに代入
        //timeIntervalSinceNow -> the interval between the date object and the current date and time
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        //日をまたいだ場合の計算処理
        if interval < 0{
            interval = 86400 - (0 - interval)
        }
        //interval計算のズレの訂正処理
        let calendar = Calendar.current
        //セットした時刻から「秒」のみをsecondsに代入
        let seconds = calendar.component(.second, from: userAwakeTime)
        //(起床時間 - 現在時刻) - seconds
        return interval - seconds
        
    }
    
    func stopTimer(){
        //sleepTimerがnilでない場合
        if sleepTimer != nil{
            //タイマー止める
            sleepTimer?.invalidate()
            //sleepTimerにnilを代入
            sleepTimer = nil
        }else{
            //アラーム止める
            audioPlayer.stop()
        }
    }
}
