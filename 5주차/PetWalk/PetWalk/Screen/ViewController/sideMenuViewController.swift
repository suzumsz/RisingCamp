//
//  sideMenuViewController.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit
import KakaoSDKUser

class sideMenuViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var dogSexLabel: UILabel!
    @IBOutlet weak var dogWeightLabel: UILabel!
    @IBOutlet weak var dogBreedLabel: UILabel!
    @IBOutlet weak var dogAgeLabel: UILabel!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    // MARK: - Function
    func setData() {
        // 값 넣기
        dogNameLabel.text = userMainData.shared.dogName
        dogAgeLabel.text = userMainData.shared.dogAge
        dogBreedLabel.text = userMainData.shared.dogBreed
        dogWeightLabel.text = userMainData.shared.dogWeight! + String("kg")
        dogImageView.image = userMainData.shared.dogImage
        dogSexLabel.text = userMainData.shared.dogSex
        
        // 이미지 동그랗게
        dogImageView.layer.cornerRadius = dogImageView.frame.height/2
        
        // navigationbar hidden
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
