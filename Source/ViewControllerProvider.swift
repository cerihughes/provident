//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

public typealias AnyViewControllerProvider<T, C> = any ViewControllerProvider<T, C>

/// A type that provides a VC (or a number of VCs) for a given token by registering with a ViewControllerRegistry.
public protocol ViewControllerProvider<T, C> {
    associatedtype T
    associatedtype C

    func register(with registry: AnyRegistry<T, C>)
    func configure(with serviceProviders: [String: ServiceProvider])
    func createViewController(token: T, context: C) -> ViewController?
}

public extension ViewControllerProvider {
    func register(with registry: AnyRegistry<T, C>) {}
    func configure(with serviceProviders: [String: ServiceProvider]) {}
}
