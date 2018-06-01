//
//  MyAppNotificationInfo.swift
//  NotificationExample
//
//  Created by Victor on 2018/5/30.
//  Copyright © 2018 Victor. All rights reserved.
//

import Foundation
import SwiftNotification

class MyAppNotificationInfo: NotificationInfo {
    private var customUid: String?
    
    required init(notificationId: Int32?, category: String?,
                  title: String?, content: String?,
                  timestamp: Double?, isRead: Bool?) {
        super.init(notificationId: notificationId, category: category,
                   title: title, content: content, timestamp: timestamp, isRead: isRead)
    }
    public func setcustomUid(_ customUid: String) {
        self.customUid = customUid
    }
    public func getcustomUid() -> String {
        return customUid ?? ""
    }
}
