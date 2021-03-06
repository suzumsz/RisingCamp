//
//  DogInfoRegisterVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit

class DogInfoRegisterVC: UIViewController {
    
    //MARK: - Properties
    let picker = UIImagePickerController()
    let datePicker = UIDatePicker()
    @IBOutlet weak var addImageLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var addImageBtn: UIButton!
    @IBOutlet weak var completeBtn: UIButton!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageText()
        textFieldStyle1()
        textFieldStyle2()
        showDatePicker()
        set()
    }
    
    // MARK: - Function
    // datepicker
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        ageTextField.inputAccessoryView = toolbar
        ageTextField.inputView = datePicker
    }
    
    // 확인
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        ageTextField.text = formatter.string(from: datePicker.date)
        userMainData.shared.dogAge = ageTextField.text
        self.view.endEditing(true)
    }
    
    // 취소
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    // UIImagePicker
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    // imageText
    func setImageText() {
        if dogImageView.image != nil {
            addImageLabel.isHidden = true
        }
        else {
            addImageLabel.isHidden = false
        }
    }
    
    // textFieldStyle1
    func textFieldStyle1() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: ageTextField.frame.height - 1, width: ageTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        ageTextField.borderStyle = UITextField.BorderStyle.none
        ageTextField.layer.addSublayer(bottomLine)
    }
    
    // textFieldStyle2
    func textFieldStyle2() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: weightTextField.frame.height - 1, width: weightTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        weightTextField.borderStyle = UITextField.BorderStyle.none
        weightTextField.layer.addSublayer(bottomLine)
    }
    
    // 기타
    func set() {
        ageTextField.tintColor = .clear
        picker.delegate = self
    }
    
    // MARK: - IBAction
    // 뒤로가기버튼
    @IBAction func didTapDismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 완료버튼
    @IBAction func didTapComplete(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "tabBarController") as? tabBarController else {return}
        userMainData.shared.dogWeight = weightTextField.text
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    // 이미지 추가 버튼
    @IBAction func didTapImage(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) {
            (action) in self.openLibrary()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Delegate, DataSource
extension DogInfoRegisterVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            dogImageView.image = image
            print(info)
            userMainData.shared.dogImage = dogImageView.image
            addImageLabel.isHidden = true
            
        }
        dismiss(animated: true, completion: nil)
    }
}


