//
//  Platform.swift
//  Provident
//
//  Created by Home on 22/09/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

#if canImport(UIKit)
import UIKit
public typealias ViewController = UIViewController
public typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
#elseif canImport(AppKit)
import AppKit
public typealias ViewController = NSViewController
public typealias LaunchOptions = Notification
#endif
