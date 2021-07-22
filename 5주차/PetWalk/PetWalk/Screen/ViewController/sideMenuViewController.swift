//
//  sideMenuViewController.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit
import KakaoSDKUser

class sideMenuViewController: UIViewController {

    @IBOutlet weak var dogSexLabel: UILabel!
    @IBOutlet weak var dogWeightLabel: UILabel!
    @IBOutlet weak var dogBreedLabel: UILabel!
    @IBOutlet weak var dogAgeLabel: UILabel!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogNameLabel.text = userMainData.shared.dogName
        dogAgeLabel.text = userMainData.shared.dogAge
        dogBreedLabel.text = userMainData.shared.dogBreed
        dogWeightLabel.text = userMainData.shared.dogWeight
        dogImageView.image = userMainData.shared.dogImage
        dogSexLabel.text = userMainData.shared.dogSex
        
        dogImageView.layer.cornerRadius = dogImageView.frame.height/2

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func kakaoLogoutBtnTouched(_ sender: Any) {
//        UserApi.shared.logout {(error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("logout() success.")
//
//                guard let dvc = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {return}
//
//                self.navigationController?.popToViewController(dvc, animated: true)
                
                // 로그아웃 사이드메뉴에 하지 말아보기
                // 첫번째화면으로가게하자 강아지정보도초기화시켜
                // 날씨정보띄우는거 뷰윌어피어에서ㅎ해라
                    
                
                
            //}
       // }
    }
    
    


}
