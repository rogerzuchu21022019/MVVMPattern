//
//  DetailScreenUser.swift
//  DemoAPIAlamofire1st
//
//  Created by Vu Thanh Nam on 30/05/2022.
//

import Foundation
import UIKit
class DetailScreenUser: UIViewController {
    
    @IBOutlet weak var ivDetailUser: UIImageView!
    var user:Users?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let queue1 = DispatchQueue(label: "loadImage")
        queue1.async {
            let url = URL(string: self.user!.avatar)
            
            //data
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.ivDetailUser.image = UIImage(data: data)
                }
            } catch  {
                
            }
        }
    }
}
