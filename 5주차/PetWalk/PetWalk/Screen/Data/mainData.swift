//
//  mainData.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import Foundation
import UIKit

class userMainData {
    static let shared = userMainData()
    var dogName : String?
    var dogSex : String?
    var dogImage : UIImage?
    var dogBreed : String?
    var dogAge : String?
    var dogWeight: String?
    var loginUser : String?
    private init(){}
}



