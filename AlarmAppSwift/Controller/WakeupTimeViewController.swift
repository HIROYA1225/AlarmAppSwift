//
//  SleepingViewController.swift
//  AlarmAppSwift
//
//  Created by HIRO on 2021/02/20.
//

import Foundation
import UIKit

class WakeupTimeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var timeArray: UITableView!
    
    let fruits = ["apple", "orange", "melon", "banana", "pineapple"]
    
    @IBAction func addTimeBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "goTimeSetting", sender: nil)
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
    
    //セルの個数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    //Table View CellのIdentifierを指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)
                
        // セルに表示する値を設定する
        cell.textLabel!.text = fruits[indexPath.row]
        
        return cell
    }
    
}
