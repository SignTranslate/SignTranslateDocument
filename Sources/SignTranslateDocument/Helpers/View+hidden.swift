//
//  View+hidden.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//

import SwiftUI
extension View {
    @ViewBuilder
    func isHidden(_ shouldHide: Bool, remove:Bool = true) -> some View {
        if !shouldHide {
            self
        } else {
            if remove == true{
            } else {
                self
            }
        }
    }
}
