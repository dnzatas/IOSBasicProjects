//
//  MainPageViewModel.swift
//  TodoApp
//
//  Created by deniz on 11.08.2023.
//

import Foundation
import RxSwift

class MainPageViewModel {
    
    var trepo = todosDaoRepository()
    var todoList = BehaviorSubject<[Todos]>(value: [Todos]())
    
    init(){
        todoList = trepo.todoList
    }
    
    func deleting(todo_id:Int){
        trepo.deleting(todo_id: todo_id)
    }
    
    func search(searchText:String){
        trepo.search(searchText: searchText)
    }
    
    func loadTodos(){
        trepo.loadTodos()
    }
}
