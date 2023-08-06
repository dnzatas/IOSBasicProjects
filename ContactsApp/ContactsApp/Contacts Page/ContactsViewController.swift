//
//  ContactsViewController.swift
//  ContactsApp
//
//  Created by deniz on 22.07.2023.
//

import UIKit


class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var contactSearchBar: UISearchBar!
    
    var isSearch = false
    var searchingPeople = [Person]()
    
    private var selectedGroupType: GroupType? {
        didSet {
            contactsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactSearchBar.delegate = self
        
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), style: .done, target: self, action: #selector(filterButtonAct))
        navigationItem.rightBarButtonItem = filterButton

    }
    
    @objc private func filterButtonAct() {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "PickerViewController") as? PickerViewController {
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }

}


extension ContactsViewController: PickerViewControllerDelegate {
    func didSelectGroupType(_ type: GroupType?) {
        selectedGroupType = type
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearch{
            return 1
        }else{
            return setSections().count
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearch{
            return ""
        }else{
            return setSections()[section].groupType
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch{
            return searchingPeople.count
        }else{
            return filterContacts(section).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if isSearch{
            content.text = searchingPeople[indexPath.row].name
            content.image = UIImage(named: String(describing: searchingPeople[indexPath.row].imageName!))
        }else{
            content.text = filterContacts(indexPath.section)[indexPath.row].name
            content.image = UIImage(named: String(describing: filterContacts(indexPath.section)[indexPath.row].imageName!))
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let filterbyGroupContacts = filterContacts(indexPath.section).filter({$0.name != filterContacts(indexPath.section)[indexPath.row].name})
        
        let storyboard = UIStoryboard(name: "CollectionViewController", bundle: nil)
        let collectionVC = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        collectionVC.selectedContactNameStr = filterContacts(indexPath.section)[indexPath.row].name
        collectionVC.selectedImageName = String(describing: filterContacts(indexPath.section)[indexPath.row].imageName!)
        collectionVC.selectedContacts = filterbyGroupContacts
        collectionVC.selectedGroup = filterContacts(indexPath.section)[indexPath.row].group
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Contacts", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(collectionVC, animated: true)
                
    }
    
    private func setSections() -> [GroupType] {
        
        if let selectedGroupType {
            return [selectedGroupType]
        } else {
            return GroupType.allCases
        }
    }
    
    func filterContacts(_ sectionIndex:Int) -> [Person] {
        if selectedGroupType == nil {
            return people.filter({$0.group == GroupType.allCases[sectionIndex]})
        } else {
            return people.filter({ $0.group == selectedGroupType })
        }
    }
}

extension ContactsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            isSearch = false
        }else{
            isSearch = true
            searchingPeople = people.filter({$0.name!.lowercased().prefix(searchText.count) == searchText.lowercased() })
        }
        contactsTableView.reloadData()
        
    }    
}



