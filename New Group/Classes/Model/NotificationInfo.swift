//
//  NotificationInfo.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

open class NotificationInfo {
    
    private var notificationId: Int32!
    private var category: String!
    private var title: String!
    private var content: String!
    private var timestamp: Double!
    private var isRead: Bool!
    
    public required init(notificationId: Int32? = 0, category: String? = "",
         title: String? = "", content: String? = "",
         timestamp: Double? = 0, isRead: Bool? = false) {
        self.notificationId = notificationId
        self.category = category
        self.title = title
        self.content = content
        self.timestamp = timestamp
        self.isRead = isRead
    }
    
    public func setTitle(_ title: String) {
        self.title = title
    }
    
    public func setContent(_ content: String) {
        self.content = content
    }
    
    public func setCategory(_ category: String) {
        self.category = category
    }
    
    public func setNotificationId(_ notificationId: Int32) {
        self.notificationId = notificationId
    }
    
    public func setTimeStamp(_ timestamp: Double) {
        self.timestamp = timestamp
    }
    
    public func setIsRead(_ isRead: Bool) {
        self.isRead = isRead
    }
    
    public func getNotificationId() -> Int32 {
        return notificationId
    }
    
    public func getIsRead() -> Bool {
        return isRead
    }
    
    public func getTitle() -> String {
        return title
    }
    
    public func getContent() -> String {
        return content
    }
    
    public func getCategory() -> String {
        return category
    }
    
    public func getTimeStamp() -> Double {
        return timestamp
    }
}


