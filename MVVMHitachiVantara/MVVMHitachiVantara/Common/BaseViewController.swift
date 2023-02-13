//
//  BaseViewController.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import UIKit
import RxSwift
class BaseViewController<VM:BaseVM> : UIViewController{
    var viewModel:VM!
    
    
    var bag = DisposeBag()
    
    
    var showIndiators = UIActivityIndicatorView()
    
    func setUpUI(){
        
    }
    func setUpViewModel(){
        
    }
    
    func setUpData(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpViewModel()
        setUpData()
        
    }
    
    func setUpBinding(){
        viewModel.baseAlert.message
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { element in
                self.alert(message: element)
            })
        
        viewModel.baseAlert.loadding
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { element in
                self.alert(message: element.description)
            })
    }
    
}
