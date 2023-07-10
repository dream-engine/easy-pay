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
    
    @Published var selectedCountryCode: String = "IN"
    
    @Published var showCountryCodeList: Bool = false
    
    init() {}
    
    func didTapLoginButton() {
        // Call API
    }
    
    func getCountryCodes() {
        let countryCodes = NSLocale.isoCountryCodes
        print(countryCodes)
    }
    
    
    func getSelectedFlag() -> String {
        return String(String.UnicodeScalarView(self.selectedCountryCode.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
          }))
    }
    
    func getFlag(forCountryCode code: String) -> String {
        return String(String.UnicodeScalarView(code.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
          }))
    }
    
}
