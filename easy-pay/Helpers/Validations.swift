//
//  Validations.swift
//  easy-pay
//
//  Created by Mohit Kumar Singh on 10/07/23.
//

import Foundation

extension String {
    var isValidPhone: Bool {
        return self.count >= 10
    }
    
    var isValidPassword: Bool {
        return self.count >= 5
    }
}
