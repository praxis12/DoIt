//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Josh Arntz on 4/4/17.
//  Copyright © 2017 Mr. Bear. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!

    var previousVC: TasksViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let task = Task()
        if textField != nil {
        task.name = textField.text!
        }
        task.important = importantSwitch.isOn
        
        if task.important {
            previousVC.tasks.insert(task, at: 0)
        } else {
            previousVC.tasks.append(task)
            
        }
        
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
