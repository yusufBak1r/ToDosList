//
//  UpdateViewModel.swift
//  ToDosApp
//
//  Created by yusuf bakır on 26.05.2024.
//

import Foundation
class UpdateViewModel{
    var toDosRepo = ToDosDaoReporsitory()
    
    
    func update(toDo:ToDosModel,name:String ){
        
        toDosRepo.update(toDo:toDo, name: name)
    }
    
}
