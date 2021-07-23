//
//  CustomSideMenuNavigation.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit
import SideMenu

class CustomSideMenuNavigation: SideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사이드 바 설정
        self.presentationStyle = .menuSlideIn
        self.leftSide = true
        self.menuWidth = self.view.frame.width * 0.8
        self.presentationStyle.backgroundColor = .black
        self.presentationStyle.presentingEndAlpha = 0.7
        self.statusBarEndAlpha = 0.0
        
        //상단 상태바 보이도록 설정 0 ( 0~1 default 1 )
        self.statusBarEndAlpha = 0.0
    }
}
