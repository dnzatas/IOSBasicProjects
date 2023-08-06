//
//  TodoDetail.swift
//  TodoApp
//
//  Created by deniz on 1.08.2023.
//

import UIKit

class TodoDetail: UIViewController {
    
    @IBOutlet weak var detailTextField: UITextField!
    var todo:Todos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = todo{
            detailTextField.text = td.todo_name
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        detailTextField.borderStyle = .none

        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: detailTextField.frame.height - 1, width: detailTextField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.systemGray6.cgColor
        detailTextField.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        detailTextField.layer.addSublayer(bottomLine)
        
    }
    
    @IBAction func updateTodoAct(_ sender: Any) {
        if let td = todo, let detailText = detailTextField.text {
            updating(todo_id: td.todo_id!, todo_name: detailText)
        }
    }
    
    func updating(todo_id: Int, todo_name:String){
        print("ID: \(todo_id) -> Todo: \(todo_name)")
    }
    
}
