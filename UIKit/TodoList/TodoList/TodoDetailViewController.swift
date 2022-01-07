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
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    var selectedTodoList: TodoList?
    
    var priority:PriorityLevel?
    
    //NSManagedObjectContext
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //업데이트 일때 (selectedTodoList에 데이터가 있을 떄)
        if let hasdata = selectedTodoList {
            titleTextField.text = hasdata.title
            print(hasdata.title!)
            
            //셋팅
            priority = PriorityLevel(rawValue: hasdata.prioirtyLevel)
            makePriorityButtonDesign()
            
            deleteButton.isHidden = false
            saveButton.setTitle("Update", for: .normal)
            
            
        }
        //새로 만들기 일떄
        else {
            deleteButton.isHidden = true
            saveButton.setTitle("Save", for: .normal)
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
        if selectedTodoList != nil{
            updateTodo()
        }else {
            saveTodo()
        }
        
                //함수가 끝날 때 프로토콜함수까지 호출하게 만듬, viewcontroller 에서 didfinishData함수가 정의 되어 있음
                delegate?.didFinishSaveData()
        
        
                //화면내린다고해서 테이블뷰가 자동으로 갱신되지 않음 그래서 프로토콜로 지정해줘야함
                self.dismiss(animated: true, completion: nil)
    }
    
    func saveTodo() {
        
        // todoList 테이블 가져오기
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
    
        //함수가 끝날 때 프로토콜함수까지 호출하게 만듬, viewcontroller 에서 didfinishData함수가 정의 되어 있음
        delegate?.didFinishSaveData()


        //화면내린다고해서 테이블뷰가 자동으로 갱신되지 않음 그래서 프로토콜로 지정해줘야함
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func updateTodo() {
        
        guard let hasData = selectedTodoList else {
            return
        }
        
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        // todolist 테이블 데이터 불러올 준비
        let fetchRequest:NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        //todolist 셀렉된 튜플만 가져오기
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        //컨텍스트에서 fetchRequest 조건이 걸린거를 가져온다
        do{
              let loadeddData = try context.fetch(fetchRequest)
            loadeddData.first?.title = titleTextField.text
            loadeddData.first?.date = Date()
            loadeddData.first?.prioirtyLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            //세이브는 uiapplicationdelegate 에서 가능
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate )
            
            //테이블에 데이터 저장
            appDelegate.saveContext()
            
            //함수가 끝날 때 프로토콜함수까지 호출하게 만듬, viewcontroller 에서 didfinishData함수가 정의 되어 있음
            delegate?.didFinishSaveData()


            //화면내린다고해서 테이블뷰가 자동으로 갱신되지 않음 그래서 프로토콜로 지정해줘야함
            self.dismiss(animated: true, completion: nil)
            
        }catch{
            print(error)
        }
       
        
    }
    
    @IBAction  func deleteTodo(_ sender: UIButton) {
        
        
        guard let hasData = selectedTodoList else {
            return
        }
        
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        // todolist 테이블 데이터 불러올 준비
        let fetchRequest:NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        //todolist 셀렉된 튜플만 가져오기
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do{
            let loadedData = try context.fetch(fetchRequest)
            
            if let loadFirstData = loadedData.first {
                    //메모리 상태에 있는거만 지움 그래서 앱 다시키면 있음
                    context.delete(loadFirstData)
                
                //그래서 앱델리게이트 세이브 해주면 된다
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate )
                
                //테이블에 데이터 저장
                appDelegate.saveContext()
            }
            
            
        }catch{
            print(error)
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true, completion: nil)
    }
    

}
