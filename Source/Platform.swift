//
//  Platform.swift
//  Provident
//
//  Created by Ceri Hughes on 26/09/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

#if canImport(UIKit)
import UIKit
public typealias ViewController = UIViewController
public typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
#elseif canImport(AppKit)
import AppKit
import Foundation
public typealias ViewController = NSViewController
public typealias LaunchOptions = Notification
#endif
