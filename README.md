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
navigationBar.apply(attribute:.backgroundImage(UIImage(named:"NavigationBar")))

- solidColor (globaly and in currentVC)
navigationBar.apply(attribute:.plainColor(.blue)))

- titleAttributes (globaly and in currentVC)
navigationBar.apply(attributes:[
    NavigationBarAttribute.titleColor(.red),
    NavigationBarAttribute.titleFont(.boldSystemFont(ofSize: 20))
])
```

- remove or set back shadow in on line of code

```swift
self.naviagtionController?.navigationBar.apply(attribute:.showShadow(false))

```

- customise backbutton image and title for NavigationController subclass named IASNavigationController
  subclass IASNavigationController or create it in code. Then before show it 
  set it navigationBarAttributes property to anything you want

```swift
IASNavigationController(rootViewController: UIViewController(), 
                        attributes: [.backButton("GoBack",UIImage(named:"BackButton"))])
```

Configure UIBarButtonItem:
- barbuttonsTitleAttributes (globaly and in currentVC)
and ect

```swift
let barButtonItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
barButtonItem.apply(attributes: [.barButtonTitleFont(.systemFont(ofSize: 10)),
                                 .barButtonTitleColor(.gree])
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
