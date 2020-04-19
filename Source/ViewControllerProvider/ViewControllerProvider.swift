//
//  ViewControllerProvider.swift
//  Provident
//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

/// A class that provides a VC (or a number of VCs) for a given token by registering with a ViewControllerRegistry.
open class ViewControllerProvider<T, C> {
    private var uuid: UUID?

    public init() {}

    func register(with registry: Registry<T, C>) {
        uuid = registry.add(registryFunction: createViewController(token:context:))
    }

    func unregister(from registry: Registry<T, C>) {
        guard let uuid = uuid else { return }

        registry.removeRegistryFunction(uuid: uuid)
    }

    open func configure(with _: [String: ServiceProvider]) {}

    open func createViewController(token: T, context: C) -> UIViewController? {
        // OVERRIDE
        return nil
    }
}
