//
//  DetailViewController.swift
//  PassData
//
//  Created by 이윤식 on 2021/12/16.
//

import UIKit

class DetailViewController: UIViewController {

    var someString = ""
    
    @IBOutlet weak var someLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = someString
        // Do any additional setup after loading the view.
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
