//
//  ViewController.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class SignInVC: BaseViewController<SignInVM> {
   
    var url = "https://api.github.com/users"
    
    @IBAction func signInBtn(_ sender: UIButton) {
        
        let homeVC = SignInVC.createInstantiate(nameStoryboard: "HomeVC", withIdentifier: "homevc") as! HomeVC
        
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
    override func setUpUI() {
        super.setUpUI()
    }
    
    override func setUpViewModel() {
        super.setUpViewModel()
        viewModel = SignInVM()
    
    }
    override func setUpData() {
        super.setUpData()
    }
    
    
}


