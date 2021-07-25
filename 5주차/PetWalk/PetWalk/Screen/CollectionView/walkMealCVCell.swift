//
//  walkMealCVCell.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/23.
//

import UIKit

struct walkData {
    var walkDate : String
    var walkTime : String
    var mealTime : String
    var mealDate : String
}

class walkMealCVCell: UICollectionViewCell {

    static let identifier = "walkMealCVCell"
    
    var tabBar : tabEnum?
    //var testData = [1,2,3]
    
    @IBOutlet weak var tabTableView: UITableView!
    
    static func nib() -> UINib {
        return UINib(nibName: "walkMealCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tabTableView.delegate = self
        tabTableView.dataSource = self
        
        self.tabTableView.register(swipeTableViewCell.nib(), forCellReuseIdentifier: swipeTableViewCell.identifier)
    }

}

extension walkMealCVCell: UITableViewDelegate {
    
}

extension walkMealCVCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: swipeTableViewCell.identifier, for: indexPath) as? swipeTableViewCell else{
            return UITableViewCell()
        }
        
        
        // 산책내역
        if tabBar == tabEnum.walk {
            cell.walkOrMealLabel.text = "산책시간"
            cell.dateLabel.text = "날짜"
            
            // 날짜는 달력에 선택된 날짜로 가져오기
            cell.dateTimeLabel.text = userMainData.shared.currentDate
            print("이건들어옴?",userMainData.shared.currentDate)
            cell.walkLabel.text = userMainData.shared.walkTimer
        }
        
        // 식사내역
        else if tabBar == tabEnum.meal {
            cell.walkOrMealLabel.text = "사료명"
            cell.dateLabel.text = "종류"
            
            // 달력에 선택된 날짜 가져오기
            cell.dateTimeLabel.text = "식사"
            cell.walkLabel.text = "닥터독"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
    
    }
    
    
    
}
