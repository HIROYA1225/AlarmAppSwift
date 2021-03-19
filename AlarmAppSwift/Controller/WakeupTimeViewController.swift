//
//  SleepingViewController.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import Foundation
import UIKit

class WakeupTimeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var timeArray2nd: [Date] = []

    @IBOutlet var tableView: UITableView!
    
    //セルの個数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の個数をリターン
        return timeArray2nd.count
    }
    
    //Table View CellのIdentifierを指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath)
        
        //Date -> Stringへ変換し、dateへ代入
        let date = stringFromDate(date: timeArray2nd[indexPath.row], format: "yyyy年MM月dd日 HH時mm分ss秒")
                
        // セルに表示する値を設定する
        cell.textLabel!.text = date
        
        return cell
    }
    
    
    @IBOutlet var WakeupTimeArray: UITableView!
    
    //+が押されたときの処理
    @IBAction func addTimeBtnWasPressed(_ sender: Any) {
        let nextVC = self.presentingViewController as? SetViewController
        
        nextVC?.timeArray = timeArray2nd
        //時間設定画面へ
        performSegue(withIdentifier: "goTimeSetting", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        }
    //時間設定画面から戻ってきたときの処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //tableViewを更新
        tableView.reloadData()
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
    
    //Date -> String変換
    func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
}
