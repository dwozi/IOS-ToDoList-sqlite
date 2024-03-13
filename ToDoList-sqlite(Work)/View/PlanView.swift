//
//  planView.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import UIKit

class PlanView: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    var viewModel = PlanViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

  
    @IBAction func addClick(_ sender: Any) {
        
        if let plan = textField.text{
            viewModel.savePlan(plan_name: plan)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
