//
//  pushViewController.swift
//  KaAPIproj
//
//  Created by 이윤식 on 2022/03/08.
//

import UIKit
import KakaoSDKUser
class pushViewController: UIViewController {
    
    var nic:String?
    var ema:String?
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nickname.text = nic
        email.text = ema
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        // ✅ 연결 끊기 : 연결이 끊어지면 기존의 토큰은 더 이상 사용할 수 없으므로, 연결 끊기 API 요청 성공 시 로그아웃 처리가 함께 이뤄져 토큰이 삭제됩니다.
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
                
                // ✅ 연결끊기 시 메인으로 보냄
                //                      self.navigationController?.popViewController(animated: true)
            }
            
            
        }
    }
}
