//
//  Repository.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import Foundation
import RxSwift

class Repository{
    
    var planRepo = BehaviorSubject<[Entity]>(value: [Entity]())
    let db: FMDatabase?
    
    init(){
        
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(filePath: targetWay).appending(path: "todo.sqlite")
        db = FMDatabase(path: databaseURL.path())
    }
    
    
    
    
    
    func savePlan(plan_name:String){
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO plans (plan_name) VALUES (?) ", values: [plan_name])
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    
    func planUpload(){
        db?.open()
        var planList = [Entity]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM plans", values: nil)
            while result.next(){
                
                let result = Entity(plan_id: Int(result.string(forColumn: "plan_id"))!,
                                    plan_name: result.string(forColumn: "plan_name")!)
                
                planList.append(result)
                planRepo.onNext(planList)
                
                
            }
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        
    }
    
}
