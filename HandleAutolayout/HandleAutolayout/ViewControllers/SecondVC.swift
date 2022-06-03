//
//  SecondVC.swift
//  HandleAutolayout
//
//  Created by Vu Thanh Nam on 03/06/2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields

class SecondVC: UIViewController {
    
    let usernameTF:MDCFilledTextField?=nil
    let passwordTF:MDCFilledTextField?=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        initTextField(textfield: usernameTF, text: "Username", placeholder: "Username",percent: 3)
        initTextField(textfield: passwordTF, text: "Password", placeholder: "Password",percent: 6)
        
    }
    func initView(){
        
       
    }
    
}
extension UIViewController{
    func initTextField(textfield: MDCFilledTextField!,text:String,placeholder:String,percent:Int) {
        var textfield = textfield
        textfield = MDCFilledTextField(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width-40), height: 50))
        textfield!.label.text = text
        textfield!.placeholder = placeholder
        textfield!.sizeToFit()
        view.addSubview(textfield!)
      
        
    }
    func initViewCase3(box:UIView,view:UIView,topADD:Int,botSub:Int,rightSub:Int){
        box.snp.makeConstraints { (make)->Void in
            make.top.equalToSuperview().offset(topADD)
            make.bottom.trailing.equalToSuperview().offset(botSub).labeled("\(box.layer.name)+botTrailing")
            make.right.equalToSuperview().offset(rightSub)
        }
    }
}
