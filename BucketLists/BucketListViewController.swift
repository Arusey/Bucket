//
//  ViewController.swift
//  BucketLists
//
//  Created by Kevin Lagat on 07/10/2021.
//

import UIKit

class BucketListViewController: UITableViewController {
    
    
    var items = ["Book", "laptop", "Pen", "bag"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bucketlist"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))
        // Do any additional setup after loading the view.
    }
    
    
    @objc func addItem() {
        let addItemVC = storyboard?.instantiateViewController(withIdentifier: "add") as! AddItemTableViewController
        addItemVC.saveItemDelegate = self

        self.navigationController?.pushViewController(addItemVC, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
    }

}

extension BucketListViewController: SaveItemDelegate {
    func saveItemText(_ item: String) {
        
//        let addItem = storyboard?.instantiateViewController(withIdentifier: "add") as! AddItemTableViewController
        items.append(item)
        tableView.reloadData()
    }
    
    
}
