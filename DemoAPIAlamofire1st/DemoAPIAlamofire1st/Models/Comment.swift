//
//  Country.swift
//  DemoAPIAlamofire1st
//
//  Created by gcs on 5/26/22.
//

import Foundation
//
//struct Country : Decodable {
//    var name:String?
//    var capital:String?
//    var countryCode:String?
//
//    enum CodeKeys : String,CodingKey {
//        case name = "name"
//        case capital = "capital"
//        case countryCode = "alpha3Code"
//    }
//}
struct Comment : Decodable {
    var contentComment:String
    var idPost:Int
    var idUser:String
    
    enum CodeKeys : String,CodingKey {
        case contentComment = "contentComment"
        case idPost = "idPost"
        case idUser = "idUser"
    }
}
