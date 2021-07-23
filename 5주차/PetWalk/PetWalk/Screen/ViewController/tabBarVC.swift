//
//  tabBarVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/21.
//

import UIKit
import FSCalendar

enum tabEnum {
    case walk, meal
}

class tabBarVC: UIViewController {
    
    // MARK: - Properties
    var tabPage = [tabEnum.walk,tabEnum.meal]
    @IBOutlet weak var walkBtn: UIButton!
    @IBOutlet weak var mealBtn: UIButton!
    @IBOutlet weak var calendarUIView: FSCalendar!
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setCalendarStyleWeek()
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        
        self.tabBarCollectionView.register(walkMealCVCell.nib(), forCellWithReuseIdentifier: walkMealCVCell.identifier)
        
        //walkBtn.setTitleColor(#colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1), for: .normal)
    }
    
    // MARK: - Function
    // calendar week
    func setCalendarStyleWeek() {
        calendarUIView.scope = .week
        calendarUIView.accessibilityIdentifier = "calender"
        calendarUIView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarUIView.locale = Locale(identifier: "ko_KR")
        calendarUIView.appearance.headerDateFormat = "YYYY년 MM월"
        calendarUIView.headerHeight = 50
        calendarUIView.appearance.weekdayTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        calendarUIView.appearance.selectionColor = .none
        calendarUIView.appearance.titleSelectionColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        calendarUIView.appearance.todayColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.todaySelectionColor = #colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1)
        calendarUIView.appearance.headerTitleColor = .black
    }
    

    
    // MARK: - IBAction
    @IBAction func walkRecord(_ sender: UIButton) {
        tabBarCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
       
        if sender.isSelected == true {
            walkBtn.setTitleColor(#colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1), for: .normal)
        }
        else {
            walkBtn.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
        }
        
        
    }
    
    @IBAction func mealRecord(_ sender: UIButton) {
        tabBarCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
        
         if sender.isSelected == true {
             mealBtn.setTitleColor(#colorLiteral(red: 0.02356945537, green: 0.7047216296, blue: 0.5695679188, alpha: 1), for: .normal)
         }
         else {
             mealBtn.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: walkMealCVCell.identifier, for: indexPath) as? walkMealCVCell else {
            return UICollectionViewCell() }
        
        cell.tabBar = tabPage[indexPath.row]
        
        return cell
    }
}

extension tabBarVC: UICollectionViewDelegateFlowLayout{
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width-50, height: collectionView.frame.height)
        
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
