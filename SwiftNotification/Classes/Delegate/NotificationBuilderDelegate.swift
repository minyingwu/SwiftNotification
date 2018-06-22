//
//  ReadNotificationDelegate
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//
import UserNotifications

@available(iOS 10.0, *)
public protocol NotificationBuilderDelegate: class {
    var notificationInfo: NotificationInfo {get}
    
    var notificationIdentityDic: Dictionary<String, NotificationIdentity>? {get}
    
    func getNotificationInfo() -> NotificationInfo
    
    func getNotificationIdentityDic() -> Dictionary<String, NotificationIdentity>?
}

@available(iOS 10.0, *)
public extension NotificationBuilderDelegate {
    var notificationInfo: NotificationInfo {
        return getNotificationInfo()
    }
    
    var notificationIdentityDic: Dictionary<String, NotificationIdentity>? {
        return getNotificationIdentityDic()
    }
}
