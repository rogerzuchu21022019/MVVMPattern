//
//  StringExt.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 24/06/2022.
//

import Foundation
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
