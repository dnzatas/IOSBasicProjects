//
//  Person.swift
//  ContactsApp
//
//  Created by deniz on 22.07.2023.
//

import Foundation

enum Gender: CaseIterable {
    case man
    case woman
    
    var gender:String{
        switch self {
        case .woman:
            return "woman"
        case .man:
            return "man"
        }
    }
}

enum GroupType: CaseIterable {
    case allContacts
    case family
    case friend
    case work
    case dance
    case book
    
    var groupType:String{
        switch self {
        case .allContacts:
            return "All Contacts"
        case .family:
            return "Family"
        case .friend:
            return "Friend"
        case .work:
            return "Work"
        case .dance:
            return "Dance Class"
        case .book:
            return "Book Group"
        }
    }
}


class Person {
    var name:String?
    var gender:Gender?
    var group:GroupType?
    var imageName:Gender?
    
    init(){}
    
    init(name: String, gender: Gender, group: GroupType, imageName: Gender) {
        self.name = name
        self.gender = gender
        self.group = group
        self.imageName = imageName
    }
}

let person1 = Person(name: "John", gender: .man, group:.book, imageName: .man)
let person2 = Person(name: "Jane", gender: .woman, group: .book, imageName: .woman)
let person3 = Person(name: "Alex", gender: .man, group: .book, imageName: .man)
let person4 = Person(name: "Emily", gender: .woman, group: .dance, imageName: .woman)
let person5 = Person(name: "Michael", gender: .man, group: .dance, imageName: .man)
let person6 = Person(name: "Samantha", gender: .woman, group: .dance, imageName: .woman)
let person7 = Person(name: "Daniel", gender: .man, group: .family, imageName: .man)
let person8 = Person(name: "Grace", gender: .woman, group: .family, imageName: .woman)
let person9 = Person(name: "Ryan", gender: .man, group: .family, imageName: .man)
let person10 = Person(name: "Avery", gender: .woman, group: .friend, imageName: .woman)
let person11 = Person(name: "Sophia", gender: .woman, group: .friend, imageName: .woman)
let person12 = Person(name: "Connor", gender: .man, group: .friend, imageName: .man)
let person13 = Person(name: "Olivia", gender: .woman, group: .work, imageName: .woman)
let person14 = Person(name: "Ethan", gender: .man, group: .work, imageName: .man)
let person15 = Person(name: "Alexis", gender: .man, group: .work, imageName: .man)
let person16 = Person(name: "Isabella", gender: .woman, group: .work, imageName: .woman)
let person17 = Person(name: "Liam", gender: .man, group: .family, imageName: .man)
let person18 = Person(name: "Charlotte", gender: .woman, group: .family, imageName: .woman)
let person19 = Person(name: "Noah", gender: .man, group: .friend, imageName: .man)
let person20 = Person(name: "Grace", gender: .woman, group: .friend, imageName: .woman)
let person21 = Person(name: "William", gender: .man, group: .book, imageName: .man)
let person22 = Person(name: "Logan", gender: .man, group: .work, imageName: .man)


let people: [Person] = [person1, person2, person3, person4, person5, person6, person7, person8, person9, person10, person11, person12, person13, person14, person15, person16, person17, person18, person19, person20, person21, person22]
