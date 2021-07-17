//
//  EditViewController.swift
//  MemoApp
//
//  Created by 김수정 on 2021/07/01.
//

import UIKit

class EditViewController: UIViewController {
    
    var idx : Int?
    var memoText : String?
    
    // MARK: - IBOutlet
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nowDateFormatter()
        textViewStyle()
        
        // 뷰컨 1에서 받은 데이터가 잘 들어오는지 확인
        print(memoText ?? "text")
        
        // memoTextView에 뷰컨1에서 받은 텍스트 할당
        memoTextView.text = memoText
    }
    
    // MARK: - Date & Time
    func nowDateFormatter() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let current_date_string = formatter.string(from: Date())
        print(current_date_string)
        dateLabel.text = current_date_string
    }
    
    // MARK: - TextViewStyle
    func textViewStyle() {
        //memoTextView.backgroundColor = .systemGray6
        //memoTextView.layer.borderWidth = 0.5
        //memoTextView.layer.borderColor = UIColor.systemGray2.cgColor
    }
   
    // MARK: - IBAction
    // 뒤로가기 버튼
    @IBAction func backBtn(_ sender: Any) {
        MainData.shared.saveDidComplete = false
        self.dismiss(animated: true, completion: nil)
    }
    
    // 저장 버튼
    @IBAction func saveBtn(_ sender: Any) {
        MainData.shared.saveDidComplete = true
        
        // 옵셔널 바인딩으로 temp의 값이 있을 때에는 값 수정
        if let temp : Int = idx {
            MainData.shared.memoArray[temp].content = memoTextView.text
        }
        // 없을 때에는 append로 셀 추가
        else {
            MainData.shared.memoArray.append(Memo(content: memoTextView.text!, date: dateLabel.text!))
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
