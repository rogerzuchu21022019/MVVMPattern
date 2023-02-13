//
//  DetailVC.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 21/06/2022.
//

import Foundation
import UIKit
import RxSwift
import WebKit
import Toast_Swift
class DetailVC: BaseViewController<DetailVM> {
    
    @IBOutlet weak var lblFollower: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblCreateAt: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    static func create(user:User)->DetailVC {
        let detailVC = DetailVC.createInstantiate(nameStoryboard: "DetailVC", withIdentifier: "DetailVC") as! DetailVC
        detailVC.viewModel = DetailVM(user: user)
        return detailVC
    }
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        clickToLbl()
        print("view load detail")
    }
    override func setUpUI() {
        super.setUpUI()
        
    }
    override func setUpViewModel() {
        super.setUpViewModel()
        
        viewModel.outUser.observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
                self?.viewModel.user = user
                self?.loadData(user: user)
            })
        
        
        viewModel.baseAlert.message.observe(on: MainScheduler.instance)
            .subscribe({ (alert) in
                print("success alert")
            })
    }
    
    
    
    func clickToLbl(){
        self.lblLink.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickLabel))
        self.lblLink.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func clickLabel(sender:Any){
        let url = URL(string: viewModel.user.html_url)!
        webView.load(URLRequest(url: url))
        
    }
    
    override func setUpData() {
        super.setUpData()
        viewModel?.inReload.onNext(())
        
    }
    
    private func loadData(user : User){
//        navigationItem.title = user.login
//        self.ivAvatar.loadUrl(user.avatar_url)
//        self.lblLink.text = user.url
//        self.lblFollower.text =  "\(self.removeDecimal(result: user.followers))"
//        self.lblFollower.textColor = .blue
//        self.lblCreateAt.text = "\(self.cutString(string: user.created_at))"
//        self.lblCreateAt.textColor = .blue
        
    }
}
