//
//  ViewController.swift
//  TodoApp
//
//  Created by deniz on 1.08.2023.
//

import UIKit

class MainPage: UIViewController {
    
    var todoList = [Todos]()
    var viewmodel = MainPageViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        _ = viewmodel.todoList.subscribe(onNext: { list in
            self.todoList = list
            self.tableView.reloadData()
        })
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewmodel.loadTodos()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail"{
            if let todo = sender as? Todos {
                let detailViewController = segue.destination as! TodoDetail
                detailViewController.todo = todo
            }
            
        }
    }
}

extension MainPage: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        
        cell.todoContentLabel.text = "❍  \(todo.todo_name!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            _,_,completion in
            
            let todo = self.todoList[indexPath.row]
            let alert = UIAlertController(title: "Delete", message: "Do you want delete this todo?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){
                action in
                self.viewmodel.deleting(todo_id: todo.todo_id!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension MainPage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewmodel.search(searchText: searchText)
    }
}

