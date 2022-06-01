//
//  Service.swift
//  DemoAPIAlamofire1st
//
//  Created by gcs on 5/26/22.
//

import UIKit
import Alamofire

class Service {
    // http://seace.congtydacap.club/api/comments
    // https://restcountries.com/v3.1
    fileprivate var baseUrl = ""
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
}
extension Service{
    //MARK1:- getAllCountriesNameFrom
    func getAllCountriesNameFrom(endPoint:String) {
        // create request
//        let request = AF.request(self.baseUrl+endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
//        // get respone from network
//        let response = request.response {
//            (responseSuccessfull) in
//            //MARK2:
//            guard let data = responseSuccessfull.data else{ return }
//            do{
//                let comments = try JSONDecoder().decode([Comment].self, from: data)
//                print("comments == \(comments)")
//            }catch{
//                print("errors")
//            }
//        }
    }
}
