//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

public typealias ServiceProviderFunction = (ServiceProviderCreationContext) -> ServiceProvider
public typealias ViewControllerProviderFunction<T, C> = () -> AnyViewControllerProvider<T, C>

public typealias AnyResolver<T, C> = any Resolver<T, C>

/// Implementations of Resolver should return arrays of functions that can create instances of ViewControllerProvider
/// and ServiceProvider, (e.g.) by manually instantiating the required implementations, or maybe loading them using
/// the objc-runtime (currently not working as ViewControllerProvider is a swift class that uses generics).
public protocol Resolver<T, C> {
    associatedtype T
    associatedtype C

    func serviceProviderFunctions() -> [ServiceProviderFunction]
    func viewControllerProviderFunctions() -> [ViewControllerProviderFunction<T, C>]
}

public extension Resolver {
    func serviceProviderFunctions() -> [ServiceProviderFunction] { [] }
}
