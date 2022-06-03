//
//  MainVC.swift
//  HandleAutolayout
//
//  Created by Vu Thanh Nam on 03/06/2022.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    //Step1 : initial view
    lazy var greenBox = UIView()
    lazy var yellowBox = UIView()
    lazy var blueBox = UIView()
    lazy var blackBox = UIView()
    
    lazy var btnNext = UIButton()
    lazy var label = UITextField(frame: CGRect(x: 10, y: 120, width: 30, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationController?.navigationBar.center = self.view.center
        initBlackBox()
        initGreenBox()
        initBlueBox()
        initYellowBox()
        initLabel()
        initBtnNext()
//        initBtnNext2()
        
    }
    
    func initBtnNext(){
        btnNext.backgroundColor = .brown
        btnNext.addTarget(self, action: #selector(clickTest), for: .touchUpInside)
        btnNext.setTitle("Next", for: .normal)
        btnNext.setTitleColor(.blue, for: .normal)
        btnNext.frame = CGRect(x: 15,y: -50,width: 300,height: 500)
        self.view.addSubview(btnNext)
        self.initViewCase2(box: btnNext, view: self.blueBox, numberAdd: 70, numberSub: -100)
        
    }
    func initBtnNext2(){
        btnNext.backgroundColor = .lightGray
        btnNext.addTarget(self, action: #selector(clickTest), for: .touchUpInside)
        btnNext.setTitle("Go", for: .normal)
        btnNext.setTitleColor(.blue, for: .normal)
        btnNext.frame = CGRect(x: 15,y: -50,width: 20  ,height: 50)
        self.view.addSubview(btnNext)
        self.initViewCase3(box: btnNext, view: self.blueBox, numberAdd: 0, numberSub: 0)
        
    }
    
    
    
    @objc func clickTest(sender:UIButton){
        print("pressed")
        let secondVC = SecondVC()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func initBlackBox(){
        blackBox.backgroundColor = .black
        self.view.addSubview(blackBox)
        self.initView(box: blackBox,view: self.view,bot: -120,right: -120,left: 120,top: 120)
    }
    
    func initBlueBox(){
        blueBox.backgroundColor = .blue
        blueBox.layer.cornerRadius = 40
        self.view.addSubview(blueBox)
        self.initView(box: blueBox,view: self.view,bot: -20,right: -120,left: 10,top: 10)
    }
    
    func initYellowBox(){
        yellowBox.backgroundColor = .yellow
        self.view.addSubview(yellowBox)
        self.initView(box: yellowBox,view: self.greenBox,bot: 0,right: 0,left:80,top: 80)
    }
    
    func initGreenBox(){
        greenBox.backgroundColor = .green
        self.view.addSubview(greenBox)
        self.initView(box: greenBox,view: self.view,bot: -40,right: -20,left: 20,top: 20)
    }
    
    func initLabel(){
        label.text = "Haha"
        label.placeholder = "Con ga"
        label.textColor = .red
        label.backgroundColor = .white
        self.view.addSubview(label)
        self.initView(box: label, view: self.blackBox, bot: -60, right: 0, left: 10, top: 120)
    }
}


extension UIViewController{
    func initView(box:UIView,view:UIView,bot:Int,right:Int,left:Int,top:Int){
        box.snp.makeConstraints { (make)->Void in
            make.bottom.equalTo(view).offset(bot).labeled("\(box.layer.name) + botContrainst")
            make.right.equalTo(view).offset(right).labeled("\(box.layer.name) + rightContrainst")
            make.left.equalTo(view).offset(left).labeled("\(box.layer.name) + leftContrainst")
            make.top.equalTo(view).offset(top).labeled("\(box.layer.name) + topContrainst")
        }
    }
    
    //MARK: set 2 thuộc tính 1 lúc + margin luôn
    func initViewCase2(box:UIView,view:UIView,numberAdd:Int,numberSub:Int){
        box.snp.makeConstraints { (make)->Void in
            make.bottomMargin.right.equalTo(numberSub).labeled("\(box.layer.name) + botRightContrainst")
            make.top.leftMargin.equalTo(numberAdd).labeled("\(box.layer.name) + topLeftContrainst")
        }
    }
    
    func initViewCase3(box:UIView,view:UIView,numberAdd:Int,numberSub:Int){
        box.snp.remakeConstraints { (make)->Void in
            make.top.equalToSuperview().offset(500)
            make.bottom.trailing.equalToSuperview().offset(-300).labeled("\(box.layer.name)+botTrailing")
            make.right.trailing.equalToSuperview().offset(-40)
        }
    }
}
