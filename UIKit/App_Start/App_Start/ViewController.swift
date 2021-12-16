//
//  ViewController.swift
//  App_Start
//
//  Created by 이윤식 on 2021/12/15.
//

import UIKit
//실행  command - r
class ViewController: UIViewController {
   
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBAction func doSomething(_ sender: Any) {
        testButton.backgroundColor = .orange
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let detailVC = storyboard.instantiateViewController(identifier: "DetailVC") as DetailVC //DetailVC라는 타입으로 바꾼다
        
        self.present(detailVC, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testButton.backgroundColor = UIColor.red
        
    }


}


class DetailVC: UIViewController {
    //화면 life cycle
    
    //화면올릴 준비가 됐을때
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    //화면 나오기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //화면 나온후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
 
}
