//
//  tabBarVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/21.
//

import UIKit
import FSCalendar

enum tabBarBtn {
    case walk, meal
    }

class tabBarVC: UIViewController {

    
    // MARK: - Properties
    var tabPage = [tabBarBtn.walk,tabBarBtn.meal]
    //var tabage = ["banner1","banner2"]
    @IBOutlet weak var toggleTap: UIButton!
    @IBOutlet weak var calendarUIView: FSCalendar!
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendarStyleWeek()
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
    }
    
    // MARK: - Function
    // calendar week
    func setCalendarStyleWeek() {
        calendarUIView.scope = .week
        calendarUIView.accessibilityIdentifier = "calender"
        calendarUIView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarUIView.locale = Locale(identifier: "ko_KR")
        calendarUIView.appearance.headerDateFormat = "M월"
        calendarUIView.headerHeight = 50
        calendarUIView.appearance.weekdayTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        calendarUIView.appearance.selectionColor = .none
        calendarUIView.appearance.titleSelectionColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.todayColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.todaySelectionColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.headerTitleColor = .black
    }
    
    // calendar month
    func setCalendarStyleMonth() {
        calendarUIView.scope = .month
        calendarUIView.accessibilityIdentifier = "calender"
        calendarUIView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarUIView.locale = Locale(identifier: "ko_KR")
        calendarUIView.appearance.headerDateFormat = "M월"
        calendarUIView.headerHeight = 50
        calendarUIView.appearance.weekdayTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        calendarUIView.appearance.selectionColor = .none
        calendarUIView.appearance.titleSelectionColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.todayColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.todaySelectionColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.headerTitleColor = .black
    }
    
    // MARK: - IBAction
    @IBAction func walkRecord(_ sender: UIButton) {
        tabBarCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func mealRecord(_ sender: UIButton) {
        tabBarCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func didTapToggle(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            setCalendarStyleMonth()
        }
        else {
            setCalendarStyleWeek()
        }
    }
}

extension tabBarVC: UICollectionViewDelegate {
}

extension tabBarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabPage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tabCVCell.identifier, for: indexPath) as? tabCVCell else {
            return UICollectionViewCell() }
        
        cell.tabBar = tabPage[indexPath.row]
        //cell.setImage(imageName: tabPage[indexPath.item])
        
        return cell
    }
}

extension tabBarVC: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    //
    //MARK: - Paging Effect
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
//    {
//        //let cellWidthIncludeSpacing = (self.ExploreCVCell.frame.width)-40
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
//        let roundedIndex: CGFloat = round(index)
//
//        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
}
