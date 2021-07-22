//
//  ViewController.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/19.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    // MARK: - IBOulet
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Kakao Social Login
    // 카카오소셜로그인(웹) → 시뮬레이터에 카카오톡이 없으므로 웹으로 로그인 진행
    // kakao login btn
    @IBAction func kakaoLoginBtnTouched(_ sender: Any) {
        
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                // 로그인 성공
                print("loginWithKakaoAccount() success.")
                
                // 액세스 토큰
                _ = oauthToken
                let accessToken = oauthToken?.accessToken
                
                // 로그인 성공시, 'UserInfoVC' 호출
                guard let dvc = self.storyboard?.instantiateViewController(identifier: "UserInfoVC") as? UserInfoVC else {return}
                
                // 카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        // 사용자 정보 가져옴
                        print("me() success.")
                        
                        _ = user
                        // 사용자의 닉네임을 받아 'nameLabel'에 넣어줌
                        dvc.nameLabel = user?.kakaoAccount?.profile?.nickname
                        
                        // 사용자의 정보를 싱글톤으로 선언한 구조체에 넣어주어 어디든 접근 가능하게 함
                        userMainData.shared.loginUser = user?.kakaoAccount?.profile?.nickname
                    }
                    
                    // 'UserInfoVC' 호출
                    self.navigationController?.pushViewController(dvc, animated: true)
                }
            }
        }
    }
}
