//
//  SignInVM.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import RxSwift
class SignInVM : BaseVM {
    var userManager = UserManager()
    
    var outputUsers = PublishSubject<[User]>()
    var outputUser = PublishSubject<User>()
    
    
}
