//
//  UpdateViewController.swift
//  MemoApp
//
//  Created by 김수정 on 2021/07/02.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var updateTextView: UITextView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var editCompleteBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowDateFormatter()
        textViewStyle()
    }
    // MARK: - Date & Time
    func nowDateFormatter() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let current_date_string = formatter.string(from: Date())
        print(current_date_string)
        dateTimeLabel.text = current_date_string
    }
    
    func textViewStyle() {
        //updateTextView.backgroundColor = .systemGray6
        //updateTextView.layer.borderWidth = 0.5
        //updateTextView.layer.borderColor = UIColor.systemGray2.cgColor
    }
    

}
