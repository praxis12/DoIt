//
//  TasksViewController.swift
//  DoIt
//
//  Created by Josh Arntz on 3/30/17.
//  Copyright © 2017 Mr. Bear. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else {
            cell.textLabel?.text = " \(task.name)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    @IBAction func plusTapped(_ sender: Any) {
     
     performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue" {
        let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }

} 
