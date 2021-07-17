//
//  TableViewCell.swift
//  MemoApp
//
//  Created by 김수정 on 2021/07/01.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"

    @IBOutlet weak var memoContentLabel: UILabel!
    @IBOutlet weak var nowDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
