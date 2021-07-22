//
//  tabBarVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/21.
//

import UIKit
import FSCalendar

class tabBarVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var toggleTap: UIButton!
    @IBOutlet weak var calendarUIView: FSCalendar!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendarStyleWeek()
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
