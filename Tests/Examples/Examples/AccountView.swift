//
//  AccountView.swift
//  SettingsKit
//
//  Created by david-swift on 17.09.2023.
//

import SwiftUI

/// The settings test view for accounts.
struct AccountView: View {

    /// The account number.
    var account: Int

    // swiftlint:disable no_magic_numbers
    /// The view's body.
    var body: some View {
        VStack(alignment: .center) {
            Image(systemSymbol: .personFill)
                .font(.system(size: 100))
                .bold()
                .foregroundStyle(.white)
                .shadow(radius: 20)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.blue.gradient)
                        .shadow(radius: 10)
                        .aspectRatio(contentMode: .fit)
                }
                .accessibilityHidden(true)
            Text("Account \(account + 1)")
                .font(.title)
                .bold()
                .padding()
        }
    }
    // swiftlint:enable no_magic_numbers

}

#Preview {
    AccountView(account: 0)
}
