//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Josh Arntz on 4/10/17.
//  Copyright © 2017 Mr. Bear. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var previousVC : TasksViewController!
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task.important {
        taskLabel.text = "❗️\(task.name) "
        } else {
            taskLabel.text = task.name
        }
    }

    @IBAction func completeTaskTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
