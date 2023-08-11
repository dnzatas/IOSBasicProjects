//
//  Todos.swift
//  TodoApp
//
//  Created by deniz on 1.08.2023.
//

import Foundation


class Todos{
    var todo_id:Int?
    var todo_name:String?
    
    init(){
        
    }
    
    init(todo_id:Int, todo_name:String) {
        self.todo_id = todo_id
        self.todo_name = todo_name
    }
}
