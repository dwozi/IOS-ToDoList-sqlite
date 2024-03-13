//
//  DetailViewModel.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import Foundation

class DetailViewModel{
    
    var planRepo = Repository()
    
    
    func updatePlan(plan_name:String,plan_id:Int){
        planRepo.updatePlan(plan_name: plan_name, plan_id: plan_id)
    }
}
