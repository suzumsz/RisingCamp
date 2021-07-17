//
//  DiaryTableViewCell.swift
//  AnimalDiary
//
//  Created by 김수정 on 2021/07/06.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var diaryImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    static let identifier = "DiaryTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


