//
//  DetailUserVC.swift
//  FinalTrainApp
//
//  Created by Vu Thanh Nam on 30/05/2022.
//

import UIKit
import Alamofire
import AlamofireImage
import CoreData
import WebKit
class DetailUserVC: UIViewController {
    
    //MARK: initial user for receive data from HomeVC
    var user:User!
    
    //MARK: assign
    @IBOutlet weak var lblGithub: UILabel!
    @IBOutlet weak var lblCreateAt: UILabel!
    @IBOutlet weak var webGithub: WKWebView!
    @IBOutlet weak var lblFollower: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("screen detail did load")
        loadImage()
        getAllData()
        clickToLbl()
    }
    
    //MARK: receive dat and load image passed from HomeVC
    func loadImage(){
        self.ivAvatar.applyshadowWithCorner(containerView: ivAvatar, cornerRadious: 40)
        let queue1 = DispatchQueue(label: "loadImage")
        queue1.async {
            let url = URL(string: self.user.avatar_url)
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.ivAvatar.image = UIImage(data: data)
                    self.lblGithub.text = "Github: \(self.user.html_url)"
                    self.lblGithub.textColor = .blue
                }
            } catch  {
                
            }
        }
    }
    
    //MARK: initial gesture to click on outlet
    func clickToLbl(){
        lblGithub.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickLabel))
        lblGithub.addGestureRecognizer(gestureRecognizer)
    }
    
    //MARK: click on label and web browser appear
    @objc func clickLabel(sender:Any){
        let url = URL(string: user.html_url)!
        webGithub.load(URLRequest(url: url))
    }
    
    
    //MARK: request url that passed to user and load data from api,
    func getAllData(){
        AF
            .request(self.user!.url)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: User.self ){
                (response) in
                switch response.result{
                case .success(let items):
                    self.user = items
                    self.lblFollower.text = "Follower:  \(self.removeDecimal(result: self.user.followers!))"
                    self.lblFollower.textColor = .white
                    //MARK: cut string to get year
                    let string = self.user.created_at!
                    let start = string.index(string.startIndex,offsetBy: 0)
                    let end = string.index(string.endIndex,offsetBy: -16)
                    let result = string[start..<end]
                    self.lblCreateAt.text = "Since:  \(result)"
                    self.lblCreateAt.textColor = .white
                case .failure(let error):
                    print("failure \(error)")
                }
            }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("screen detail will appear")
        loadImage()
        getAllData()
    }
    override func viewDidAppear(_ animated: Bool) {
        print("screen detail did appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("screen detail did didsappear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("screen detail will didsappear")
    }
    
    
    //MARK: remove Decimal of Double
    func removeDecimal(result: Double) -> String {
            let value = String(format: "%g", result)
            return value
    }
}
