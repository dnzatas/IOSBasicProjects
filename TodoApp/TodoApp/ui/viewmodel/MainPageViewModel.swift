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
        copyDatabase()
        todoList = trepo.todoList
    }
    
    func deleting(todo_id:Int){
        trepo.deleting(todo_id: todo_id)
        loadTodos()
    }
    
    func search(searchText:String){
        trepo.search(searchText: searchText)
    }
    
    func loadTodos(){
        trepo.loadTodos()
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "todos", ofType: ".sqlite")
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(fileURLWithPath: filePath).appendingPathComponent("todos.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: veritabaniUrl.path()){
            print("Database already exist")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: veritabaniUrl.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
