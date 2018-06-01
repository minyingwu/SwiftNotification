//
//  NotificationSettings.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/31.
//  Copyright © 2018 Victor. All rights reserved.
//

import UserNotifications

public struct NotificationSettings {
    public static var center: UNUserNotificationCenter?
    
    public static var delegate: UNUserNotificationCenterDelegate?
    
    public static func setNotificationCenter(center: UNUserNotificationCenter) {
        self.center = center
    }
    
    public static func getNotificationCenter() -> UNUserNotificationCenter {
        if center == nil {fatalError("Must setup notification center first")}
        else {return center!}
    }
    
    public static func setNotificationCenterDelegate(delegate: UNUserNotificationCenterDelegate) {
        self.delegate = delegate
    }
    
    public static func getNotificationCenterDelegate() -> UNUserNotificationCenterDelegate {
        if delegate == nil {fatalError("Must setup notification delegate first")}
        else {return delegate!}
    }
}
