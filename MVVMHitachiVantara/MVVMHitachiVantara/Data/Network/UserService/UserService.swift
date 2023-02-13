//
//  UserService.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import RxSwift

class UserService : BaseService,BaseServiceProtocol {
    
    static var shared = UserService()
    func getAll(url: String, completion: @escaping TypeResult<[User]>) -> Observable<[User]> {
        print("Success2 From UserService ")
        return BaseService.sharedBaseService.methodGet(url: url, parameters: nil,completion: completion)
    }
    
    func get(url: String,parameters:[String:Any]?) -> Observable<User> {
        return BaseService.sharedBaseService.methodGet(url: url, parameters: parameters){
            (result:Result<User,ServiceError>) in
                switch result {
                case .success(_):
                    print("success2 From UserService")
                case .failure(_):
                    
                    print("errror")
                }
            }
    }
    
    func post(url: String, parameters: [String : Any]?) -> Observable<User> {
        return BaseService.sharedBaseService.methodPost(url: url, parameters: parameters){
            (result:Result<User,ServiceError>) in
                switch result {
                case .success(_):
                    print("success2 From UserService")
                case .failure(_):
                    print("errror")
                }
        }
    }
   
    typealias T = User
    
    
}
