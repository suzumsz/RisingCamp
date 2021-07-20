//
//  DogInfoVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit

class DogInfoVC: UIViewController {
    
    let dogBreed = ["닥스훈트", "슈나우저", "래브라도레트리버", "푸들", "말티즈", "불독", "보더콜리"]
    
    var dogName : String?
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var dogNameLabel: UILabel!
    
    @IBOutlet weak var girlBtn: UIButton!
    @IBOutlet weak var boyBtn: UIButton!
    
    @IBOutlet weak var dogBreedTextField: UITextField!
    
    @IBOutlet weak var nextPageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPickerView()
        dismissPickerView()

        dogNameLabel.text = dogName! + String("를 더 알고싶어요!")
        girlBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        girlBtn.layer.borderWidth = 1
        girlBtn.layer.cornerRadius = 5
        
        boyBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        boyBtn.layer.borderWidth = 1
        boyBtn.layer.cornerRadius = 5
        
        dogBreedTextField.tintColor = .clear
        textFieldStyle()
        
    }
    
    func textFieldStyle() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: dogBreedTextField.frame.height - 1, width: dogBreedTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        dogBreedTextField.borderStyle = UITextField.BorderStyle.none
        dogBreedTextField.layer.addSublayer(bottomLine)
    }
    
 
    
    @IBAction func didTapBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapNextPage(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(identifier: "DogInfoRegisterVC") as? DogInfoRegisterVC else {return}
        
        self.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
    @IBAction func didSelectBoyBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
            boyBtn.layer.borderColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
            boyBtn.layer.borderWidth = 1
            boyBtn.layer.cornerRadius = 5
        
        if sender.isSelected == false {
            boyBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            boyBtn.layer.borderWidth = 1
            boyBtn.layer.cornerRadius = 5
        }
        
        
        
    }
    
    @IBAction func didSelectGirlBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
            girlBtn.layer.borderColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
            girlBtn.layer.borderWidth = 1
            girlBtn.layer.cornerRadius = 5
        
        if sender.isSelected == false {
            girlBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            girlBtn.layer.borderWidth = 1
            girlBtn.layer.cornerRadius = 5
        }
        
    }
    
}

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
        main.shared.dogBreed = dogBreedTextField.text
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
