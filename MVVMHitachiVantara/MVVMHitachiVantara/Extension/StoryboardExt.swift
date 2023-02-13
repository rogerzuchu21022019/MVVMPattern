//
//  StoryboardExt.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import UIKit


extension UIViewController{
    static func createInstantiate(nameStoryboard:String,withIdentifier:String)->UIViewController{
        let storyboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        let gotoNextStoryboard = storyboard.instantiateViewController(withIdentifier: withIdentifier) 
        return gotoNextStoryboard
    }
    
    
    func hideBarButton(){
        self.navigationItem.hidesBackButton = true
    }
    func alert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func alert(message: String, title:String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func removeDecimal(result: Double) -> String {
        let value = String(format: "%g", result)
        return value
    }
    
    func cutString(string:String) -> String {
        if string.isEmpty == false {
            let start = string.index(string.startIndex,offsetBy: 0)
            let end = string.index(string.endIndex,offsetBy: -16)
            let result = String(string[start..<end])
            return result
        }
        return "null"
    }
    
    
    
    
    

}

