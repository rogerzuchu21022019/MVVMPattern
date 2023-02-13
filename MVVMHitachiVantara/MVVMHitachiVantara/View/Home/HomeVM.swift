//
//  HomeVM.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import RxSwift
import RxRelay
import Nuke

class HomeVM:BaseVM {
    var userManager = UserManager.sharedManager
    
    let inReload = PublishSubject<Void>()
    
    override func messaging(stringMessage: String) {
        self.messaging(stringMessage: stringMessage)
    }
    
    override func loadding(showAlert: Bool) {
        self.loadding(showAlert: showAlert)
    }
    var outputUsers = PublishSubject<[User]>()
    
    var offUsers = BehaviorRelay<[User]>(value: [])
    
    var replayUsers = ReplaySubject<[User]>.createUnbounded()
    
    
    
    func saveDB(url:String,view:UIView){
//        self.loadding(showAlert: true)
        userManager.saveUsersToDb(url: url, view: view)
            .subscribe(onNext: { [self]
                users in
                self.replayUsers.onNext(users)
            })
        
    }
    
    
    
    
    ///use BehaviorRelay<[User]>(value: [])
//    func loadUsers(url:String) ->Observable<[User]>{
//        if InternetConnectionManager.shared.isConnectedToNetwork(){
//            UserManager.shared.getUsers(url: url){ [self]
//                (response:Result<[User],ServiceError>) in // closure callback result
//                switch response {
//                case .success(let users):
//                    print("success loadUser from  TypeResult in HomeVM" )
//                    self.outputUsers.onNext(users)
//                    users.forEach({  user in
//                        handleExistedUser(user: user)
//                    })
//                case .failure(let failure):
//                    print("error")
//                }
//            }.observe(on: MainScheduler.instance) // observer of Observable from API
//                .subscribe(onNext: {
//                    element in
//
//                    print("success loadUser from  Observable in HomeVM")
//                }).disposed(by: bag)
//        }else{
//            let users = self.userManager.getList()
//            return Observable.deferred{ [unowned self] in
//                return Observable.just(users)
//            }.do(onNext: { [unowned self] data in
//                self.offUsers.accept(data)
//
//            })
//
//                }
//        return Observable.deferred{ [unowned self] in
//            return Observable.just(self.userManager.getList())
//        }.do(onNext: { [unowned self] data in
//            self.offUsers.accept(data)
//
//        })
//            }
    
    
    ///use ReplaySubject<[User]>.createUnbounded()
    //    func loadUsers(url:String,view:UIView) {
    //        if InternetConnectionManager.shared.isConnectedToInternet(){
    //            view.makeToast("Internet Connected")
    //            UserManager.shared.getUsers(url: url){ [self]
    //                (response:Result<[User],ServiceError>) in // closure callback result
    //                switch response {
    //                case .success(let users):
    //                    print("success loadUser from  TypeResult in HomeVM" )
    //                    self.outputUsers.onNext(users)
    //                    users.forEach({  user in
    //                        handleExistedUser(user: user)
    //
    //                    })
    //                case .failure(let failure):
    //                    print("error")
    //                }
    //            }.observe(on: MainScheduler.instance) // observer of Observable from API
    //                .subscribe(onNext: {
    //                    element in
    //
    //                    print("success loadUser from  Observable in HomeVM")
    //                }).disposed(by: bag)
    //        }else{
    //            view.makeToast("Internet DisConnected")
    //            let users = self.userManager.getList()
    //            self.replayOff.onNext(users)
    //        }
    //    }
    //
    //    func handleExistedUser(user:User){
    //        if PersistentStorage.shared.checkIfItemExist(id: user.id){
    //            //if existed is nothing
    //        }else{
    //            //handle if not existed
    //            self.userManager.add(user: user)
    //        }
    //    }
}



//class HomeVM:BaseVM {
//    var userManager = UserManager()
//    let inReload = PublishSubject<Void>()
//    override func messaging(stringMessage: String) {
//        self.messaging(stringMessage: stringMessage)
//    }
//    override func loadding(showAlert: Bool) {
//        self.loadding(showAlert: showAlert)
//    }
//        var outputUsers = PublishSubject<[User]>()
//
/// behaviorRelay
//        var outputUsers = BehaviorRelay<[User]>(value: [])
//        var loadData:Observable<[User]>{
//            return Observable.deferred{ [unowned self] in
//                return Observable.just(self.userManager.getList())
//            }.do(onNext: { [unowned self] data in
//                self.outputUsers.accept(data)
//
//            })
//        }
//
//    func loadUsers(url:String){
//                let users = userManager.saveToDb(url: url)
//
//        //        self.outputUsers.onNext(users)
//        //        print("users \(users)" )
////        if InternetConnectionManager.shared.isConnectedToNetwork(){
////            UserManager.shared.getUsers(url: url){ [self]
////                (response:Result<[User],ServiceError>) in // closure callback result
////                switch response {
////                case .success(let users):
////                    print("success loadUser from  TypeResult in HomeVM" )
////
//////                    self.outputUsers.bind(onNext: users).disposed(by: bag)
////                    users.forEach({  user in
////                        handleExistedUser(user: user)
////
////                    })
////                case .failure(let failure):
////                    print("error")
////                }
////            }.observe(on: MainScheduler.instance) // observer of Observable from API
////                .subscribe(onNext: {
////                    element in
////                    print("success loadUser from  Observable in HomeVM")
////                }).disposed(by: bag)
////        }else{
////            let users = self.userManager.getList()
////            if users != nil{
////                print("value \(users)")
////
////            }else{
////                print("error")
////            }
////        }
//    }
//    func handleExistedUser(user:User){
//        if PersistentStorage.shared.checkIfItemExist(id: user.id){
//            //if existed is nothing
//        }else{
//            //handle if not existed
//            self.userManager.add(user: user)
//        }
//    }
//
//}
