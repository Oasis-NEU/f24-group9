//
//  ToDoViewController.swift
//  Oasis-front-end
//
//  Created by Jayden Ngo on 10/4/24.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //creating the table, naming the variable "table"
    private let table : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
    }
    
    //override the table frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
//the two functions below are required for the UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    creates and returns a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //use the same name "cell" to refer to the cell we created
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
