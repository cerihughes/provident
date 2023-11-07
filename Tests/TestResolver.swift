//
//  Created by Ceri Hughes on 02/12/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation
import Provident

class TestResolver: Resolver {
    typealias T = String
    typealias C = Void

    private let testServiceProviderFunctions: [ServiceProviderFunction]
    private let testViewControllerProviderFunctions: [ViewControllerProviderFunction<T, C>]

    init(
        testServiceProviderFunctions: [ServiceProviderFunction],
        testViewControllerProviderFunctions: [ViewControllerProviderFunction<T, C>]
    ) {
        self.testServiceProviderFunctions = testServiceProviderFunctions
        self.testViewControllerProviderFunctions = testViewControllerProviderFunctions
    }

    func serviceProviderFunctions() -> [ServiceProviderFunction] {
        testServiceProviderFunctions
    }

    func viewControllerProviderFunctions() -> [ViewControllerProviderFunction<T, C>] {
        testViewControllerProviderFunctions
    }
}
