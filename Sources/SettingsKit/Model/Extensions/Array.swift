//
//  Array.swift
//  SettingsKit
//
//  Created by david-swift on 09.06.24.
//

import SwiftUI

extension Array {

    /// Accesses the element at the specified position safely.
    /// - Parameters:
    ///   - index: The position of the element to access.
    ///
    ///   Access and set elements the safe way:
    ///   ```swift
    ///   var array = ["Hello", "World"]
    ///   print(array[safe: 2] ?? "Out of range")
    ///   ```
    public subscript(safe index: Int?) -> Element? {
        get {
            if let index, checkIndex(index) {
                return self[index]
            }
            return nil
        }
        set {
            if let index, let value = newValue, checkIndex(index) {
                self[index] = value
            }
        }
    }

    /// Check if a given index is valid for the array.
    /// - Parameter index: The index to test.
    /// - Returns: Return whether the index is valid or not.
    private func checkIndex(_ index: Int) -> Bool {
        index < count && index >= 0
    }

}

extension Array where Element: Identifiable {

    /// Accesses the element with a specified identifier safely.
    /// - Parameters:
    ///     - id: The identifier of the element to access.
    public subscript(id id: Element.ID?) -> Element? {
        get {
            let index = getIndex(id: id)
            return self[safe: index]
        }
        set {
            let index = getIndex(id: id)
            self[safe: index] = newValue
        }
    }

    /// Get the index of an element with a specified identifier.
    /// - Parameter id: The element's identifier.
    /// - Returns: The index of the element.
    private func getIndex(id: Element.ID?) -> Int? {
        firstIndex { $0.id == id }
    }

}

extension Array: @retroactive View where Element == ToolbarGroup {

    /// The toolbar.
    public var body: some View {
        let padding = 5.0
        let height = 20.0
        let offset = 2.0
        HStack {
            ForEach(self) { $0 }
                .frame(alignment: .leading)
        }
        .padding(padding)
        .frame(height: height)
        .offset(y: offset)
    }

}
