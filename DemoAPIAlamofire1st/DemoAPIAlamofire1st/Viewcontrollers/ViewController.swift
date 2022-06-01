//
//  ViewController.swift
//  DemoAPIAlamofire1st
//
//  Created by gcs on 5/26/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func Next(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen2 = storyboard.instantiateViewController(identifier: "Screen2VC") as! Screen2VC
        self.navigationController?.pushViewController(screen2, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let service = Service(baseUrl: "https://seace.congtydacap.club/api/").getAllCountriesNameFrom(endPoint: "comments")
//        
//        
        
    }
    
    
}

