//
//  HomeVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit
import SideMenu
import KakaoSDKUser

private var apiKey: String {
    get {
        // 생성한 .plist 파일 경로 불러오기
        guard let filePath = Bundle.main.path(forResource: "KeyList", ofType: "plist") else {
            fatalError("Couldn't find file 'KeyList.plist'.")
        }
        
        // .plist를 딕셔너리로 받아오기
        let plist = NSDictionary(contentsOfFile: filePath)
        
        // 딕셔너리에서 값 찾기
        guard let value = plist?.object(forKey: "OPENWEATHERMAP_KEY") as? String else {
            fatalError("Couldn't find key 'OPENWEATHERMAP_KEY' in 'KeyList.plist'.")
        }
        return value
    }
}

class HomeVC: UIViewController {
    // clear일때 rain일때 wind일때 cloud일때
    var weatherClear = ["산책하기 좋은 날이에요!!","산책시, 우비를 입혀주세요!!","바람이 부니 주의해주세요!!", "산책시, 비가 올 수도 있어요!!" ]
    
    @IBOutlet weak var dogBreedToWalkLabel: UILabel!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var clearWeather: UILabel!
    @IBOutlet weak var currentLacationLabel: UILabel!
    @IBOutlet weak var weatherToWalkLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var circleUIView1: UIView!
    @IBOutlet weak var circleUIView2: UIView!
    @IBOutlet weak var circleUIView3: UIView!
    
    var weather: Weather?
    var main: Main?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userMainData.shared.loginUser! + String("님!")
        
        dogNameLabel.text = userMainData.shared.dogName
        
        dogBreedToWalkLabel.text = "30분"
        
        
        
        
        circleUIView1.layer.cornerRadius = circleUIView1.frame.height/2
        circleUIView2.layer.cornerRadius = circleUIView2.frame.height/2
        circleUIView3.layer.cornerRadius = circleUIView3.frame.height/2
        
        
    }
    
    // 뷰가 나타날 것이다.
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("DEBUG VC1 >> \(#function) ")
            
            // data fetch
            WeatherService().getWeather { result in
                switch result {
                case .success(let weatherResponse):
                    DispatchQueue.main.async {
                        self.weather = weatherResponse.weather.first
                        self.main = weatherResponse.main
                        self.name = weatherResponse.name
                        self.setWeatherUI()
                        self.setKoreanWeather()
                        self.locationCity()
                    }
                case .failure(_ ):
                    print("error")
                }
            }
 
        }
    
    
    
    
    
    @IBAction func didTapSideMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                //사이드메뉴 뷰컨트롤러 객체 생성
                let sideMenuViewController: sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "sideMenuViewController") as! sideMenuViewController
                
                //커스텀 네비게이션이랑 사이드메뉴 뷰컨트롤러 연결
                let menu = CustomSideMenuNavigation(rootViewController: sideMenuViewController)
                
                //보여주기
                present(menu, animated: true, completion: nil)
    }
    
    func setKoreanWeather() {
        if weather!.main == "Clear" {
            clearWeather.text = "맑음"
            weatherToWalkLabel.text = weatherClear[0]
        }
        else if weather!.main == "Rain" {
            clearWeather.text = "비"
            weatherToWalkLabel.text = weatherClear[1]
        }
        else if weather!.main == "Clouds" {
            clearWeather.text = "구름"
            weatherToWalkLabel.text = weatherClear[3]
        }
        else if weather!.main == "Wind" {
            clearWeather.text = "바람"
            weatherToWalkLabel.text = weatherClear[2]
        }
    }
    
    func locationCity() {
        if name == "Incheon" {
            currentLacationLabel.text = "인천"
        }
    }
    
    
    private func setWeatherUI() {
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            weatherImageView.image = UIImage(data: data)
        }
        currentLacationLabel.text = "\(name ?? "00")"
        clearWeather.text = "\(weather!.main)"
        currentTempLabel.text = "\(main!.temp)"
        maxTempLabel.text = "\(main!.temp_max)"
        minTempLabel.text = "\(main!.temp_min)"
    }
    
    
    @IBAction func logoutdidTap(_ sender: Any) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                
                
                // 현재 위치에서 ViewController가 있는 곳으로 이동하고 그 사이의 VC는 stack에서 사라지게 됨
                let controllers = self.navigationController?.viewControllers
                for vc in controllers! {
                    if vc is ViewController {
                        _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
                    }
                }
                print("로그아웃버튼누름")
            }
        }
    }
    
    
}
