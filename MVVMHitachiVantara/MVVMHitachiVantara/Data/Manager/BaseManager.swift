//
//  BaseManager.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import RxSwift
protocol BaseManagerProtocol {
    associatedtype T
    func loadUsers(url:String) -> Observable<[T]>
    func saveUsersToDb(url:String,view:UIView) -> Observable<[T]>
    func loadUser(url:String) -> Observable<T>
    func saveUserToDB(url:String,id:Int) -> Observable<T>
}


class BaseManager {
  
    var bag = DisposeBag()
   
    
}
