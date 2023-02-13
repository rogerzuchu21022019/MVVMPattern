//
//  BaseViewModel.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import RxSwift
class BaseVM {
    static var shared = BaseVM()
    
    let baseAlert : BaseAlert
    init(){
        baseAlert = BaseAlert(message : PublishSubject<String>(),loadding: PublishSubject<Bool>())
    }
    
    let bag = DisposeBag()
    
    func loadding(showAlert:Bool){
        baseAlert.loadding.onNext(showAlert)
    }
    
    func messaging(stringMessage: String){
        baseAlert.message.onNext(stringMessage)
    }
}

struct BaseAlert {
    let message: PublishSubject<String>
    let loadding: PublishSubject<Bool>
}
