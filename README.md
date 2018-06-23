# SwiftNotification

[![CI Status](https://img.shields.io/travis/minyingwu/SwiftNotification.svg?style=flat)](https://travis-ci.org/minyingwu/SwiftNotification)
[![Version](https://img.shields.io/cocoapods/v/SwiftNotification.svg?style=flat)](https://cocoapods.org/pods/SwiftNotification)
[![License](https://img.shields.io/cocoapods/l/SwiftNotification.svg?style=flat)](https://cocoapods.org/pods/SwiftNotification)
[![Platform](https://img.shields.io/cocoapods/p/SwiftNotification.svg?style=flat)](https://cocoapods.org/pods/SwiftNotification)

## Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Author](#author)
- [License](#license)

## Requirements

- iOS 10.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

SwiftNotification is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SwiftNotification'
end
```

Then, run the following command:

```bash
$ pod install
```
# Usage
To manage your custom notification, and you can add some codes like following

## AppDelegate
```swift
/**
 AppDelegate.
 */
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: 
                     [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        /**
        Setup SwiftNotification
         */
         
        // Set your center such as UNUserNotificationCenter.current()
        NotificationSettings.center = '<Your Current Center>'
        
        // Set your custom center delegate such as UNUserNotificationCenterDelegate()
        NotificationSettings.delegate = '<Your Current Center Delegate>'
        
        return true
}
```

Then, create one function to handle APNS/FCM json result
```swift
fileprivate var info: NotificationInfo?
func buildNotification(data: [AnyHashable: Any]) {
        // First, save data to model NotificationInfo
        setNotificationInfo(data)
        if let info = info {
            // Second, create NotificationBuilderHelper instance by receive data and your custom notification id
            let buildHelper = NotificationBuilderHelper(withMessage: data, notificationId: info.getNotificationId())
            
            // Third, connect to  extension NotificationBuilderDelegate 
            buildHelper.delegate = self
            
            // Fourth, create notification with optional actions and show the banner
            let actionsContext: [ActionContext] = [("Action1Title", .foreground)]
            buildHelper.createNotification(with: .defaultSound, add: actionsContext)?.show()
        }else {
            print("Never initialize model of notificationInfo")
        }
}
```

## NotificationBuilderDelegate

In your using NotificationBuilderHelper class must inherit NotificationBuilderDelegate
```swift
public protocol NotificationBuilderDelegate: class {
    func getNotificationInfo() -> NotificationInfo
    
    func getNotificationIdentityDic() -> Dictionary<String, NotificationIdentity>?
}
```

![image](https://github.com/minyingwu/SwiftNotification/blob/master/DemoSwiftNotification.gif)

### Optional API
#### NotificationBuilderHelper 
- updateMsgData:

  Adding or updating notificationContent userinfo by your new dictionary before calling 
  createNotification or createNotificationByCustom 
  
- createNotificationByCustom:

  You can call createNotificationByCustom and take advantage of custom getNotificationIdentityDic
  to define your all kinds of necessary notification identities

## Author

minyingwu, minyingwu123@gmail.com

## License

SwiftNotification is available under the MIT license. See the LICENSE file for more info.
