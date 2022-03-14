//
//  ViewController.swift
//  httpStudy
//
//  Created by 이윤식 on 2022/03/14.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var progressLabel: UILabel!
    
    @IBAction func down(_ sender: Any) {
        downTest()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        getTest()
//        postTest()
        progressView.progress = 0
        
    }

    func getTest() {
            let url = "https://jsonplaceholder.typicode.com/todos/1"
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["Content-Type":"application/json", "Accept":"application/json"])
                .validate(statusCode: 200..<300)
                .responseJSON { (json) in
                    //여기서 가져온 데이터를 자유롭게 활용하세요.
                    print(json)
            }
        }
    
    func postTest() {
            let url = "https://ptsv2.com/t/519io-1647229631/post"
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.timeoutInterval = 10
            
            // POST 로 보낼 정보
            let params = ["id":"아이디", "pw":"패스워드"] as Dictionary

            // httpBody 에 parameters 추가
            do {
                try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                print("http Body Error")
            }
            
            AF.request(request).responseString { (response) in
                switch response.result {
                case .success:
                    print("POST 성공")
                case .failure(let error):
                    print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
                }
            }
        }
    func downTest() {
            // 방금 테스트사이트에서 복사한 다운로드 주소
            let url = "http://212.183.159.230/5MB.zip"
    
            // 파일매니저
            let fileManager = FileManager.default
            // 앱 경로
            let appURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            // 파일이름 url 의 맨 뒤 컴포넌트로 지정 (50MB.zip)
            let fileName : String = URL(string: url)!.lastPathComponent
            // 파일 경로 생성
            let fileURL = appURL.appendingPathComponent(fileName)
            // 파일 경로 지정 및 다운로드 옵션 설정 ( 이전 파일 삭제 , 디렉토리 생성 )
            let destination: DownloadRequest.Destination = { _, _ in
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            }
            // 다운로드 시작
            AF.download(url, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination).downloadProgress { (progress) in
                // 이 부분에서 프로그레스 수정
                self.progressView.progress = Float(progress.fractionCompleted)
                self.progressLabel.text = "\(Int(progress.fractionCompleted * 100))%"
            }.response{ response in
                    if response.error != nil {
                        print("파일다운로드 실패")
                    }else{
                        print("파일다운로드 완료")
                    }
            }
        }
}

