//
//  ViewController.swift
//  TodoList
//
//  Created by 이윤식 on 2022/01/05.
//

import UIKit
import CoreData

enum PriorityLevel: Int64 {
    case level1
    case level2
    case level3
}

extension PriorityLevel {
    var color: UIColor {
        switch self{
        case .level1:
            return .green
        case .level2:
            return .orange
        case .level3:
            return .red
        }
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoList = [TodoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "To Do List"
        
        self.makeNavigationBar()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        fetchData()
        todoTableView.reloadData()

        
    }
    
    //데이터 가져오기
    func fetchData() {
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
       let context = appdelegate.persistentContainer.viewContext
        
        do {
            self.todoList = try context.fetch(fetchRequest)
            
            
        }catch {
            printContent(error)
        }
    }
    
    func makeNavigationBar() {
        
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        
        let barAppearance = UINavigationBarAppearance()
        //        barAppearance.backgroundColor = .gray
                barAppearance.backgroundColor = UIColor(red: 30/255, green: 40/255, blue: 50/255, alpha: 0.2)
                
                self.navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
                
                self.navigationController?.navigationBar.standardAppearance = barAppearance
    }
    
    
    @objc func addNewTodo() {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        
        //***** 밑에 extension 코드 구현 으로 인해서 self로 연결해주면 detailvc present 할 때 didFinishSaveData 함수 실행
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.topTitleLabel.text = todoList[indexPath.row].title
        
        if let hasDate = todoList[indexPath.row].date {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd HH:mm:ss"
            let dateString = formatter.string(from: hasDate)
            
            cell.dateLabel.text = dateString
        }else {
            cell.dateLabel.text = ""
        }

        //로컬 데이터 가져오기
        let priority = todoList[indexPath.row].prioirtyLevel
        
        
       let priorityColor =  PriorityLevel(rawValue: priority)?.color
        
        cell.prioirtyView.backgroundColor = priorityColor
        cell.prioirtyView.layer.cornerRadius = cell.prioirtyView.bounds.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        
        detailVC.delegate = self
        detailVC.selectedTodoList = todoList[indexPath.row]

        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController:TodoDetailViewControllerDelegate {
    func didFinishSaveData() {
        self.fetchData()
        self.todoTableView.reloadData()
    }
    
    
}


//class CoreDataManager{
//
//    static let shared = CoreDataManager()
//    var context : NSManagedObjectContext{
//
//        return persistentContainer.viewContext
//    }
//
//    var todoList = [TodoList]()
//
//    private init(){
//
//
//    }
//
//    func fetchData(){
//
//        let fetchRequest : NSFetchRequest<TodoList> = TodoList.fetchRequest()
//
//
//        do{
//
//             try context.fetch(fetchRequest)
//
//        }catch{
//            print(error)
//        }
//
//    }
//
//    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//
//        let container = NSPersistentContainer(name: "TodoApp")
//
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//
//        })
//
//        return container
//
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//
//            } catch {
//
//               let nserror = error as NSError
//
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//
//            }
//        }
//    }
//}
