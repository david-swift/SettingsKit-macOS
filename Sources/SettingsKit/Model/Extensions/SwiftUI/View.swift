//
//  View.swift
//  SettingsKit
//
//  Created by david-swift on 17.09.2023.
//

import SwiftUI

extension View {

    /// Get the view as an icon for the sidebar settings.
    public func sidebarSettingsIcon(color: Color) -> some View {
        let cornerRadius = 5.0
        let shadowRadius = 0.5
        let sideLength = 23.0
        let iconShadowRadius = 4.0
        let iconPadding = 4.0
        let rect = RoundedRectangle(cornerRadius: cornerRadius)
            .shadow(radius: shadowRadius)
            .aspectRatio(contentMode: .fit)
            .frame(width: sideLength, height: sideLength)
        @ViewBuilder var view: some View {
            if #available(macOS 13, *) {
                rect.foregroundStyle(color.gradient)
            } else {
                rect.foregroundStyle(color)
            }
        }
        return view.overlay {
            font(.body.bold())
                .symbolVariant(.fill)
                .foregroundStyle(.white)
                .shadow(radius: iconShadowRadius)
                .padding(iconPadding)
        }
    }

}
