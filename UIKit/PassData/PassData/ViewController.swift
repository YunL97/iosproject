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
//4. delegate pattern, 대리, 위임
//5. closure
//6. notification:등록된 모든 observer에게 정보를 전달 연결점이 없어도 사용가능 전혀 상관없는 클래스나 함수 호출 할때도 사용가능


import UIKit

class ViewController: UIViewController /*,DelegateDetailViewControllerDelegate*/ {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let notificationName = Notification.Name("sendSomeString")
        
        //notificationName이 호출이 되면 showSomeString이 실행되도록 구조가 잡힘
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
        
    }
    @objc func showSomeString(notification: Notification){
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
    
    }

    @objc func keyboardWillShow(){
        print("will show")
    }
    @objc func keyboardDidShow(){
        print("Did show")
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    //1. intance property
    @IBAction func moveRoDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        detailVC.someString = "aaa String"
//        detailVC.someLabel.text = "vv" //오류
    
        self.present(detailVC, animated: false, completion: nil) //메모리에 올리기
        detailVC.someLabel.text = "vv"//근데 이것보다는 DetailViewController에 변수를 하나 만들어서 거기에 할당하는게 나음
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

    //3. instance:  자기 자신을 다보내버림
    @IBAction func MoveToIntance(_ sender: Any) {
        let detailVC = IntanceDetailViewController(nibName: "IntanceDetailViewController", bundle: nil)//xib를 쓰는 컨트롤러를 가져올 때 사용
        
        //detailVC.mainVC 타입 = ViewController
        detailVC.mainVC = self //나자신(ViewController)을 넘겨주는것 so 나자신에 대한것 모두 접근 가능, 사용가능
        
        self.present(detailVC , animated: true, completion: nil)//화면이동
    }
    
    //4. delegate pattern, 대리, 위임
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        //ViewController가 DelegateDetailViewControllerDelegate를 준수 하기 때문에 오류가 없어짐
        //DelegateDetailViewControllerDelegate 프로토콜에 있는 passString만 접근 가능
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
        
    }
    
    //5. closure
    @IBAction func moveToClosure(_ sender: Any) {
        //detailVC안에 closureDetailViewController 가 들어있다 생각
        let detailVC = closureDetailViewController(nibName: "closureDetailViewController", bundle: nil)
        
        //detailVC 안에있는 closurePassData 클릭하면
        
        //구현부
        //moveToClosure버튼을  처음 누르면 myClosure가 nil이기 때문에 실행 x
        detailVC.myClosure = { str in
            self.dataLabel.text = str
            print("ac")
            print(str + "a")
        }
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func movetoNoti(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
    
    
}

