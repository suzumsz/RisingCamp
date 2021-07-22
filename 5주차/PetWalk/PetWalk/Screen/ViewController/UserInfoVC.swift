//
//  UserInfoVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/19.
//

import UIKit

class UserInfoVC: UIViewController {
    
    // MARK: - Properties
    var nameLabel : String?
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var nextPageBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = nameLabel! + String("님!")
        textFieldStyle()
    }
    
    // MARK: - Function
    // TextField Style
    func textFieldStyle() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: dogNameTextField.frame.height - 1, width: dogNameTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        dogNameTextField.borderStyle = UITextField.BorderStyle.none
        dogNameTextField.layer.addSublayer(bottomLine)
    }
    
    // MARK: - IBAction
    // 다음 페이지로 넘어갈 버튼
    @IBAction func didTapNextPage(_ sender: Any) {
        
        // 다음 페이지 'DogInfoVC' 선언
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "DogInfoVC") as? DogInfoVC else {return}
        
        // 강아지 이름 싱글톤으로 선언한 구조체에 넣어주기
        dvc.dogName = dogNameTextField.text
        userMainData.shared.dogName = dvc.dogName
        
        // 'DogInfoVC' 호출
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    // 취소 버튼
    @IBAction func didTapCancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

