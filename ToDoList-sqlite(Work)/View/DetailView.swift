//
//  DetailView.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import UIKit

class DetailView: UIViewController {

  
    @IBOutlet weak var textField: UITextField!
    
    var plan : Entity?
    var detailVM = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let plan = plan?.plan_name{
            textField.text = plan
        }
    }
    @IBAction func updateClick(_ sender: Any) {
        guard let name = textField.text , let id = plan?.plan_id else{
            return
        }
        navigationController?.popViewController(animated: true)
        detailVM.updatePlan(plan_name: name, plan_id: id)
    }
}
