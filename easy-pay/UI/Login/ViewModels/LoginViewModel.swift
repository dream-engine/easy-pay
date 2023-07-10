//
//  LoginViewModel.swift
//  easy-pay
//
//  Created by Mohit Kumar Singh on 10/07/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var phone: String = ""
    @Published var password: String = ""
    
    @Published var defaultCountryCode: String = "IN"
    
    init() {}
    
    func didTapLoginButton() {
        // Call API
    }
    
    func getCountryCodes() {
        let countryCodes = NSLocale.isoCountryCodes
        print(countryCodes)
    }
    
    
    func getFlag() -> String {
        return String(String.UnicodeScalarView(self.defaultCountryCode.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
          }))
    }
    
}
