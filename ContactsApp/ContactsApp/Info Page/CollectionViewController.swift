//
//  CollectionViewController.swift
//  ContactsApp
//
//  Created by deniz on 23.07.2023.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var selectedContactImage: UIImageView!
    @IBOutlet weak var selectedContactGroup: UILabel!
    @IBOutlet weak var selectedContactName: UILabel!
    
    var selectedContactNameStr: String?
    var selectedImageName: String?
    var selectedGroup:GroupType?
    var selectedContacts: [Person] = [Person]()
    
    @IBOutlet weak var contactDetailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactDetailCollectionView.delegate = self
        contactDetailCollectionView.dataSource = self
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let viewWidth = self.contactDetailCollectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        design.itemSize = CGSize(width: (viewWidth-30)/2, height: (viewWidth-30)/2)
        design.scrollDirection = .horizontal
        contactDetailCollectionView.collectionViewLayout = design
        
        if let name = selectedContactNameStr {
            selectedContactName.text = name
        }
        selectedContactImage.image = UIImage(named: selectedImageName!)
        selectedContactGroup.text = selectedGroup?.groupType
    }

}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactDetailCell", for: indexPath) as! ContactCollectionViewCell
        cell.contactName.text = selectedContacts[indexPath.row].name
        cell.contactImage.image = UIImage(named: String(describing: selectedContacts[indexPath.row].imageName!))
        return cell
    }
    
    
}
