//
//  UserManager.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import RxSwift
class UserManager : BaseManager,BaseManagerProtocol {

    static var sharedManager = UserManager()
    
    ///Get data from <T>Repository
    var userRepository = UserRepository.shared
    
    
    /// 2 save users
    func saveUsersToDb(url:String,view:UIView) -> Observable<[User]> {
        if InternetConnectionManager.shared.isConnectedToInternet(){
            view.makeToast("Internet Connected")
            return loadUsers(url: url)
        }
        return Observable.create({ [weak self] observer in
            view.makeToast("Internet DisConnected")
            let users = self!.userRepository.getList()
            observer.onNext(users)
            return Disposables.create()
        })
    }
    
    /// 1 load users
    func loadUsers(url:String) -> Observable<[User]> {
        return Observable.create({ [weak self] observer in
            self!.userRepository.getUsers(url: url){ [weak self]
                (response:Result<[User],ServiceError>) in // closure callback result
                switch response {
                case .success(let users):
                    print("success loadUser from  TypeResult in UserManager" )
                    users.forEach({
                        user in
                        self!.fetchUserExisted(user: user)
                    })
                    observer.onNext(users)
                case .failure(let failure):
                    debugPrint("error \(failure)")
                }
            }.subscribe(onNext: { // observer of Observable from API
                users in
                observer.onNext(users)
                print("success loadUser from  Observable in UserManager" )
            }).disposed(by: self!.bag)
            return Disposables.create()
        })
    }
    
    
    ///save user
    func saveUserToDB(url:String,id:Int) -> Observable<User> {
        if InternetConnectionManager.shared.isConnectedToInternet(){
            return loadUser(url: url)
        }
        return Observable.create({ [weak self] observer in
            let user = self!.userRepository.get(type: id)
            observer.onNext(user!)
            return Disposables.create()
        })
    }
    
    ///load users
    func loadUser(url:String) -> Observable<User> {
        return Observable.create({ [weak self]  observer in
            self!.userRepository.getUser(url: url, parameters: nil).subscribe(onNext: { // observer of Observable from API
                    user in
                    self!.fetchUserExisted(user: user)
                    observer.onNext(user)                   
            }).disposed(by: self!.bag)
            
            return Disposables.create()
        })
    }
    
    
    ///
    func fetchUserExisted(user:User){
        if PersistentStorage.shared.checkIfItemExist(id: user.id){
            self.userRepository.update(type: user)
        }else{
            self.userRepository.add(type: user)
        }
    }
    
}
