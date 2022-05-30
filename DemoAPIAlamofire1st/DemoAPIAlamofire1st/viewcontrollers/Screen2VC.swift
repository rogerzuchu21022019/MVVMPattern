//
//  Screen2VC.swift
//  DemoAPIAlamofire1st
//
//  Created by gcs on 5/26/22.
//

import UIKit
import Alamofire
import AlamofireImage

//var arrComment :[Comment] = [Comment]()
var arrUser :[Users] = [Users]()
class Screen2VC: UIViewController{
    let baseURL = "https://seace.congtydacap.club/api"
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        getAllData()
    }
    func getAllData() {
        
//        AF
//            .request(baseURL+"/users")
//            .validate(statusCode: 200..<300)
//            .responseString(completionHandler: {(str) in print("str \(str)")})
//            .responseDecodable(of: [Comment].self){
//                (response) in
//                switch response.result{
//                case .success(let items) :
//                    arrComment = items
//                    self.myTable.reloadData()
//                case .failure(let items):
//                    print("errors")
//                }
//            }
        
        AF
                  .request(baseURL+"/users")
                  .validate(statusCode: 200..<300)
                  .responseString(completionHandler: {(str) in print("str \(str)")})
                  .responseDecodable(of: [Users].self){
                      (response) in
                      switch response.result{
                      case .success(let items) :
                          arrUser = items
                          self.myTable.reloadData()
                      case .failure(let items):
                          print("errors")
                      }
                  }
              
       
    }
}
extension Screen2VC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cells
        cell.lblAddress.text = arrUser[indexPath.row].address
        cell.lblAge.text = String(arrUser[indexPath.row].age)
        cell.lblJob.text = arrUser[indexPath.row].job
        cell.lblEmail.text = arrUser[indexPath.row].email
        cell.lblFullname.text = arrUser[indexPath.row].fullname
        cell.lblPhone.text = arrUser[indexPath.row].phone
        cell.lblPassword.text = arrUser[indexPath.row].passwords
        cell.lblIdUser.text = String(arrUser[indexPath.row].idUser)
        let urlImage = arrUser[indexPath.row].avatar
            
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
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ok+\(indexPath)")
        let screen3 = storyboard?.instantiateViewController(withIdentifier: "DetailScreenUser") as! DetailScreenUser
        screen3.user = arrUser[indexPath.row]
        
        
        self.navigationController?.pushViewController(screen3, animated: true)
        
    }
}


//cell.lblAddress.text = item.address
//cell.lblAge.text = String(item.age)
//cell.lblJob.text = item.job
//cell.lblEmail.text = item.email
//cell.lblFullname.text = item.fullname
//cell.lblIdUser.text = String(item.idUser)
//let urlImage = item.avatar
