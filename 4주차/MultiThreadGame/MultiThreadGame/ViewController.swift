//
//  ViewController.swift
//  MultiThreadGame
//
//  Created by 김수정 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {
    
    // 초기 버튼 스타일
    let firstImage : UIImage = #imageLiteral(resourceName: "클로버")
    
    // 나올재료 뒤 배경
    @IBOutlet weak var backgroundUIView: UIView!
    
    // 만든 초코
    var makeChocoCount = 0
    @IBOutlet weak var makeChocoLabel: UILabel!
    
    // 필요한 초코
    let needChocoStageArr = [40,50,60]
    @IBOutlet weak var needChocoLabel: UILabel!
    
    // 시작 타이머
    var startTimer: Timer!
    var number = 120
    @IBOutlet weak var startTimerBtn: UIButton!
    @IBOutlet weak var startTimerLabel: UILabel!
    
    // 스테이지
    let stageArr = ["Stage 1","Stage 2","Stage 3"]
    @IBOutlet weak var stageCountLabel: UILabel!
    
    // 재료
    var ingredientBtnCount = -1
    var ingredientArr : [UIImage] = [#imageLiteral(resourceName: "초코클로버"),#imageLiteral(resourceName: "딸기클로버"),#imageLiteral(resourceName: "막대클로버완성")]
    @IBOutlet weak var ingredientBtn: UIButton!
    @IBOutlet weak var ingredientImageView: UIImageView!
    
    // 냉동 타이머
    @IBOutlet weak var iceTimerLabel: UILabel!
    @IBOutlet weak var iceTimerBtn: UIButton!
    
    // 냉동 커버
    @IBOutlet weak var iceCoverImageView: UIImageView!
    
    // 틀
    @IBOutlet var frameBtnArr: [UIButton]!
    let rules : [UIImage:UIImage] = [#imageLiteral(resourceName: "클로버"):#imageLiteral(resourceName: "초코클로버"),#imageLiteral(resourceName: "초코클로버"):#imageLiteral(resourceName: "딸기클로버"),#imageLiteral(resourceName: "딸기클로버"):#imageLiteral(resourceName: "막대클로버완성")]
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeChocoLabel.text = String(makeChocoCount)
        needChocoLabel.text = String(needChocoStageArr[0])
        startTimerLabel.text = String(number) + "초"
        stageCountLabel.text = stageArr[0]
        setEnableBtn()
        
        // 버튼 초기 스타일
        btnStyle()
    }
    
    // 버튼 초기 스타일
    func btnStyle() {
        frameBtnArr.forEach { btn in
            btn.setBackgroundImage(firstImage, for: .normal)
        }
    }
    
    func setEnableBtn() {
        frameBtnArr[0].isEnabled = false
        frameBtnArr[1].isEnabled = false
        frameBtnArr[2].isEnabled = false
        frameBtnArr[3].isEnabled = false
        frameBtnArr[4].isEnabled = false
        frameBtnArr[5].isEnabled = false
        frameBtnArr[6].isEnabled = false
        frameBtnArr[7].isEnabled = false
        frameBtnArr[8].isEnabled = false
        frameBtnArr[9].isEnabled = false
    }

    // 타이머 초기화
    func endTimer() {
        if let timer = startTimer {
            if(timer.isValid){
                timer.invalidate()
            }
        }
        number = 120
        startTimerLabel.text = String(number) + "초"
    }
    
    // 스테이지1
    func firstStage() {
        needChocoLabel.text = String(needChocoStageArr[1])
        makeChocoCount = 0
        makeChocoLabel.text = String(makeChocoCount)
        stageCountLabel.text = stageArr[1]
        setEnableBtn()
        print("스테이지1 깨셨네요!! 축하드려요!!")
    }
    
    // 스테이지2
    func secondStage() {
        needChocoLabel.text = String(needChocoStageArr[2])
        makeChocoCount = 0
        makeChocoLabel.text = String(makeChocoCount)
        stageCountLabel.text = stageArr[2]
        setEnableBtn()
        print("스테이지2 깨셨네요!! 축하드려요!!")
        
    }
    
    // 스테이지3
    func thirdStage() {
        needChocoLabel.text = String(needChocoStageArr[0])
        makeChocoCount = 0
        makeChocoLabel.text = String(makeChocoCount)
        stageCountLabel.text = stageArr[0]
        setEnableBtn()
        print("👍🏻모든 스테이지를 클리어하셨습니다!! 축하드려요!!")
    }
    
    // 종료 셋팅
    func endStage() {
        needChocoLabel.text = String(needChocoStageArr[0])
        makeChocoCount = 0
        makeChocoLabel.text = String(makeChocoCount)
        stageCountLabel.text = stageArr[0]
        setEnableBtn()
        print("아쉽네요ㅜㅜ")
    }
    
    // 토스트 메시지
    func showToast(message : String) {
        let width_variable:CGFloat = 10
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-100, width: view.frame.size.width-2*width_variable, height: 35))
        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    // 시작 타이머 버튼
    @IBAction func didTapStartTimerBtn(_ sender: UIButton) {
        frameBtnArr[0].isEnabled = true
        frameBtnArr[1].isEnabled = true
        frameBtnArr[2].isEnabled = true
        frameBtnArr[3].isEnabled = true
        frameBtnArr[4].isEnabled = true
        frameBtnArr[5].isEnabled = true
        frameBtnArr[6].isEnabled = true
        frameBtnArr[7].isEnabled = true
        frameBtnArr[8].isEnabled = true
        frameBtnArr[9].isEnabled = true
        
        DispatchQueue.global().async { [self] in
            let isRunning = true
            let runLoop = RunLoop.current
            
            startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            
            while isRunning {
                runLoop.run(until: Date().addingTimeInterval(0.1))
            }
        }
    }
    
    @objc func timerCallback(){
        DispatchQueue.main.async { [self] in
            if number > 0 {
                number -= 1
                startTimerLabel.text = String(number) + "초"
                
                if number == 0 {
                    
                    if stageCountLabel.text == stageArr[0] && makeChocoCount >= needChocoStageArr[0] {
                        showToast(message: "Stage2 시작!! 시작버튼을 눌러주세요" )
                        print("스테이지2로 가자~~~~")
                        firstStage()

                    }
                    else if stageCountLabel.text == stageArr[1] && makeChocoCount >= needChocoStageArr[1] {
                        showToast(message: "Stage3 시작!! 시작버튼을 눌러주세요" )
                        print("스테이지3로 가자~~~~")
                        secondStage()

                    }
                    else if stageCountLabel.text == stageArr[2] && makeChocoCount >= needChocoStageArr[2] {
                        showToast(message: "모든 스테이지를 클리어 하셨습니다❤️" )
                        print("성공!!!")
                        thirdStage()
                        
                    }
                    else {
                        endStage()
                        showToast(message: "실패! 재도전하고싶다면? 시작버튼을 눌러주세요!" )
                        print("아쉽네요!! 게임 종료!!")
                    }
                    endTimer()
                }
                
            }
        }
    }
    
    // 냉동 타이머 버튼
    @IBAction func didTapIceTimerBtn(_ sender: UIButton) {
        // 아이스 커버 나옴
        iceCoverImageView.isHidden = false
        DispatchQueue.global().async {
            // 5초 동작
            for i in 1...5 {
                DispatchQueue.main.async {
                    self.iceTimerLabel.text = String(i)
                    print("5초동안 냉동되는 타이머 : ",i)
                }
                usleep(1000000) // 1초씩
            }
            DispatchQueue.main.sync {
                self.iceCoverImageView.isHidden = true // 5초 후 아이스 커버 숨김
            }
            usleep(1000000) // 아이스 커버 벗겨지고 굳은거 확인하기위해 1초 딜레이
            DispatchQueue.main.sync {
                for i in self.frameBtnArr {
                    if i.backgroundImage(for: .normal) == self.ingredientArr[2] {
                        self.makeChocoCount += 1
                        self.makeChocoLabel.text = String(self.makeChocoCount)
                        self.iceTimerLabel.text = String(0)
                    }
                    else {
                        self.iceTimerLabel.text = String(0)
                    }
                }
                self.btnStyle()
            }
        }
    }
    
    // 재료 버튼
    //var changeIngredient :UIImage = #imageLiteral(resourceName: "초코짤주") // 짤주일때
    var changeIngredient :UIImage = #imageLiteral(resourceName: "초코클로버")
    @IBAction func didTapIngredientBtn(_ sender: UIButton) {
        // 0,1,2 출력
        ingredientBtnCount += 1
        if ingredientBtnCount == 3 {
            ingredientBtnCount = 0
        }
        
        changeIngredient = ingredientArr[ingredientBtnCount]
        ingredientImageView.image = changeIngredient
        //ingredientBtn.setBackgroundImage(changeIngredient, for: .normal)
    }
    
    // 틀
    @IBAction func btn1(_ sender: Any) {
        frameImage(frameBtnArr[0])
    }
    @IBAction func btn2(_ sender: Any) {
        frameImage(frameBtnArr[1])
    }
    @IBAction func btn3(_ sender: Any) {
        frameImage(frameBtnArr[2])
    }
    @IBAction func btn4(_ sender: Any) {
        frameImage(frameBtnArr[3])
    }
    @IBAction func btn5(_ sender: Any) {
        frameImage(frameBtnArr[4])
    }
    @IBAction func btn6(_ sender: Any) {
        frameImage(frameBtnArr[5])
    }
    @IBAction func btn7(_ sender: Any) {
        frameImage(frameBtnArr[6])
    }
    @IBAction func btn8(_ sender: Any) {
        frameImage(frameBtnArr[7])
    }
    @IBAction func btn9(_ sender: Any) {
        frameImage(frameBtnArr[8])
    }
    @IBAction func btn10(_ sender: Any) {
        frameImage(frameBtnArr[9])
    }
    
    func frameImage(_ sub:UIButton) {
        if let futureImage = rules[sub.backgroundImage(for: .normal)!] {
            if futureImage == changeIngredient {
                sub.setBackgroundImage(changeIngredient, for: .normal)
            }
        }
    }
    
}


