//
//  UserService.swift
//  MVVMPattern
//
//  Created by Vu Thanh Nam on 16/06/2022.
//

import Foundation

import RxSwift

enum UserPath {
    case users(since:String)
    case user(username:String)
    var path:String {
        switch self {
        case .users(let since):
            return "since \(since)"
        case .user(let username):
            return "username \(username)"
        }
    }
}

protocol UserProtocal{
    func getUsers(path:String)->Observable<[User]>
    func getUser(path:String)->Observable<User>
}
class UserService:BaseService , UserProtocal{
    func getUsers(path: String) -> Observable<[User]> {
        let path = UserPath.users(since: path).path
        return get(path: path, parametter: nil, completion: nil)
    }
    
    func getUser(path: String) -> Observable<User> {
        let path = UserPath.user(username: path).path
        return get(path: path, parametter: nil, completion: nil)
    }
}
