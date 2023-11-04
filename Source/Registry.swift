//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

/// A registry that looks up view controllers for a given Token <T>. This token should be a type that is able to
/// uniquely identify any VC, and also provide any data that the VC needs to be constructed.
///
/// The registry works by registering a number of functions. To retrieve a VC, the Token is passed into all
/// registered functions along with an optional Context <C>. The context isn't "optional" in the traditional (C?)
/// sense - instead there are 2 creation functions - 1 that uses C, and one that doesn't. The 1st non-nil VC that comes
/// back is used as the return value.
///
/// Note that registrants should make sure they don't "overlap" - if more than 1 registrant could potentially return a
/// VC for the same token, functions that register with a context will return first, and if there are still multiple,
/// the function that was registered first will return first.
open class Registry<T, C> {
    typealias RegistryFunction = (T, C) -> ViewController?

    private var functions = [RegistryFunction]()

    public init() {}

    func add(registryFunction: @escaping RegistryFunction) {
        functions.append(registryFunction)
    }

    func reset() {
        functions.removeAll()
    }

    public func createViewController(from token: T, context: C) -> ViewController? {
        for function in functions {
            if let result = function(token, context) {
                return result
            }
        }

        return nil
    }
}

public extension Registry {
    func createViewController<Wrapped>(from token: T) -> ViewController? where C == Wrapped? {
        createViewController(from: token, context: nil)
    }
}

public extension Registry where C == Void {
    func createViewController(from token: T) -> ViewController? {
        createViewController(from: token, context: ())
    }
}
