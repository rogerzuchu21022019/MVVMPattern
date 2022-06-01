//
//  SignInVC.swift
//  FinalTrainApp
//
//  Created by Vu Thanh Nam on 30/05/2022.
//

import UIKit
import UserNotifications
import MaterialComponents.MaterialTextControls_FilledTextFields


class SignInVC: UIViewController,UNUserNotificationCenterDelegate {
    //MARK: initial textfield outline
    var usernameTF:MDCFilledTextField? = nil
    var passwordTF:MDCFilledTextField? = nil
    let centerNotifications = UNUserNotificationCenter.current()
    @IBAction func sign_up(_ sender: UIButton) {
        let gotoSignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "sign_up") as! SignUpVC
        self.navigationController?.pushViewController(gotoSignUpVC, animated: true)
    }
    @IBAction func sign_in(_ sender: UIButton) {
        //MARK: 1 Check username and password if equal ->
        let username = usernameTF!.text
        let password = passwordTF!.text
        if username == "Admin" && password == "Admin"{
            //MARK: -> 2 save for UserDefaults with key SignIn and go to homescreen
            UserDefaults.standard.set(true, forKey: "SignIn")
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password,forKey: "password")
            
            let gotoHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "home_vc") as! HomeVC
            initNotifications()
            self.navigationController?.pushViewController(gotoHomeVC, animated: true)
            //MARK: 3 Show notification for sign in
            
        }else{
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        centerNotifications.delegate = self
        print("screen sign in did load")
        initView()
        initNotifications()
        isSignedIn()
    }
    
    
    //MARK: check admin signed in or not. if signed in go straight to homescreen and not sign in again.
    func isSignedIn(){
        if UserDefaults.standard.bool(forKey: "SignIn") == true {
            let gotoHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "home_vc") as! HomeVC
            self.navigationController?.pushViewController(gotoHomeVC, animated: true)
        }else{
            let username = UserDefaults.standard.string(forKey: "username")
            let password = UserDefaults.standard.string(forKey: "password")
            usernameTF!.text = username
            passwordTF!.text = password
            let alert = UIAlertController(title: "Alert", message: "Choose", preferredStyle: .actionSheet)
                    let actionAgree1 = UIAlertAction(title: "Agree1", style: .default){(action) in
                        self.usernameTF!.text = "Agree"
                    }
                    let actionAgree2 = UIAlertAction(title: "Agree2", style: .default){(action) in
                        self.usernameTF!.text = "Agree"
                    }
                    
                    let actionCancel = UIAlertAction(title: "Cancel", style: .cancel){
                        (action) in
                        self.usernameTF!.text = "Cancel"
                    }
                    alert.addAction(actionAgree1)
                    alert.addAction(actionAgree2)
                    alert.addAction(actionCancel)
            
        }
        
    }
    
    func initNotifications(){
            //MARK: request permission to show notification
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){
                (success,error) in
            }
            let content = UNMutableNotificationContent()
            content.title = "Notifications Sign In"
            content.body = "Hi Admin,You Signed in"
            content.sound = .default
            content.badge = 2
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
            let request = UNNotificationRequest(identifier: "Notification ", content: content, trigger:trigger )
            centerNotifications.add(request) {
                (error) in
                print("\(error?.localizedDescription)")
            }
        }
    
    func initView(){
        //MARK: hide bar item
        self.navigationItem.hidesBackButton = true
        //MARK: call and use usernameTF to create frame
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
    override func viewWillDisappear(_ animated: Bool) {
        print("screen sign in will didsapear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("screen sign in will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("screen sign in did appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("screen sign in did didsapear")
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
}


