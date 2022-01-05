//
//  ViewController.swift
//  TodoList
//
//  Created by 이윤식 on 2022/01/05.
//

import UIKit
import CoreData

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
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasDate)
            
            cell.dateLabel.text = dateString
        }else {
            cell.dateLabel.text = ""
        }
        
        return cell
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
