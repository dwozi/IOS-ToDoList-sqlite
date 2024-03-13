//
//  Entity.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import Foundation

class Entity{
    var plan_id : Int?
    var plan_name : String?
    
    init(){
        
    }
    
    init(plan_id: Int? = nil, plan_name: String? = nil) {
        self.plan_id = plan_id
        self.plan_name = plan_name
    }
    
    
}


