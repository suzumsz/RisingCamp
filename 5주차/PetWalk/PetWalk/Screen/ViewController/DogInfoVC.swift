//
//  DogInfoVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit

class DogInfoVC: UIViewController {
    
    // MARK: - Properties
    // picker에 넣어줄 배열
    let dogBreed = ["닥스훈트", "슈나우저", "래브라도레트리버", "푸들", "말티즈", "불독", "보더콜리"]
    var dogName : String?
    var dogSexName : String?
    
    // IBOulet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var girlBtn: UIButton!
    @IBOutlet weak var boyBtn: UIButton!
    @IBOutlet weak var dogBreedTextField: UITextField!
    @IBOutlet weak var nextPageBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dogBreed Select Picker
        createPickerView()
        dismissPickerView()
        
        // btn
        setBtnColor()
        
        // textFieldStyle
        textFieldStyle()
        
        // 기타
        addString()
    }
    
    // MARK: - Function
    // TextField Style
    func textFieldStyle() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: dogBreedTextField.frame.height - 1, width: dogBreedTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        dogBreedTextField.borderStyle = UITextField.BorderStyle.none
        dogBreedTextField.layer.addSublayer(bottomLine)
        dogBreedTextField.tintColor = .clear
    }
    
    // btn Color
    func setBtnColor() {
        girlBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        girlBtn.layer.borderWidth = 1
        girlBtn.layer.cornerRadius = 5
        
        boyBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        boyBtn.layer.borderWidth = 1
        boyBtn.layer.cornerRadius = 5
    }
    
    // 기타
    func addString() {
        // 강아지 이름 뒤에 값 추가
        dogNameLabel.text = dogName! + String("를 더 알고싶어요!")
    }
    
    // MARK: - IBAction
    // 뒤로가기 버튼
    @IBAction func didTapBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 다음 페이지 버튼
    @IBAction func didTapNextPage(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(identifier: "DogInfoRegisterVC") as? DogInfoRegisterVC else {return}
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    // 강아지 성별 고르는 버튼 : 남아
    @IBAction func didSelectBoyBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == false {
            boyBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            boyBtn.layer.borderWidth = 1
            boyBtn.layer.cornerRadius = 5
        }
        else {
            boyBtn.layer.borderColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
            boyBtn.layer.borderWidth = 1
            boyBtn.layer.cornerRadius = 5
            dogSexName = "남아"
            userMainData.shared.dogSex = dogSexName
        }
    }
    
    // 강아지 성별 고르는 버튼 : 여아
    @IBAction func didSelectGirlBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == false {
            girlBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            girlBtn.layer.borderWidth = 1
            girlBtn.layer.cornerRadius = 5
        }
        else {
            girlBtn.layer.borderColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
            girlBtn.layer.borderWidth = 1
            girlBtn.layer.cornerRadius = 5
            dogSexName = "여아"
            userMainData.shared.dogSex = dogSexName
        }
    }
}

// MARK: - UIPicker Delegate, DataSource
extension DogInfoVC: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogBreed.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogBreed[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dogBreedTextField.text = dogBreed[row]
        userMainData.shared.dogBreed = dogBreedTextField.text
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        dogBreedTextField.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        dogBreedTextField.inputAccessoryView = toolBar
    }
    @objc func action() {
        dogBreedTextField.resignFirstResponder()
    }
}
