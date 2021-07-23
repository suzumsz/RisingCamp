//
//  WeatherService.swift
//  PetWalk
//
//  Created by 김수정 on 2021/07/21.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherService {
    
    static let shared = WeatherService()
    
    // .plist에서 API Key 가져오기
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
    
    func getWeatherData(cityName: String,completion: @escaping (Result<WeatherResponse, NetworkError>) -> Void) {
        // 1. 전송할 값 준비
        let apiURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric"
        
        AF.request(apiURL, method: .get, encoding: URLEncoding.httpBody).responseJSON() { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    return completion(.failure(.noData))
                }
                
                // Data 타입으로 받은 리턴을 디코드
                let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                
                // 성공
                if let weatherResponse = weatherResponse {
                    print(weatherResponse)
                    completion(.success(weatherResponse)) // 성공한 데이터 저장
                } else {
                    completion(.failure(.decodingError))
                }
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
