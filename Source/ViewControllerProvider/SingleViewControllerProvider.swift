//
//  SingleViewControllerProvider.swift
//  Provident
//
//  Created by Home on 25/05/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

import Foundation

open class SingleViewControllerProvider<T, C>: ViewControllerProvider<T, C> {
    override public init() {}

    override open func register(with registry: Registry<T, C>) {
        registry.add(registryFunction: createViewController(token:context:))
    }

    open func createViewController(token: T, context: C) -> ViewController? {
        // OVERRIDE
        nil
    }
}
