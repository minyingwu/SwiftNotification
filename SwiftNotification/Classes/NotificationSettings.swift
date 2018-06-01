//
//  NotificationSettings.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/31.
//  Copyright © 2018 Victor. All rights reserved.
//

import UserNotifications

@available(iOS 10.0, *)
public struct NotificationSettings {
    public static var center: UNUserNotificationCenter?
    
    public static var delegate: UNUserNotificationCenterDelegate? {
        didSet {
            getNotificationCenter().delegate = delegate
        }
    }
    
    public static func getNotificationCenter() -> UNUserNotificationCenter {
        if center == nil {fatalError("Must setup notification center first")}
        else {return center!}
    }
}
