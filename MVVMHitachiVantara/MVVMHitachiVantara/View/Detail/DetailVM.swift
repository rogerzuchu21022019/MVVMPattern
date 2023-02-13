//
//  DetailVM.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 21/06/2022.
//

import Foundation
import RxSwift

class DetailVM:BaseVM{
    
    var user:User
    let inReload = PublishSubject<Void>()
    let string = PublishSubject<String>()
    let outUser = PublishSubject<User>()
    init(user:User){
        self.user = user
        super.init()
        self.inReload.subscribe(onNext: { [self]  () in
            self.saveDB( user: user)
        }).disposed(by: bag)
    }
    
    func saveDB(user:User){
        UserManager.sharedManager.saveUserToDB(url: user.url, id: user.id)
            .subscribe(onNext: {
            (user:User) in
                self.outUser.onNext(user)
                self.baseAlert.loadding.onNext(true)
                PersistentStorage.shared.getCoreDataDBPath()
                self.baseAlert.message.onNext("success alert")
            },
                       onError: {[weak self] error in
                self?.baseAlert.loadding.onNext(true)
                self?.baseAlert.message.onNext("failure alert")
            }).disposed(by: bag)
    }
    
//    private func loadUser(){
//        if InternetConnectionManager.shared.isConnectedToInternet(){
//
//            UserManager.shared.getUser(url: user.url, parameters: nil)
//                .subscribe(onNext: { [weak self] (user) in
//
//                    for i in 1...50 {
//                        UserManager.shared.update(type: user)
//                    }
//                    self?.outUser.onNext(user)
//                    self?.baseAlert.loadding.onNext(true)
//                    PersistentStorage.shared.getCoreDataDBPath()
//                    self?.baseAlert.message.onNext("success alert")
//                },
//                           onError: {[weak self] error in
//                    self?.baseAlert.loadding.onNext(true)
//                    self?.baseAlert.message.onNext("failure alert")
//                }).disposed(by: bag)
//        }else{
//
//            let test = UserManager.shared.getByID(id: user.id)
//
//
//            self.outUser.onNext(test!)
//        }
//    }
    
}
