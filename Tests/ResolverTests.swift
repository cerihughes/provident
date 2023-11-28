//
//  Created by Ceri Hughes on 23/07/2023.
//  Copyright © 2023 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class ResolverTests: XCTestCase {

    /// Tests a Resolver implementation that uses the default serviceProviderFunctions and
    /// viewControllerProviderFunctions implementations
    func testBareMinResolver() throws {
        let registrar = Registrar<String, Void>()
        registrar.resolve(resolver: ResolverForTesting())

        XCTAssertThrowsError(try registrar.registry.createViewController(token: "testBareMinResolver"))
    }
}

private class ResolverForTesting: Resolver {
    typealias T = String
    typealias C = Void

    func viewControllerProviderFunctions() -> [Provident.ViewControllerProviderFunction<String, Void>] { [] }
}
