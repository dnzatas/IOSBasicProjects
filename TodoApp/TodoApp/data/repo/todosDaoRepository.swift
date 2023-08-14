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
    let db:FMDatabase?
    
    init(){
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(fileURLWithPath: filePath).appendingPathComponent("todos.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func addTodo(todo_id:Int, todo_name:String){
        
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO todo (todo_name) VALUES (?)", values:[todo_name])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func updating(todo_id: Int, todo_name:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE todo SET todo_name = ? WHERE todo_id = ?", values:[todo_name, todo_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleting(todo_id:Int){
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM todo WHERE todo_id = ?", values:[todo_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func search(searchText:String){
        db?.open()
        var list = [Todos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM todo WHERE todo_name LIKE '%\(searchText)%'", values: nil)
            while result.next(){
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_name = result.string(forColumn:"todo_name")!
                
                let todo = Todos(todo_id: todo_id, todo_name: todo_name)
                list.append(todo)
            }
            todoList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func loadTodos(){
        db?.open()
        var list = [Todos]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM todo", values: nil)
            while result.next(){
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_name = result.string(forColumn: "todo_name")
                
                let todo = Todos(todo_id: todo_id, todo_name: todo_name!)
                list.append(todo)
            }
            todoList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
