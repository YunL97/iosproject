//
//  ViewController.swift
//  QueueExample
//
//  Created by 이윤식 on 2021/12/17.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var finishLabel: UILabel!
    
    //dispatch queue
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }
    @IBAction func action1(_ sender: Any) {
        
        simpleClosure (completion: {
            self.finishLabel.text = "끝"
            print("a")
           
        })
    }
    
        //이 클로저를 실행함으로서 외부에 영향을 미치기 때문에 excaping을 해줘야한다
    func simpleClosure(completion:@escaping () -> Void){//클로저가 들어있는 함수
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.3)
                print(index)
            }
            
        }
        //main.sync 안쓰는 이유: main.sync를 호출하면 끊임없이 앱의 이벤트를 처리하고 있던 main thread가 sync(동기) 호출에 의해 멈추게 되고 deadlock가 발생한다
        //compleation()을 main에서 실행해야하는이유: view를 그리는것(uikit)을 고치는거기 때문이다. uikit 클래스를 다룰때 무조건 mainThread에서 실행해야한다
        DispatchQueue.main.async {
            completion()
        }
    }

    @IBAction func action2(_ sender: Any) {
        
        let dispatchGroup = DispatchGroup()
        let queue1 = DispatchQueue(label: "q1")
        
        queue1.async(group: dispatchGroup){
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.3)
                print(index)
        }
        
    }
    }
}

