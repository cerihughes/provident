//
//  SampleResolver.swift
//  SampleApp
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Provident
import UIKit

class SampleResolver: Resolver {
    typealias T = Navigation
    typealias C = Void

    func serviceProviderFunctions() -> [ServiceProviderFunction] {
        [
            SampleServiceProvider.init(context:)
        ]
    }

    func viewControllerProviderFunctions() -> [ViewControllerProviderFunction<T, C>] {
        [
            LoginViewControllerProvider.init,
            LogoutViewControllerProvider.init,
            ErrorViewControllerProvider.init
        ]
    }
}
