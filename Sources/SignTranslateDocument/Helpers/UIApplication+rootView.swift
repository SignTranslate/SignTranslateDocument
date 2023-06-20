//
//  UIApplication+rootView.swift
//  SignTranslate
//
//  Created by Mac on 30.05.2023.
//

import UIKit
 import SwiftUI

 extension UIApplication {

     public func rootController() -> UIViewController {
         guard let window = connectedScenes.first as? UIWindowScene else { return .init() }
         guard let viewController = window.windows.last?.rootViewController else { return .init() }

         return viewController
     }
 }
