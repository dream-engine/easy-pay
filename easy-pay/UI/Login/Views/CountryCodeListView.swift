//
//  CountryCodeListView.swift
//  easy-pay
//
//  Created by Mohit Kumar Singh on 10/07/23.
//

import SwiftUI

struct CountryCodeListView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    var body: some View {
        List(NSLocale.isoCountryCodes, id: \.self) { countryCode in
            
            Button {
                self.loginViewModel.selectedCountryCode = countryCode
                self.loginViewModel.showCountryCodeList = false
            } label: {
                HStack {
                    Text(self.loginViewModel.getFlag(forCountryCode: countryCode))
                    Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
                    Spacer()
                    Text(countryCode)
                }
            }

            
        }
    }
}

struct CountryCodeListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCodeListView(loginViewModel: LoginViewModel())
    }
}
