//
//  ViewController.swift
//  BucketLists
//
//  Created by Kevin Lagat on 07/10/2021.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController {
    
    
    var items = ["Book", "laptop", "Pen", "bag"]
    
    var students = [Student]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bucketlist"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAllItems()

    }
    
    
    @objc func addItem() {
        let addItemVC = storyboard?.instantiateViewController(withIdentifier: "add") as! AddItemTableViewController
        addItemVC.saveItemDelegate = self

        self.navigationController?.pushViewController(addItemVC, animated: true)
    }
    
    func fetchAllItems() {
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do {
            let results = try managedObjectContext.fetch(itemRequest)
            students = results as! [Student]
            
            for student in students {
                print("\(student.name)")
            }
            
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row].name
        return cell
        
    }

}

extension BucketListViewController: SaveItemDelegate {
    func saveItemText(_ item: String) {
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: managedObjectContext) as! Student
        student.name = item
        
        guard let myStudent = student.name else { return }
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success", myStudent)
            } catch {
                print("\(error)")
            }
        }
        
    
    }
    
    
}
