//
//  Platform.swift
//  Provident
//
//  Created by Ceri Hughes on 18/04/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

#if canImport(UIKit)
import UIKit
public typealias ViewController = UIViewController
public typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]?
#elseif canImport(Cocoa)
import Cocoa
public typealias ViewController = NSViewController
public typealias LaunchOptions = Notification
#endif
