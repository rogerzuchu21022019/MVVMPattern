//
//  BaseRepository.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 21/06/2022.
//

import Foundation
import RxSwift

enum RepositoryError:Error{
    case errorGetList
    case errorGet
    case errorAdd
    case errorUpdate
    case errorDelete
}
protocol BaseRepositoryProtocol{
    associatedtype T
    
    ///handle data from NSManagedObject
    func getList () ->[T]
    func get(type id:Int) -> T?
    func add(type:T)
    func update(type:T)
    func delete(type id:T)
    
    
    /// handle data from API
    func getUsers(url:String,completion: @escaping TypeResult<[T]>) -> Observable<[T]>
    func getUser(url:String,parameters:[String:Any]?) -> Observable<T>
    func createUser(url:String,parametrs:[String:Any]?,completion: @escaping TypeResult<T>) -> Observable<T>
}

class BaseRepository{
    
    var bag = DisposeBag()
    
    
    init(){
        
    }
}
