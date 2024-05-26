//
//  MainViewModel.swift
//  ToDosApp
//
//  Created by yusuf bakır on 26.05.2024.
//

import Foundation
import RxSwift
class MainViewModel {
    var toDoList = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    var toDosRepo = ToDosDaoReporsitory()
    init() {
        self.toDoList = toDosRepo.toDoList
   
    }
    func delete (toDo : ToDosModel) {
        toDosRepo.delete(toDo: toDo)
        loadToDos()
    }
    func search(text:String) {
        toDosRepo.search(text: text)
        
    }
    func loadToDos() {
        toDosRepo.loadToDos()
    }
    
}
