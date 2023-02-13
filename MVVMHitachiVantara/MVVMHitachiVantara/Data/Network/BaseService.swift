//
//  BaseService.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import Alamofire
import RxSwift

enum ServiceError:Error {
    case serverError
    case error
}
typealias TypeResult<T> = (Result<T,ServiceError>) -> Void
class BaseService{
    init(){}
    static var sharedBaseService = BaseService()
    let headers : HTTPHeaders = ["Accept" : "application/json"]
    
    let queue = DispatchQueue(label: "Queue")
    
    func baseRequest<T:Codable>(url:String,method:HTTPMethod,parameters:[String:Any]?,completion: @escaping TypeResult<T>) ->Observable<T>{
        return Observable.create{ [weak self] observable in
            let result = AF
                .request(url,method: method,parameters:parameters ,headers: self?.headers)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self , queue: self!.queue){
                    (result:AFDataResponse<T>) -> () in
                    switch result.result{
                    case.success(let data):
                        observable.onNext(data)
                        print("Success1 From BaseService")
                        completion(.success(data))
                    case.failure(let error):
                        print("error \(error)")
                    }
                }
            return Disposables.create{
                result.cancel()
            }
        }
    }
    
    func methodGet<T:Codable>(url:String,parameters:[String:Any]?,completion: @escaping TypeResult<T>) -> Observable<T>{
        return baseRequest(url: url, method: .get,parameters: parameters, completion: completion)
    }
    
    func methodPost<T:Codable>(url:String,parameters:[String:Any]?,completion: @escaping TypeResult<T>) ->Observable<T>{
        return baseRequest(url: url, method: .post,parameters: parameters, completion: completion)
    }
}

protocol BaseServiceProtocol {
    associatedtype T
    func getAll(url:String,completion: @escaping TypeResult<[T]>) -> Observable<[T]>
    func get(url:String,parameters:[String:Any]?)->Observable<T>
    func post(url:String,parameters:[String:Any]?)-> Observable<T>
}
