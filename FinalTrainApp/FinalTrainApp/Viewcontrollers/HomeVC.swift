//
//  HomeVC.swift
//  FinalTrainApp
//
//  Created by Vu Thanh Nam on 30/05/2022.
//

import UIKit
import CoreData
import Alamofire
import AlamofireImage

class HomeVC: UIViewController {
    
    //MARK: initital array User
    var arrUser:[User] = [User]()
    let baseURL = "https://api.github.com/users"
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("screen home did load")
        initBarItem()
        myTable.delegate = self
        myTable.dataSource = self
        getAllData()
    }
    
    // MARK: load data of users from api , assign items to arrUser  and reload data of table
    func getAllData(){
        
        let queue1 = DispatchQueue(label: "loadData")
        queue1.async { AF
            .request(self.baseURL)
                          .validate(statusCode: 200..<300)
                          .responseDecodable(of: [User].self){
                              (response) in
                              switch response.result{
                              case .success(let items) :
                                  self.arrUser = items
                                  self.myTable.reloadData()
                              case .failure(_):
                                  print("errors")
                              }
                          }
        }
        
        
    }
    
    //MARK: hide back button on toolbar and initial label SignOut
    func initBarItem(){
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(gotoSignIn))
    }
    
    //MARK: create #selector object for event of right bar button
    @objc func gotoSignIn(){
        UserDefaults.standard.removeObject(forKey: "SignIn")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("screen home will didsappear")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("screen home will appear")
        getAllData()
    }
    override func viewDidAppear(_ animated: Bool) {
        print("screen home did appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("screen home did didsappear")
    }
}

extension HomeVC : UITableViewDelegate,UITableViewDataSource {
    
    // MARK: count row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
    // MARK: Assign and load data to table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell") as! UserCells
        cell.lblLogin.text = "\(arrUser[indexPath.row].login.firstUppercased)"
        let urlImage = arrUser[indexPath.row].avatar_url
        let queue = DispatchQueue(label: "load Image")
        queue.async {
            AF
                .request(urlImage)
                .responseImage {
                    (response) in
                    if let image = response.value {
                        DispatchQueue.main.async{
                            cell.ivAvatar.image = image
                        }
                    }
                }
        }
        
        
        return cell
    }
    //MARK: swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.myTable.beginUpdates()
        self.myTable.deleteRows(at: [indexPath], with: .right)
        self.myTable.endUpdates()
    }
    // MARK: did tap to row of table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gotoDetail = self.storyboard?.instantiateViewController(withIdentifier: "detail_vc") as! DetailUserVC
        let user = arrUser[indexPath.row]
        gotoDetail.user = user
        
        self.navigationController?.pushViewController(gotoDetail, animated: true)
    }
}

//MARK: process to upercase first character
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 30
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
