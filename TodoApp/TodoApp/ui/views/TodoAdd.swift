//
//  TodoAdd.swift
//  TodoApp
//
//  Created by deniz on 1.08.2023.
//

import UIKit

class TodoAdd: UIViewController {
    
    @IBOutlet weak var addTextField: UITextField!
    var viewmodel = TodoAddViewModel()
    
    @IBOutlet weak var todoSaveOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoSaveOutlet.layer.cornerRadius = 20
        
        addTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: addTextField.frame.height - 1, width: addTextField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.systemGray6.cgColor
        addTextField.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        addTextField.layer.addSublayer(bottomLine)
                
    }


    @IBAction func todoSaveAct(_ sender: Any) {
        if let atf = addTextField.text {
            viewmodel.addTodo(todo_id: 2, todo_name: atf)
        }
    }
}
