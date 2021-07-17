//
//  ViewController.swift
//  MemoApp
//
//  Created by 김수정 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    var colorArray : [UIColor] = [.systemPink,.systemBlue,.systemYellow]
    
    // MARK: - IBOutlet
    @IBOutlet weak var memoTableView: UITableView!
    @IBOutlet weak var memoEditBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 셋팅값
        setDelegate()
        setTableViewStyle()
    }
    
    // 뷰가 나타날 것이다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG VC1 >> \(#function) ")
        
        // 카운트 된 colorArray와 colorIndex의 값을 나눈 나머지 [0,1,2]로 colorArray의 색상값을 차례대로 보여줌
        memoEditBtn.tintColor = colorArray[MainData.shared.colorIndex % colorArray.count]
        
        // 테이블뷰를 섹션으로 리로드
        self.memoTableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    // 뷰가 나타났다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DEBUG VC1 >> \(#function) ")
        
        // 저장을 알려주는 alert창
        // 저장 버튼은 true, 뒤로가기 버튼은 false
        // true일 때만! 알림창이 뜨도록!
        if MainData.shared.saveDidComplete == true {
            saveAlert()
        }
    }
    
    // 뷰가 사라질 것이다.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("DEBUG VC1 >> \(#function) ")
        
        // '+'버튼을 눌러 해당 뷰가 사라질 때마다 카운트
        MainData.shared.colorIndex += 1
    }
    
    // 뷰가 사라졌다.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DEBUG VC1 >> \(#function) ")
    }
    
    // MARK: - IBAction
    // '+'버튼 액션
    @IBAction func memoEditBtn(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "EditViewController") else { return }
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
    // MARK: - Delegate & DataSource
    func setDelegate() {
        memoTableView.delegate = self
        memoTableView.dataSource = self
    }
    
    // MARK: - TableViewStyle
    func setTableViewStyle() {
        // tableview의 기본 선 제거
        memoTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // MARK: - Alert
    // 저장 알림창
    func saveAlert() {
        let alert = UIAlertController(title: "저장되었습니다.", message: "", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) {
            
            // 저장 버튼을 누른 후, 알림창이 뜨면서 false로 값을 다시 변경해 줌
            (action) in MainData.shared.saveDidComplete = false
            print(MainData.shared.saveDidComplete)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // 삭제 알림창
    func deleteAlert(indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "삭제하시겠습니까?", preferredStyle: .alert)
        
        // 확인 action
        let yesAction = UIAlertAction(title: "확인", style: .default) { _ in
            // replace data variable with your own data array
            MainData.shared.memoArray.remove(at: indexPath.row)
            self.memoTableView.deleteRows(at: [indexPath], with: .fade)
        }
        alert.addAction(yesAction)
        
        // 취소 action
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableView DataSource
extension ViewController: UITableViewDataSource {
    
    // 섹션 안에 있는 row행의 갯수를 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainData.shared
            .memoArray.count
    }
    
    // tableView의 특정 위치에 삽입할 셀의 데이터 소스를 요청하는 역할
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.memoTableView?.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        // cell의 memoContentLabel에 content의 indexPath.row 번째 값을 넣어줌
        cell.memoContentLabel?.text = MainData.shared.memoArray[indexPath.row].content
        cell.nowDateLabel.text = MainData.shared.memoArray[indexPath.row].date
        
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
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        // 해당 셀을 누르면 'EditViewController' 호출
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "EditViewController") as? EditViewController else { return }
        
        // 해당 셀의 값을 textView에 넣어줌
        dvc.memoText = MainData.shared.memoArray[indexPath.row].content
        
        // idx에 현재 셀 인덱스를 넣어줌
        dvc.idx = indexPath.row
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
        
    }
}
