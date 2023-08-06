//
//  TodoAdd.swift
//  TodoApp
//
//  Created by deniz on 1.08.2023.
//

import UIKit

class TodoAdd: UIViewController {
    
    @IBOutlet weak var addTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: addTextField.frame.height - 1, width: addTextField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.systemGray6.cgColor
        addTextField.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        addTextField.layer.addSublayer(bottomLine)
                
    }


    @IBAction func todoSaveAct(_ sender: Any) {
        if let atf = addTextField.text {
            addTodo(todo_id: 2, todo_name: atf)
        }
    }
    
    func addTodo(todo_id:Int, todo_name:String){
        let todo = Todos(todo_id: todo_id, todo_name: todo_name)
        print("ID: \(todo.todo_id!) -> Todo: \(todo.todo_name!)")
    }
}
