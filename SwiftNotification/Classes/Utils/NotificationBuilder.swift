//
//  NotificationBuilder.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

import Foundation
import UserNotifications

@available(iOS 10.0, *)
class NotificationBuilder {
    private let userDefaults = UserDefaults.standard
    private var notificationContent: UNMutableNotificationContent?
    
    init(type: SoundType) {
        notificationContent = UNMutableNotificationContent()
        notificationContent?.launchImageName = "AppIcon"
    }
    
    func setTitle(title: String) -> NotificationBuilder {
        notificationContent?.title = title
        return self
    }
    
    func setSubtitle(subtitle: String) -> NotificationBuilder {
        notificationContent?.subtitle = subtitle
        return self
    }
    
    func setBody(body: String) -> NotificationBuilder {
        notificationContent?.body = body
        return self
    }
    
    func setUserInfo(userInfo: [AnyHashable: Any]) -> NotificationBuilder {
        notificationContent?.userInfo = userInfo
        return self
    }
    
    func setSound(sound: UNNotificationSound) -> NotificationBuilder {
        notificationContent?.sound = sound
        return self
    }
    
    func setBadge(badge: NSNumber) -> NotificationBuilder {
        notificationContent?.badge = badge
        return self
    }
    
    // MARK: To include actions in our notifications we need to set the category in the notification content
    func setCategoryIdentifer(categoryIdentifier: String) -> NotificationBuilder {
        notificationContent?.categoryIdentifier = categoryIdentifier
        return self
    }
    
    func getContent() -> UNMutableNotificationContent {
        return notificationContent!
    }
    
    func getTimeTrigger(interval: TimeInterval) -> UNTimeIntervalNotificationTrigger {
        return UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
    }
}
