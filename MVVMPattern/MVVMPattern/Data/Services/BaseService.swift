//
//  APIServices.swift
//  MVVMPattern
//
//  Created by Vu Thanh Nam on 10/06/2022.
//

import Foundation
import Alamofire
import NVActivityIndicatorView
import RxSwift

//
typealias GetResult<T> = (Result<T,APIError>) -> Void


class ConnectActivity{
    class func isConnectedToInternet()->Bool{
        return ((NetworkReachabilityManager()?.isReachable) != nil)
    }
}
class BaseService{
    //singleton
    static var shared = BaseService()
    let queue = DispatchQueue(label: "BaseService.Network.Queue")
    
    private var baseUrl = "https://seace.congtydacap.club/api"
    private let header:HTTPHeaders = ["Accept": "application/json"]
    
    
    //get modthod
    func get<T:Codable>(path:String,parametter:[String:Any]?,completion: GetResult<T>?) -> Observable<T>{
        return request(path: path,method: .get, completion: completion!)
    }
    func post<T:Codable>(path:String,parametter:[String:Any]?,completion: GetResult<T>?) ->Observable<T>{
        return request(path: path, method: .post, completion: completion!)
    }
    

    func request<T:Codable>(path:String,method:HTTPMethod,completion:@escaping GetResult<T>) -> Observable<T>{
        let url = "\(baseUrl)/\(path)"
        return Observable.create{[weak self] observer in
            let request = AF
                .request(url,method: method,headers: self?.header)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self,queue: self!.queue){ (response:AFDataResponse<T>)->() in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data)
                        observer.onCompleted()
                        completion(.success(data))
                    case .failure(_):
                        completion(.failure(.error))
                    }
                }
            return Disposables.create{
                request.cancel()
            }
        }
    }
}

enum APIError : Error{
case error
    case errorURL
    case errorInvalid

}
