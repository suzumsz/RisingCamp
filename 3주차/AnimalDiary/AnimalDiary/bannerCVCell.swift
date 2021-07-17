//
//  bannerCVCell.swift
//  AnimalDiary
//
//  Created by 김수정 on 2021/07/09.
//

import UIKit

class bannerCVCell: UICollectionViewCell {
    
    static let identifier = "bannerCVCell"
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    
    
    func setImage(imageName: String) {
        bannerImageView.image = UIImage(named: imageName)
    }
}
