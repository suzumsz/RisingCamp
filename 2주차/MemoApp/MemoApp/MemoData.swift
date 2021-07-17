//
//  MemoData.swift
//  MemoApp
//
//  Created by 김수정 on 2021/07/01.
//

import Foundation

class MainData {
    static let shared = MainData()
    var saveDidComplete : Bool = false
    var memoArray = Array<Memo>()
    var visitCount : Int = 0
    var colorIndex : Int = 0
    
    private init(){}
}

struct Memo {
    var content: String
    var date: String
}
