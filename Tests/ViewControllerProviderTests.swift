//
//  Created by Ceri Hughes on 23/07/2023.
//  Copyright © 2023 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class ViewControllerProviderTests: XCTestCase {

    /// Tests a ViewControllerProvider implementation that uses the default register(with:) and configure(with:)
    /// implementations
    func testBareMinViewControllerProvider() {
        let registrar = Registrar<String, Void>()
        registrar.resolve(resolver: ResolverForTesting())

        let viewController = registrar.registry.createViewController(from: "testBareMinViewControllerProvider")
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.title, "testBareMinViewControllerProvider")
    }
}

private class ViewControllerProviderForTesting: ViewControllerProvider {
    func createViewController(token: String, context: Void) -> ViewController? {
        ViewController(title: token)
    }
}

private class ResolverForTesting: Resolver {
    typealias T = String
    typealias C = Void

    func viewControllerProviderFunctions() -> [ViewControllerProviderFunction<T, C>] {
        [
            ViewControllerProviderForTesting.init
        ]
    }
}
