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
    public init() {}
    open func register(with _: Registry<T, C>) {}
    open func unregister(from _: Registry<T, C>) {}
    open func configure(with _: [String: ServiceProvider]) {}
}
