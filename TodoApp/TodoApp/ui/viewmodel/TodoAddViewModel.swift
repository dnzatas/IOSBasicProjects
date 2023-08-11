//
//  TodoAddViewModel.swift
//  TodoApp
//
//  Created by deniz on 11.08.2023.
//

import Foundation

class TodoAddViewModel {
    
    var trepo = todosDaoRepository()
    
    func addTodo(todo_id:Int, todo_name:String){
        trepo.addTodo(todo_id: todo_id, todo_name: todo_name)
    }
}
