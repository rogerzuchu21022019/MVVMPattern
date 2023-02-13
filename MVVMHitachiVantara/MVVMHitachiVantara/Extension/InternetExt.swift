//
//  InternetExt.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 19/06/2022.
//

import Foundation
import Alamofire

public class InternetConnectionManager {
    
    static var shared = InternetConnectionManager()
    private init() {
    }
    
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
