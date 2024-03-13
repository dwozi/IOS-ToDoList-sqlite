//
//  MainViewModel.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import Foundation
import RxSwift
class MainViewModel{
  
    var planRepo = Repository()
    var planList = BehaviorSubject<[Entity]>(value: [Entity]())
    
    
    init(){
        
        dataBaseCopy()
        planList = planRepo.planRepo
        planUpload()

    }
    
    func deletePlan(plan_id:Int){
        planRepo.deletePlan(plan_id: plan_id)
    }
    
    
    
    func planUpload(){
        planRepo.planUpload()
    }
    
    
    
    
    func dataBaseCopy(){
        
        let bundleWay = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyiedPlace = URL(filePath: targetWay).appending(path: "todo.sqlite")
        
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: copyiedPlace.path()){
            print("database already exits")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleWay!, toPath: copyiedPlace.path())
            }catch{
            }
        }
    }
}
