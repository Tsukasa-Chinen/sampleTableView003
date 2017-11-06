//
//  DetailViewController.swift
//  sampleTableView001
//
//  Created by Tsukasa Chinen on 2017/11/03.
//  Copyright © 2017年 Tsukasa Chinen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    /* Label (teaName) */
    @IBOutlet weak var teaName: UILabel!
    
    /* textView (teaDescription) */
    @IBOutlet weak var teaDescription: UITextView!

    /* imageView (teaImage) */
    @IBOutlet weak var teaImage: UIImageView!

    // 受け取った行番号を保存しておくための変数を作成する
    var passedIndex:Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        if(passedIndex != -1){
            /* Title */
            teaName.text = teaListTitle[passedIndex]
            teaName.textColor = UIColor(red: 237/255.0, green: 153/255.0, blue: 35/255.0, alpha: 1.0)
            teaName.font = UIFont.boldSystemFont(ofSize: 20)

            /* Description */
            teaDescription.text = "\(teaListDescription[passedIndex])\n\n"
            teaDescription.sizeToFit()
            teaDescription.textColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
            teaDescription.isEditable = false
            teaDescription.isSelectable = true
            teaDescription.dataDetectorTypes = UIDataDetectorTypes.all

            /* Image */
            teaImage.image = UIImage(named: "assets/\(teaListImages[passedIndex])")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
