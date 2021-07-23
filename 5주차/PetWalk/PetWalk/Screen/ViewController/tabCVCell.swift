////
////  tabCVCell.swift
////  PetWalk
////
////  Created by 김수정 on 2021/07/22.
////
//
//import UIKit
//
//class tabCVCell: UICollectionViewCell {
//
//    static let identifier = "tabCVCell"
//    var tabBar : tabBarBtn?
//
//    @IBOutlet weak var tabTableView: UITableView!
//
////    static func nib() -> UINib {
////        return UINib(nibName: "tabCVCell", bundle: nil)
////    }
////
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
////        self.tabTableView.register(tabTableTVCell.nib(), forCellWithReuseIdentifier: tabTableTVCell.identifier)
//
//        //tabTableView.dataSource = self
//        tabTableView.delegate = self
//    }
//
//}
//
//extension tabCVCell: UITableViewDelegate {
//
//}
//
////extension tabCVCell: UITableViewDataSource {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 3
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = tableView.dequeueReusableCell(withIdentifier: tabCVCell.identifier, for: indexPath) as? tabTableTVCell else {
////            return UITableViewCell() }
////
////        cell.hiLabel.text = "바부"
////
////        return cell
////    }
////
////}
