//
//  timerVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/21.
//

import UIKit

class timerVC: UIViewController {

    var timer : Timer?
    var number = 0
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapCompleteBtn(_ sender: UIButton) {
        // 싱글톤에 타임 값 넣어주기 -> 테이블뷰에 뿌릴거
        userMainData.shared.walkTimer = timeLabel.text
        print("테이블뷰에 넘겨주세요 : ",userMainData.shared.walkTimer )
    }
    
    @IBAction func timerReset(_ sender: UIButton) {
        number = 0
        self.updateTimeLabel(time: TimeInterval(self.number))
    }
    
    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            self.playBtn.isSelected = true
        }else{
            self.playBtn.isSelected = false
        }
        
        if sender.isSelected{
            self.makeTimer()
        }else{
            self.stopTimer()
        }
    }
        
    // Label 업데이트
    func updateTimeLabel(time:TimeInterval) {
        let minute: Int = Int(time/60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        
        let timeText: String = String(format: "%02ld:%02ld", minute, second)
        self.timeLabel.text = timeText
    }
    
    // 타이머 수행
    func makeTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        self.timer!.fire()
    }
    
    @objc func timerCallback(){
        self.updateTimeLabel(time: TimeInterval(self.number))
        number += 1
            
    }
    
    // 타이머 해제
    func stopTimer() {
        self.timer!.invalidate()
        self.timer = nil
    }
    
    
}
