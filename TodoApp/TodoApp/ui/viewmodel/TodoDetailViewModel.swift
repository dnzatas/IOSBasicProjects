//
//  TodoDetailViewModel.swift
//  TodoApp
//
//  Created by deniz on 11.08.2023.
//

import Foundation

class TodoDetailViewModel {
    
    var trepo = todosDaoRepository()
    
    func updating(todo_id: Int, todo_name:String){
        trepo.updating(todo_id: todo_id, todo_name: todo_name)
    }
}
