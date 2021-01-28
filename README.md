[![Build Status](https://api.travis-ci.com/cerihughes/provident.png?branch=master)](https://www.travis-ci.com/cerihughes/provident/) [![codecov.io](https://codecov.io/gh/cerihughes/provident/branch/master/graphs/badge.svg)](https://codecov.io/gh/cerihughes/provident/branch/master)

# Provident

`Provident` is a view controller provider framework that uses inversion of control to simplify view controller creation.

- Code that needs to create a view controller doesn't need to know _how_ to create a view controller or what its dependencies are
- The view controller's internals (whether it uses storyboards, "vanilla" UIKit, SwiftUI etc) are hidden away, allowing a more declarative programming style
- Allows apps to avoid a common iOS coding trap where view controllers that present other view controllers (ad infinitum) need to know about all of the dependencies of those child view controllers
- Makes it a lot easier to introduce an architecture where dependencies and other services are loosely coupled from the rest of the system

## Common Pitfalls with View Controller Creation Code

### 1) Different view controller "flavours" require flavour-specific initialisation code

- if using UIKit, the calling code needs to instantiate the view controller directly
- if using Storyboards, the calling code needs to use `UIStoryboard` to create the view controller
- if using SwiftUI, the calling code needs to wrap the `View` in a `UIHostingController`

If a view controller is reimplemented as a different "flavour" (e.g. refactored from a Storyboard to SwiftUI), all calling code must be changed accordingly. Essentially, some of the internals of the view controller are exposed, reducing encapsualtion.

`Provident` uses the concept of a `ViewControllerProvider` to solve this, moving all of the logic for view controller creation to a single place.

### 2) View controllers that create child view controllers need to know all of the dependencies of its children (and their children)

Assuming that your dependencies _aren't_ static singletons, they'll need to be passed into the view controller during creation.

e.g. If we have a single `RootViewController` and construct it with `RootViewController(dep1: Dependency1)`, as soon as that view controller is responsible for creating a `ChildViewController` with `ChildViewController(dep2: Dependency2)`, we have to update all `RootViewController` initialisaton calls to `RootViewController(dep1: Dependency1, dep2: Dependency2)`.

As `RootViewController` adds more child view controllers, and those child view controllers add their own child view controllers, the `RootViewController` suddenly has to be initialised with _all_ dependencies used in all view controllers in the system, leading to the creation of "god objects".

`Provident` uses the concept of a `Registry` to solve this, allowing view controllers to be created without any knowledge of their dependencies.

### 3) View controllers that directly initialise child view controllers are inherantly coupled to their children

As we saw above, if we initialise `ChildViewController(dep2: Dependency2)` from within `RootViewController`, we tightly couple those implementations together, making it harder to switch out `ChildViewController` for another `UIViewController` instance.

The `Provident` `Registry` API works at the `UIViewController` level, allowing view controllers to be switched out without any changes to the calling code.
