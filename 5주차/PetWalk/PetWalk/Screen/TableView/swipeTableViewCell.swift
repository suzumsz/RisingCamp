//
//  swipeTableViewCell.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/23.
//

import UIKit

class swipeTableViewCell: UITableViewCell {

    static let identifier = "swipeTableViewCell"
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var walkOrMealLabel: UILabel!
    @IBOutlet weak var walkLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "swipeTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
