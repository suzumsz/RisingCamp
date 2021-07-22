//
//  tabBarVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/21.
//

import UIKit
import FSCalendar

class tabBarVC: UIViewController {

    
    @IBOutlet weak var toggleTap: UIButton!
    @IBOutlet weak var calendarUIView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calendarUIView.select(Date())
        
        //setCalendarStyle()
        
        setCalendarStyleWeek()
    }
    
    

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

//extension tabBarVC: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if(indexPath.row == 0) {
////            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tabBarPageCVCell.identifier, for: indexPath) as? tabBarPageCVCell else{
////                return UICollectionViewCell()
////            }
//
//
//            //return cell
//        }
//    return UICollectionViewCell()
//    }
//
//}
//
//extension tabBarVC: UICollectionViewDelegate {
//
//}
