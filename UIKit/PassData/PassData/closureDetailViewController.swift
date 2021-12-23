//
//  closureDetailViewController.swift
//  PassData
//
//  Created by 이윤식 on 2021/12/17.
//

import UIKit

class closureDetailViewController: UIViewController {

    var myClosure: ((String) -> Void)?
    
//    var sum: () -> Void = {print("aa")}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    func someFunc() {
        
    }
    
    @IBAction func closurePassData(_ sender: Any) {
        
    myClosure?("closure String")
    self.dismiss(animated: true, completion: nil)
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
