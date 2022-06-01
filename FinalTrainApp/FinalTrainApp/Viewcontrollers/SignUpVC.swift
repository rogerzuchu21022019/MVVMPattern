//
//  SignUpVC.swift
//  FinalTrainApp
//
//  Created by Vu Thanh Nam on 30/05/2022.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
class SignUpVC: UIViewController {
    var usernameTF: MDCFilledTextField? = nil
    var passwordTF: MDCFilledTextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print("screen sign up did load")
        initView()
        
    }
    func initView()  {
        usernameTF = MDCFilledTextField(frame: CGRect(x: 20, y: 400, width: self.view.frame.width-40, height: 50))
        usernameTF!.label.text = "Username"
        usernameTF!.placeholder = "Username"
        usernameTF!.sizeToFit()
        view.addSubview(usernameTF!)
        
        //MARK: call and use usernameTF to create frame
        passwordTF = MDCFilledTextField(frame: CGRect(x: 20, y: 480, width: self.view.frame.width-40, height: 50))
        passwordTF!.label.text = "Password"
        passwordTF!.placeholder = "Password"
        passwordTF!.sizeToFit()
        view.addSubview(passwordTF!)
    }
    @IBAction func sign_up(_ sender: UIButton) {
        let gotoSignInVC = self.storyboard?.instantiateViewController(withIdentifier: "sign_in") as! SignInVC
        
        self.navigationController?.pushViewController(gotoSignInVC, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("screen sign up will appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("screen sign up will disapear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("screen sign up did appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("screen sign up did disappear")
    }

}
