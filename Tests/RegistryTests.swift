//
//  Created by Ceri Hughes on 03/05/2019.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class RegistryTests: XCTestCase {
    private var registry: RegistryImplementation<Int, String?>!

    override func setUp() {
        super.setUp()

        registry = RegistryImplementation()
    }

    override func tearDown() {
        registry = nil

        super.tearDown()
    }

    func testRegisterFunction() {
        registry.add(registryFunction: createFunction(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1))
    }

    func testRegisterFunction_providingContext() {
        registry.add(registryFunction: createFunction(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1, context: "Things"))
    }

    func testRegisterFunctionWithContext() {
        registry.add(registryFunction: createFunction(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1, context: "Things"))
    }

    func testRegisterFunctionWithContext_withoutProvidingContext() {
        registry.add(registryFunction: createFunction(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1))
    }

    func testRegisterFunctions_oneIsValid() {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 1)
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "function 1")
    }

    func testRegisterFunctionWithContext_oneIsValid() {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 1, context: "Things")
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "functionWithContext 1:Things")
    }

    func testRegisterFunctions_allValid_usesFirstRegistered() {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 0)
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "function 0")
    }

    func testRegisterFunctionsWithContext_allValid_usesFirstRegistered() {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "functionWithContext 0:Things")
    }

    func testRegisterMixedFunctions_functionsWithContextsReturnFirst() {
        registry.add(registryFunction: createFunction(limit: 0))

        let vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "functionWithContext 0:Things")
    }

    func testRegisterMixedFunctions_allValid_usesFirstRegistered() {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "functionWithContext 0:Things")
    }

    // MARK: - Test functions

    private func createFunction(limit: Int) -> (Int, String?) -> ViewController? {
        { token, context in
            guard token <= limit else {
                return nil
            }

            let title: String
            if let context {
                title = "functionWithContext \(limit):\(context)"
            } else {
                title = "function \(limit)"
            }

            return ViewController(title: title)
        }
    }
}
