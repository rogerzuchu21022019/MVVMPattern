//
//  ViewController.swift
//  HandleAutolayout
//
//  Created by Vu Thanh Nam on 02/06/2022.
//

import UIKit
import Log4swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView1()
//        initView2()
    }

    func initView1() {
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        let logger = Logger.getLogger("test.logger");
        let stdOutAppender = StdOutAppender("console");
        let fileAppender = FileAppender(identifier: "errorFile", filePath: "/var/log/error.log");
        stdOutAppender.thresholdLevel = .Debug;
        fileAppender.thresholdLevel = .Error;
        logger.appenders = [stdOutAppender, fileAppender];
        logger.debug ("This message will go to the console");
        logger.error ("This message will go to the console and the error log file");
    }
    
    func initView2() {
        let redView = UIView(frame: CGRect(x: 20, y: 120, width: 300, height: 100))
        redView.backgroundColor = .blue
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = true
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

