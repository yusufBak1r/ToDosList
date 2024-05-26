//
//  ToDosDaoReporsitory.swift
//  ToDosApp
//
//  Created by yusuf bakır on 26.05.2024.
//

import Foundation
import RxSwift

class ToDosDaoReporsitory {
    
    
    var toDoList = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    let contex = appDelegate.persistentContainer.viewContext
    
    func save(name : String ){
    let toDo = ToDosModel(context: contex)
        toDo.name = name
        appDelegate.saveContext()
        
    }
    func update(toDo :ToDosModel,name:String ){
        toDo.name = name
        appDelegate.saveContext()
        loadToDos()
    }
    func delete (toDo :ToDosModel) {
        contex.delete(toDo)
        appDelegate.saveContext()
        
    }
    func search (text:String) {
        
           do {
               let fetch = ToDosModel.fetchRequest()
               fetch.predicate = NSPredicate(format: "name CONTAINS[c]%@", text)
               let list = try contex.fetch(fetch)
               toDoList.onNext(list)
           }catch{
               print(error.localizedDescription)
               
           }
        
    }
    func loadToDos() {
        do {
            let fetch = ToDosModel.fetchRequest()
            let list = try contex.fetch(fetch)
            toDoList.onNext(list)
        }catch{
            print(error.localizedDescription)
            
        }
    }
}
