//
//  ViewController.swift
//  sampleTableView001
//
//  Created by Tsukasa Chinen on 2017/10/30.
//  Copyright © 2017年 Tsukasa Chinen. All rights reserved.
//

import UIKit

/* 1. プロトコルの設定（ DataSource, Delegate ） */
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /* Table View */
    @IBOutlet weak var myTableView: UITableView!

    // 何行目が選択されたか保存する変数
    // -1は、何もまだ行番号が保存されていないという目印
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Storyboadで設定する（Pickerviewの時はプログラムで指定） */
        /* 4. TableViewに指示を出すのがViewControllerだと設定する */
        myTableView.delegate = self
        myTableView.dataSource = self

    }

    /* 2. 行数の設定 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teaListTitle.count
    }
    /* 3. リストに表示する文字列を決定し表示 */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        /* 文字を表示するセルの取得 */
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        /* 表示したい文字の設定 （行数の設定で指定した数だけループされる）*/
        cell.textLabel?.text = teaListTitle[indexPath.row]
        cell.textLabel?.textColor = UIColor(red: 237/255.0, green: 153/255.0, blue: 35/255.0, alpha: 1.0)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator

        /* 文字を設定したセルを返す */
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(indexPath.row)がタップされました")
        selectedIndex = indexPath.row
        
        // セグエの名前を指定して画面遷移処理を発動する
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面のインスタンス（オブジェクト）を取得
        // as! DetailViewControllerがダウンキャストに変換している箇所
        let dvc:DetailViewController = segue.destination as! DetailViewController

        // 次の画面のプロパティ（メンバ変数）passedIndexに選択された番号を渡す
        dvc.passedIndex = selectedIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

