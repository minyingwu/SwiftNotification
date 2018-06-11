//
//  MyAppNotificationDelegate.swift
//  NotificationExample
//
//  Created by Victor on 2018/5/31.
//  Copyright © 2018 Victor. All rights reserved.
//

import UserNotifications
import SwiftNotification

@available(iOS 10.0, *)
class MyAppNotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {                     completionHandler(.alert)
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let info = response.notification.request.content.userInfo
        let notificationId: Int32 = info[DefaultKey.NotificationId] as! Int32
        
        switch notificationId {
        case 0:
            switch response.actionIdentifier {
            case UNNotificationDismissActionIdentifier:
                print("Dismiss Action")
            case UNNotificationDefaultActionIdentifier:
                print("Receive from notification id 0 banner")
            default:
                print("Not match any action from notification id 0")
            }
            print("For default notification banner")
        case 100:
            switch response.actionIdentifier {
            case UNNotificationDismissActionIdentifier:
                print("Dismiss Action")
            case UNNotificationDefaultActionIdentifier:
                print("Receive from notification id 100 banner")
                let userInfo:[AnyHashable: String] = ["title": "Receive 100 banner"]
                NotificationCenter.default.post(name: Notification.Name("ReceiveBanner100"), object: nil, userInfo: userInfo)
            case ActionId.ActionFirst.rawValue:
                print("Receive from notification id 100 action first")
                let userInfo:[AnyHashable: String] = ["title": "Receive 100 button one"]
                NotificationCenter.default.post(name: Notification.Name("ReceiveBanner100"), object: nil, userInfo: userInfo)
            default:
                print("Not match any action from notification id 100")
            }
        default:
            print("Receive from notification id \(notificationId) but not match any action")
        }
        completionHandler()
    }
}

