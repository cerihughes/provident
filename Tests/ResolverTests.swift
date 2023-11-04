//
//  Created by Ceri Hughes on 23/07/2023.
//  Copyright © 2023 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class ResolverTests: XCTestCase {

    /// Tests a Resolver implementation that uses the default serviceProviderFunctions and
    /// viewControllerProviderFunctions implementations
    func testBareMinResolver() {
        let registry = Registry<String, Void>()
        let registrar = Registrar(registry: registry)
        registrar.resolve(resolver: ResolverForTesting())

        let viewController = registry.createViewController(from: "testBareMinResolver")
        XCTAssertNil(viewController)
    }
}

private class ResolverForTesting: Resolver {
    typealias T = String
    typealias C = Void
}
