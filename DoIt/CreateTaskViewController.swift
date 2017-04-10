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


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        if textField != nil {
        task.name = textField.text!
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        task.important = importantSwitch.isOn
        
        //Pop back
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
