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
        
        self.presentationStyle = .menuSlideIn
        self.leftSide = true
        
        //상단 상태바 보이도록 설정 0 ( 0~1 default 1 )
              self.statusBarEndAlpha = 0.0
        
    }
    

    
}
