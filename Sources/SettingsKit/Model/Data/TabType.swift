//
//  TabType.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import SFSafeSymbols
import SwiftUI

/// The type of a settings tab or subtab.
public enum TabType {

    /// A new settings tab or subtab with a label.
    case new(title: String, icon: SFSymbol)
    /// An extension for an existing settings tab or subtab.
    case extend(id: String)
    /// A settings subtab that is selected if nothing else is selected, or a hidden settings tab.
    case noSelection

    /// Whether the tab type is ``noSelection``.
    var isNoSelection: Bool {
        switch self {
        case .noSelection:
            return true
        default:
            return false
        }
    }

}
