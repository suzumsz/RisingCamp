//
//  UserInfoVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/19.
//



import UIKit

class UserInfoVC: UIViewController {
    
    var nameLabel : String?

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var nextPageBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = nameLabel! + String("님!")

        textFieldStyle()
    }
    
    
    func textFieldStyle() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: dogNameTextField.frame.height - 1, width: dogNameTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        dogNameTextField.borderStyle = UITextField.BorderStyle.none
        dogNameTextField.layer.addSublayer(bottomLine)
    }

    @IBAction func didTapNextPage(_ sender: Any) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "DogInfoVC") as? DogInfoVC else {return}
        
        dvc.dogName = dogNameTextField.text
        main.shared.dogName = dvc.dogName
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
        
    }
    
 
    @IBAction func didTapCancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

