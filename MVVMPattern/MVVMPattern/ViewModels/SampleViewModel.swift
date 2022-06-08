//
//  SampleViewModel.swift
//  MVVMPattern
//
//  Created by gcs on 6/8/22.
//

import Foundation

//MARK: Flow
//MARK: 1 import Bond to use Observable
import Bond

//MARK: 4 import Alamofire to call api
import Alamofire

class SampleViewModel{
    //MARK: 2 Declare isOn property to solve data
    //MARK: 3 go to the ViewController
    var isOn : Observable  <Bool> = Observable(true)
    //MARK: 5 Begin call api with Alamofire
    func callAPI() {
        var url = "https://httpbin.org/get"
        AF
            .request(url)
            .response {
                (response:AFDataResponse<Data?>) in
                switch response.result {
                case .success(_) :
                    print("success")
                    self.isOn.value = !self.isOn.value
                    break
                case .failure(let error) :
                    print("error")
                    break
                }
            }
    }
}
