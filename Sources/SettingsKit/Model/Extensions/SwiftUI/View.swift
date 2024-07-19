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
                rect.foregroundColor(color)
            }
        }
        return ZStack {
            view
            let font = font(.body.bold())
                .foregroundColor(.white)
                .shadow(radius: iconShadowRadius)
                .padding(iconPadding)
            if #available(macOS 12, *) {
                font.symbolVariant(.fill)
            } else {
                font
            }
        }
    }

    /// Style a view to fit into the custom toolbar.
    /// - Parameter visible: The visibility of the background.
    /// - Returns: The view with the background if visible is true, otherwise the view.
    public func customToolbarBackground(visible: Bool) -> some View {
        let opacity = 0.05
        let cornerRadius = 10.0
        return VStack {
            self
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.secondary.opacity(visible ? opacity : 0))
        }
    }

    /// Modifies the view for a custom toolbar item.
    /// - Parameter padding: The horizontal padding of the item.
    /// - Returns: A view containing the item.
    internal func customToolbarItem(padding: Edge.Set) -> some View {
        let sideLength = 20.0
        let paddingValue = 5.0
        return frame(width: sideLength, height: sideLength)
            .labelStyle(.iconOnly)
            .padding([.vertical, padding], paddingValue)
            .buttonStyle(.plain)
            .contentShape(Rectangle())
    }

}
