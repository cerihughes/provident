//
//  SwiftUIViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import SwiftUI

class SwiftUIViewControllerProvider: SampleViewControllerProvider {
    override final func createViewController(token: Navigation, context: Void) -> ViewController? {
        guard let view = createView(token: token, context: context) else {
            return nil
        }
        return UIHostingController(rootView: view)
    }

    func createView(token: Navigation, context: Void) -> AnyView? {
        nil
    }
}
