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
    var testData = [1,2,3]
    
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
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: swipeTableViewCell.identifier, for: indexPath) as? swipeTableViewCell else{
            return UITableViewCell()
        }
        
        if tabBar == tabEnum.walk {
            cell.walkOrMealLabel.text = "산책시간"
            cell.dateTimeLabel.text = "날짜"
            cell.walkLabel.text = userMainData.shared.walkTimer
            cell.dateLabel.text = "안햇당께롱"
        }
        else if tabBar == tabEnum.meal {
            cell.walkOrMealLabel.text = "식사시ㄴ"
            cell.dateTimeLabel.text = "날짜"
            cell.walkLabel.text = "여기는 식사기록입니다."
            cell.dateLabel.text = "루릴루릴"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
    }
    
}
