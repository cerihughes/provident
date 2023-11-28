//
//  Created by Ceri Hughes on 19/04/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class RegistryVoidContextTests: XCTestCase {
    private var registry: RegistryImplementation<Int, Void>!

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
        XCTAssertNotNil(try registry.createViewController(token: 1))
    }

    func testRegisterFunctions_oneIsValid() throws {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = try registry.createViewController(token: 1)
        XCTAssertEqual(vc.title, "function 1")
    }

    func testRegisterFunctions_allValid_usesFirstRegistered() throws {
        registry.add(registryFunction: createFunction(limit: 0))
        registry.add(registryFunction: createFunction(limit: 1))

        let vc = try registry.createViewController(token: 0)
        XCTAssertEqual(vc.title, "function 0")
    }

    // MARK: - Test functions

    private func createFunction(limit: Int) -> (Int, Void) -> ViewController? {
        { token, _ in
            guard token <= limit else {
                return nil
            }

            return ViewController(title: "function \(limit)")
        }
    }
}
