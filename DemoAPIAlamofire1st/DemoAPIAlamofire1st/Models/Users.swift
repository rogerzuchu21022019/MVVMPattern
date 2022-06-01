//
//  Users.swift
//  DemoAPIAlamofire1st
//
//  Created by gcs on 5/27/22.
//

import Foundation
struct Users:Decodable {
    var idUser:String
    var passwords:String
    var age : Int
    var fullname:String
    var phone:String
    var email:String
    var job:String
    var address:String
    var avatar:String
    
    enum CodeKey:String,CodingKey {
        case idUser = "idUser"
        case passwords = "passwords"
        case age = "age"
        case fullname = "fullname"
        case phone = "phone"
        case email = "email"
        case job = "job"
        case address = "address"
        case avatar = "avatar"

    }
}
