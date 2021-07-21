//
//  HomeVC.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/20.
//

import UIKit
import SideMenu

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
    
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var weather: Weather?
    var main: Main?
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data fetch
               WeatherService().getWeather { result in
                   switch result {
                   case .success(let weatherResponse):
                       DispatchQueue.main.async {
                           self.weather = weatherResponse.weather.first
                           self.main = weatherResponse.main
                           self.name = weatherResponse.name
                           self.setWeatherUI()
                       }
                   case .failure(_ ):
                       print("error")
                   }
               }
           }
    
    
  
    
    
    
    
    @IBAction func didTapSideMenu(_ sender: Any) {
       
    }
    
    
    private func setWeatherUI() {
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            weatherImageView.image = UIImage(data: data)
        }
        currentTempLabel.text = "\(main!.temp)"
        maxTempLabel.text = "\(main!.temp_max)"
        minTempLabel.text = "\(main!.temp_min)"
    }




}
