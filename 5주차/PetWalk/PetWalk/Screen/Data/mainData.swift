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
    var walkMealArray = Array<WalkMeal>()
    var dogName : String?
    var dogSex : String?
    var dogImage : UIImage?
    var dogBreed : String?
    var dogAge : String?
    var dogWeight: String?
    var loginUser : String?
    var walkTimer : String?
    var currentDate : String?
    private init(){}
}

struct WalkMeal {
    var walkTime: String
    var walkDate: String
    var mealName: String
    var mealDate: String
}




