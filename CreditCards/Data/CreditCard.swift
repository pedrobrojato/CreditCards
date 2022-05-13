//
//  CreditCard.swift
//  CreditCards
//
//  Created by Pedro Brojato on 02/05/22.
//

import Foundation

struct CreditCard {
    let holderName: String
    let cardNumber: String
    let flag: String
    
    var numberFormated: String {
        return "**** \(cardNumber.suffix(4))"
    }
}
