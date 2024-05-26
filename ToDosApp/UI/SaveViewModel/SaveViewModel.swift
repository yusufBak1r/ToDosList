//
//  SaveViewModel.swift
//  ToDosApp
//
//  Created by yusuf bakır on 26.05.2024.
//

import Foundation
class SaveViewModel {
    var toDosRepo = ToDosDaoReporsitory()
    func save(name : String ){
        toDosRepo.save(name: name)
        
    }
}
