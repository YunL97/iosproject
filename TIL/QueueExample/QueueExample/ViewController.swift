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
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3", qos: DispatchQoS.default)

        queue1.async(group: dispatchGroup, qos: DispatchQoS.background){
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.3)
                    print(index)
            }
                dispatchGroup.leave()
            }
        
    }
        
        queue2.async(group: dispatchGroup, qos: DispatchQoS.userInteractive){
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 10..<20 {
                    Thread.sleep(forTimeInterval: 0.3)
                    print(index)
            }
                dispatchGroup.leave()
            }
    }
        queue3.async(group: dispatchGroup){
            dispatchGroup.enter()//작업시작
            DispatchQueue.global().async {
                for index in 20..<30 {
                    Thread.sleep(forTimeInterval: 0.3)
                    print(index)
            }
                dispatchGroup.leave()//작업끝 이거 쓰지않으면
                //끝난줄 모르기 때문에 dispatchGroup.notify(queue: DispatchQueue.main) 이 실행되지 않는다
            }
            }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("끝")
        }
    }
    
    @IBAction func action3(_ sender: Any) {
        
        
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        queue1.async{
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.3)
                    print(index)
            
            }
            
            //deadlock: 상대 작업이 끝날때 까지 서로 계속 기다리는 상태
            //sync: 실행전까진 무한정 기다린다
//            queue1.sync{
//                    for index in 0..<10 {
//                        Thread.sleep(forTimeInterval: 0.3)
//                        print(index)
                
                }
    }
       
    }



