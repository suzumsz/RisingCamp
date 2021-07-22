//
//  ViewController.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/19.
//


// 비밀번호 틀렸을 때 틀렸다는 알림창 나오게.
// 로그아웃

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 카카오소셜로그인(웹) → 시뮬레이터에
    @IBAction func kakaoLoginBtnTouched(_ sender: Any) {
        
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                // 어세스토큰
                let accessToken = oauthToken?.accessToken
                
                //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                
                guard let dvc = self.storyboard?.instantiateViewController(identifier: "UserInfoVC") as? UserInfoVC else {return}
                
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("me() success.")
                        //do something
                        _ = user
                        dvc.nameLabel = user?.kakaoAccount?.profile?.nickname
                        
                         userMainData.shared.loginUser = user?.kakaoAccount?.profile?.nickname
                    }
                    
                
                    self.navigationController?.pushViewController(dvc, animated: true)
//                dvc.modalPresentationStyle = .fullScreen
//                self.present(dvc, animated: true, completion: nil)
                
            
                
                
                }
                
            }
        }
    }
    
//    func setUserInfo() {
//        UserApi.shared.me() {(user, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("me() success.")
//                //do something
//                _ = user
//                self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
//            }
//        }
//    }

    
    @IBAction func kakaoLogoutBtnTouched(_ sender: Any) {
   

    }

}
