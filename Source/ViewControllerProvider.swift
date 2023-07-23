//
//  ViewControllerProvider.swift
//  Provident
//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

/// A class that provides a VC (or a number of VCs) for a given token by registering with a ViewControllerRegistry.
public protocol ViewControllerProvider<T, C> {
    associatedtype T
    associatedtype C

    func register(with _: Registry<T, C>)
    func configure(with _: [String: ServiceProvider])
    func createViewController(token: T, context: C) -> ViewController?
}

public extension ViewControllerProvider {
    func register(with _: Registry<T, C>) {}
    func configure(with _: [String: ServiceProvider]) {}
}
