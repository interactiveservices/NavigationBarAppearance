# NavigationBarAppearance

[![CI Status](http://img.shields.io/travis/nikolay.shubenkov@gmail.com/NavigationBarAppearance.svg?style=flat)](https://travis-ci.org/nikolay.shubenkov@gmail.com/NavigationBarAppearance)
[![Version](https://img.shields.io/cocoapods/v/NavigationBarAppearance.svg?style=flat)](http://cocoapods.org/pods/NavigationBarAppearance)
[![License](https://img.shields.io/cocoapods/l/NavigationBarAppearance.svg?style=flat)](http://cocoapods.org/pods/NavigationBarAppearance)
[![Platform](https://img.shields.io/cocoapods/p/NavigationBarAppearance.svg?style=flat)](http://cocoapods.org/pods/NavigationBarAppearance)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Stop seraching stackoverflow and just do it in a few lines of code with declarative manner

## Features

configure NavigationBar:

```swift

let navigationBar = UINavigationBar.appearance()
- image (globaly and in currentVC)
navigationBar.apply(attribute:NavigationBarAttribute.backgroundImage(#imageLiteral(resourceName: "NavigationBar")))

- solidColor (globaly and in currentVC)
navigationBar.apply(attribute:NavigationBarAttribute.plainColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))

- titleAttributes (globaly and in currentVC)
navigationBar.apply(attributes:[
    NavigationBarAttribute.titleColor(UIColor.red),
    NavigationBarAttribute.titleFont(UIFont.boldSystemFont(ofSize: 20))
])
```

- remove or set back shadow in on line of code

```swift
self.naviagtionController?.navigationBar.apply(attribute:NavigationBarAttribute.showShadow(false))

```

- customise backbutton image and title for NavigationController subclass named IASNavigationController
  subclass IASNavigationController or create it in code. Then before show it 
  set it navigationBarAttributes property to anything you want

```swift
IASNavigationController(rootViewController: UIViewController(), 
                        attributes: [NavigationBarAttribute.backButton(" GoBack",UIImage(named:"BackButton"))])
```

Configure UIBarButtonItem:
- barbuttonsTitleAttributes (globaly and in currentVC)
and ect

```swift
let barButtonItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
barButtonItem.apply(attributes: [NavigationBarAttribute.barButtonTitleFont(UIFont.systemFont(ofSize: 10)),
NavigationBarAttribute.barButtonTitleColor(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))])
```

## Requirements

- iOS 7


## Installation

NavigationBarAppearance is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NavigationBarAppearance"
```

## Author

nikolay.shubenkov@gmail.com, n.shubenkov@be-interactive.ru

## License

NavigationBarAppearance is available under the MIT license. See the LICENSE file for more info.
