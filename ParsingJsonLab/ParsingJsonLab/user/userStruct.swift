//
//  userStruct.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 12/3/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import Foundation


struct RandomUserData : Decodable {
    let results: [User]
}

struct User: Decodable {
    let gender: String
    let name: Name
    
}


struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Adress: Decodable {
    let location: Location
    
}
struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
}
struct Street: Decodable {
    let number: Int
    let name: String
}

struct Email: Decodable {
    let email: String
}

struct DateOfBirth: Decodable{
    let dob:Date
}
struct Date: Decodable {
    
    let date: String
}

struct PhoneNumber: Decodable {
    let phone: String
}

struct Photo: Decodable {
    let picture: Picture
}
struct Picture: Decodable {
    let medium: String
}




extension RandomUserData {
    
    static func getUsers(from data: Data) -> [User] {
        var users = [User]()
        do{
            let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
            users = randomUserData.results
        } catch{
            fatalError("decoding error \(error)")
        }
        return users
    }
}
