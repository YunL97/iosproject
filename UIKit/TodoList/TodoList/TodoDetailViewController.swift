//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by 이윤식 on 2022/01/05.
//

import UIKit
import CoreData

class TodoDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func setPriorty(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            break
        case 2:
            break
        case 3:
            break
            
        default:
            break
        }
    }
    
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
        
        //세이브는 uiapplicationdelegate 에서 가능
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate )
        
        appDelegate.saveContext()
    }
    

}
