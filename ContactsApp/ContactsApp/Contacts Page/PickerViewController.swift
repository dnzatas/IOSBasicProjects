//
//  PickerViewController.swift
//  ContactsApp
//
//  Created by deniz on 23.07.2023.
//

import UIKit

protocol PickerViewControllerDelegate {
    func didSelectGroupType(_ type: GroupType?)
}

class PickerViewController: UIViewController {

    @IBOutlet weak var filterPickerView: UIPickerView!
    private var selectedGroupType: GroupType?
    var delegate: PickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        if (selectedGroupType == .allContacts || selectedGroupType == nil){
            delegate?.didSelectGroupType(nil)
        }else{
            delegate?.didSelectGroupType(selectedGroupType ?? .allContacts)
        }
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        delegate?.didSelectGroupType(nil)
        dismiss(animated: true)
    }
    
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GroupType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GroupType.allCases[row].groupType
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGroupType = GroupType.allCases[row]
    }
}
