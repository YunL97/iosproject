//
//  ViewController.swift
//  PassData
//
//  Created by 이윤식 on 2021/12/16.
//

//Passing Data  (데이터를 넘겨주는 방법)
//6가지

//1. intance property
//2. 세그웨이
//3. instance

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var dataLabel: UILabel!
    
    //1. intance property
    @IBAction func moveRoDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        detailVC.someString = "aaa String"
//        detailVC.someLabel.text = "vv" //오류
        
        
        self.present(detailVC, animated: false, completion: nil) //메모리에 올리기
        
        detailVC.someLabel.text = "vv"
    }
    
    //2. 세그웨이
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" { //컨트롤러 연결줄
            if let detailVC = segue.destination as? SegueDetailViewController {
                //segue.destination 이 SegueDetailViewController로 타입캐스팅이 되느냐
//                detailVC.dataLabel.text = "abcd"////화면 나올준비가 되지않은상태에서 보냈기때문에 오류가난다
                detailVC.dataString = "abcd"
                
            }
        }
    }

    //3. instance
    @IBAction func MoveToIntance(_ sender: Any) {
        let detailVC = IntanceDetailViewController(nibName: "IntanceDetailViewController", bundle: nil)//xib를 쓰는 컨트롤러를 가져올 때 사용
        
        detailVC.mainVC = self //나자신(ViewController)을 넘겨주는것
        self.present(detailVC , animated: true, completion: nil)//화면이동
    }
}

