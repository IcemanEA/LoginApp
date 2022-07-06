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
    
    static func getUserFrom(username: String) -> User? {
        for user in User.getUsers() {
            if user.username == username {
                return user
            }
        }
        return nil
    }
    
    static func getUsers() -> [User] {
        [
            User(
                id: UUID(),
                username: "debash",
                password: "1234",
                person: Person(
                    username: "debash",
                    firstName: "Алексей",
                    lastname: "Ефимов",
                    site: "https://debash.medium.com",
                    image: "debash",
                    about: """
Не журналист, не блогер, не фотограф, не музыкант, не являюсь автором каких либо проектов.
"""
                )
            ),
            User(
                id: UUID(),
                username: "iceman",
                password: "1234",
                person: Person(
                    username: "iceman",
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
            )
        ]
    }
}

struct Person {
    let username: String
    let firstName: String
    let lastname: String
    let site: String
    let image: String
    let about: String
    
    var name : String {
        firstName + " " + lastname
    }
}
