//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by 이윤식 on 2022/01/05.
//

import UIKit
import CoreData


//weak로 선언할려면 AnyObject를 사용해야함
protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}



class TodoDetailViewController: UIViewController {
    
    //이 변수가 다른데 연결되어서 호출하면 프로토콜 함수 실행
    weak var delegate: TodoDetailViewControllerDelegate?

    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var lowButton: UIButton!
    
    @IBOutlet weak var normalButton: UIButton!
    
    @IBOutlet weak var highButton: UIButton!
    
    var selectedTodoList: TodoList?
    
    var priority:PriorityLevel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let hasdata = selectedTodoList {
            titleTextField.text = hasdata.title
            print(hasdata.prioirtyLevel)
            priority = PriorityLevel(rawValue: hasdata.prioirtyLevel)
        }
        
    }
    

    //view에있는 레이아웃 고치기
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = lowButton.bounds.height / 2
        highButton.layer.cornerRadius = lowButton.bounds.height / 2
    }
    
    
    //low, normal, high중에 선택한거 담기
    @IBAction func setPriorty(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
            
        default:
            break
        }
        makePriorityButtonDesign()
        
    }
    
    //디자인 변경
    func makePriorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch self.priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
        case .level2:
            normalButton.backgroundColor = priority?.color
        case .level3:
            highButton.backgroundColor = priority?.color

        default:
            break
        }
        

    }
    
    //데이터 저장
    @IBAction func saveTodo(_ sender: Any) {
     
        //NSManagedObjectContext
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
            // todoList 테이블에 있는 스칼라 가져오기
            //NSentityDesciption
        guard    let entityDesciption = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else {
            return
        }
        
        //그 모델 그대로 가져옴
        guard let object = NSManagedObject(entity: entityDesciption, insertInto: context) as? TodoList else{
            return
        }
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        
        //색저장
        object.prioirtyLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        
        //세이브는 uiapplicationdelegate 에서 가능
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate )
        
        //테이블에 데이터 저장
        appDelegate.saveContext()
        
        //함수가 끝날 때 프로토콜함수까지 호출하게 만듬
        delegate?.didFinishSaveData()
        
        
        //화면내린다고해서 테이블뷰가 자동으로 갱신되지 않음 그래서 프로토콜로 지정해줘야함
        self.dismiss(animated: true, completion: nil)
    }
    

}
