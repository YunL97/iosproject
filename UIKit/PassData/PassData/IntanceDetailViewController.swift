//
//  IntanceDetailViewController.swift
//  PassData
//
//  Created by 이윤식 on 2021/12/16.
//

import UIKit

class IntanceDetailViewController: UIViewController {

    
    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMAinVc(_ sender: Any) {
        mainVC?.dataLabel.text = "some data"
        self.dismiss(animated: true, completion: nil)
        //IntanceDetailViewController을 버리다. 전꺼로 돌아가다
    }
    
    /*
    // MARK: - Navigation

    // In a  storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
