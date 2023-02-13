//
//  HomeVC.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import UIKit
import RxSwift
class HomeVC:BaseViewController<HomeVM>{
    
    @IBOutlet weak var userTableView: UITableView!
    var url = "https://api.github.com/users"
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.hideBarButton()
        
    }
    
    override func setUpUI() {
        super.setUpUI()
        //        print("user table ")
        userTableView.refreshControl = UIRefreshControl()
    }
    
    
    override func setUpViewModel() {
        viewModel = HomeVM()
        viewModel.saveDB(url: url, view: view)
        
        
        //        if not wake up equal MainScheduler,action occurs at background and refreshControl not observe
        viewModel.baseAlert.loadding.observe(on: MainScheduler.instance)
            .bind(to: (userTableView.refreshControl?.rx.isRefreshing)!)
            .disposed(by: bag)
        
        
        
        viewModel.replayUsers.observe(on: MainScheduler.instance)
            .bind(to:  userTableView.rx.items(cellIdentifier: "Cell", cellType: Cell.self)){
                (indexPath,user,cell) in
                cell.bind(user: user)
            }
        userTableView.rx.modelDeleted(User.self).subscribe(onNext: { [weak self]
            (user:User) in
            self!.viewModel.userManager.userRepository.delete(type: user)
            print("index \(user)")
        })
        //publishSubject
        //        if InternetConnectionManager.shared.isConnectedToInternet(){
        
        ///online use publishSubject
        //            viewModel.outputUsers.observe(on: MainScheduler.instance)
        //                .bind(to: userTableView.rx.items(cellIdentifier: "Cell", cellType: Cell.self)){
        //                    (indexPath,user,cell) in
        //                    cell.bind(user: user)
        //                    print("user table view \(user)")
        //                }
        //        }else{
        //            viewModel.loadUsers(url: url)
        //            viewModel.offUsers.bind(to: userTableView.rx.items(cellIdentifier: "Cell", cellType: Cell.self)){
        //                (indexPath,user,cell) in
        //                cell.bind(user: user)
        //            }.disposed(by: bag)
        
        /// offline use replaySubject
        //            viewModel.replayOff.observe(on: MainScheduler.instance)
        //                .bind(to:  userTableView.rx.items(cellIdentifier: "Cell", cellType: Cell.self)){
        //                    (indexPath,user,cell) in
        //                    cell.bind(user: user)
        //                    print("user table view ")
        //                }
        //        }
        
        
        PersistentStorage.shared.getCoreDataDBPath()
        userTableView.refreshControl!.rx.controlEvent(.valueChanged)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { () in
                self.viewModel.inReload.onNext(())
            })
        
        
        self.userTableView.rx.modelSelected(User.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {
                (user:User) in
                print("success pass users in HomeVC")
                let detailVC = DetailVC.create(user: user)
                self.navigationController?.pushViewController(detailVC, animated: true)
            })
    }
    override func setUpData() {
        super.setUpData()
        viewModel?.inReload.onNext(())
    }
}












//
//
//class HomeVC:BaseViewController<HomeVM>{
//
//    @IBOutlet weak var userTableView: UITableView!
//    var url = "https://api.github.com/users"
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        self.hideBarButton()
//
//    }
//
//    override func setUpUI() {
//       super.setUpUI()
////        print("user table ")
//        userTableView.refreshControl = UIRefreshControl()
//    }
//    override func setUpData() {
//        super.setUpData()
//        viewModel?.inReload.onNext(())
//    }
//    override func setUpViewModel() {
//        viewModel = HomeVM()
//        viewModel.loadUsers(url: url)
//
////        if not wake up equal MainScheduler,action occurs at background and refreshControl not observe
//        viewModel.baseAlert.loadding.observe(on: MainScheduler.instance)
//            .bind(to: (userTableView.refreshControl?.rx.isRefreshing)!)
//            .disposed(by: bag)
//
//      //behaviorReplay
////
////        viewModel.loadData.subscribe().disposed(by: bag)
////        viewModel.outputUsers.bind(to: userTableView.rx.items(cellIdentifier: "Cell",cellType: Cell.self)){
////            (indexthPath, user , cell) in
////            print("user table ")
////            cell.bind(user: user)
////        }
//        //publishSubject
////        viewModel.outputUsers.observe(on: MainScheduler.instance)
////            .bind(to: userTableView.rx.items(cellIdentifier: "Cell", cellType: Cell.self)){
////                (indexPath,user,cell) in
////                cell.bind(user: user)
////                print("user table view \(user)")
////            }
//
//        userTableView.refreshControl!.rx.controlEvent(.valueChanged)
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: { () in
//                self.viewModel.inReload.onNext(())
//            })
//
//
////        //handle item click
////        userTableView.rx.itemSelected
////            .subscribe(onNext: { [weak self] (indexPath:IndexPath) in
////            print("indexPath: \(indexPath)")
////
////          }).disposed(by: bag)
//
//
//
//
//        self.userTableView.rx.modelSelected(User.self)
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: {
//            (user:User) in
//                print("element \(user)")
//
//                let detailVC = DetailVC.create(user: user)
//                self.navigationController?.pushViewController(detailVC, animated: true)
//            })
//    }
//}
