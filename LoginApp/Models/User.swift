//
//  User.swift
//  LoginApp
//
//  Created by Egor Ledkov on 06.07.2022.
//

import Foundation

struct User {
    let id: UUID
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            id: UUID(),
            username: "iceman",
            password: "1234",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let lastname: String
    let site: String
    let image: String
    let about: String
    
    var name : String {
        firstName + " " + lastname
    }
    
    static func getPerson() -> Person {
        Person(
            firstName: "Егор",
            lastname: "Ледков",
            site: "http://vk.com/iceman",
            image: "iceman",
            about: """
В 2010 закончил Экономический факультет СПБГУ по специальности: "Информатик минус Экономист".
С тех пор методом тыка, проб и ошибок, собственно ручно поглащаю многие направления ИТ индустрии.
Не программист, не разработчик, не архитектор, не администратор, не режиссёр трансляций.
Друзья думают, что стриптизёр.
"""
        )
    }
}
