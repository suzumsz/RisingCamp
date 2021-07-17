//
//  SecondVC.swift
//  AnimalDiary
//
//  Created by 김수정 on 2021/07/05.
//

import UIKit

// MARK: - 구조체
struct exampleModel {
    var dateString: String
    var title: String
    var location: String
    var image: UIImage
    var content: String
}

class SecondVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    // 데이터를 받아올 배열
    var dataArr = [exampleModel]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView의 DataSource & Delegate
        setDelegate()
        
        // tableView Style
        setTableViewStyle()
    }
    
    // 뷰가 나타날 것이다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 테이블뷰를 섹션으로 리로드
        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    // MARK: - IBAction
    
    // '+' 버튼
    @IBAction func didPressBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ThirdVC") as! ThirdVC
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Function
    
    // 삭제 알림창
    func deleteAlert(indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "삭제하시겠습니까?", preferredStyle: .alert)
        
        // 확인 action
        let yesAction = UIAlertAction(title: "확인", style: .default) { _ in
            // replace data variable with your own data array
            self.dataArr.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        alert.addAction(yesAction)
        
        // 취소 action
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // Delegate & DataSource
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // TableView style
    func setTableViewStyle() {
        // tableview의 기본 선 제거
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
}

// MARK: - UITableDataSource & ThirdVCDelegate
extension SecondVC : UITableViewDataSource, ThirdVCDelegate {
    
    func thirdVCPassDataToSecondVC(dateLabel: String?, titleText: String?, locationText: String?, imageView image: UIImage?, contentText: String?, index: Int?) {
        print("인덱스테스트",index ?? -99)
        
        if let temp : Int = index {
            dataArr[temp] = exampleModel(dateString: dateLabel!, title: titleText!, location: locationText!, image: image!, content: contentText!)
            print("요기에값이있을까욧?", temp)
        }
        else {
            dataArr.append(exampleModel(dateString: dateLabel!, title: titleText!,location: locationText!, image:image!, content: contentText!))
            print("값이 없다면?")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView?.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier, for: indexPath) as? DiaryTableViewCell else { return UITableViewCell()
        }
        
        cell.dateLabel.text = dataArr[indexPath.row].dateString
        cell.titleLabel.text = dataArr[indexPath.row].title
        cell.locationLabel.text = dataArr[indexPath.row].location
        cell.diaryImageView.image = dataArr[indexPath.row].image
        
        return cell
    }
    
    // tableView Swipe Gesture
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteAlert(indexPath: indexPath)
        }
    }
    
    // tableView 삭제 코멘트 'Delete'에서 '삭제'로 변경
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
}

// MARK: - UITableView Delegate
extension SecondVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        // 해당 셀을 누르면 'thirdVC' 호출
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "ThirdVC") as? ThirdVC else { return }
        
        // 해당 셀의 값을 textView에 넣어줌
        dvc.locationLocation = dataArr[indexPath.row].location
        dvc.titleTitle = dataArr[indexPath.row].title
        dvc.imageImage = dataArr[indexPath.row].image
        dvc.contentContent = dataArr[indexPath.row].content
        
        // idx에 현재 셀 인덱스를 넣어줌
        dvc.idx = indexPath.row
        print(indexPath.row)
        
        dvc.delegate = self
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
        
    }
}
