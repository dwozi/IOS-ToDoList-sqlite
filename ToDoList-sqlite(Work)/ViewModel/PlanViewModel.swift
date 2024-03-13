//
//  PlanDetailView.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import Foundation


class PlanViewModel{
    
    var planRepo = Repository()
    
    
    
    func  savePlan(plan_name:String){
        
        planRepo.savePlan(plan_name: plan_name)
    }
    
}
