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
    
    init() {}
    
    func didTapLoginButton() {
        // Call API
    }
    
}
