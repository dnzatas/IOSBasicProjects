//
//  todosDaoRepository.swift
//  TodoApp
//
//  Created by deniz on 11.08.2023.
//

import Foundation
import RxSwift

class todosDaoRepository {
    
    var todoList = BehaviorSubject<[Todos]>(value: [Todos]())
    
    func addTodo(todo_id:Int, todo_name:String){
        let todo = Todos(todo_id: todo_id, todo_name: todo_name)
        print("ID: \(todo.todo_id!) -> Todo: \(todo.todo_name!)")
    }
    
    func updating(todo_id: Int, todo_name:String){
        print("ID: \(todo_id) -> Todo: \(todo_name)")
    }
    
    func deleting(todo_id:Int){
        print("Deleted Todo Id: \(todo_id)")
    }
    
    func search(searchText:String){
        print("Todo search: \(searchText)")
    }
    
    func loadTodos(){
        var list = [Todos]()
        let td1 = Todos(todo_id: 1, todo_name: "Go shopping")
        let td2 = Todos(todo_id: 2, todo_name: "Go to the gym")
        let td3 = Todos(todo_id: 3, todo_name: "Build an app")
        let td4 = Todos(todo_id: 3, todo_name: "Write medium article")
        
        list.append(td1)
        list.append(td2)
        list.append(td3)
        list.append(td4)
        
        todoList.onNext(list)
    }
}
