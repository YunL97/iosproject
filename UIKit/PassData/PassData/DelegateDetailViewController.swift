//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by 이윤식 on 2021/12/17.
//

import UIKit

protocol DelegateDetailViewControllerDelegate:AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {

    //viewcontroller에서 DelegateDetailViewControllerDelegate 프로토콜에 정의된것만 self 로 보낸다
    weak var delegate: DelegateDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func passDataToMainVC(_ sender: Any) {
    
        //delegate가 없는동안에는 nil이기 때문에 실행이 안댐
        delegate?.passString(string: "delegate pass Data")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
