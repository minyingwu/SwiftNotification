//
//  NotificationIdentity.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

import Foundation
import UserNotifications

@available(iOS 10.0, *)
public typealias ActionContext = (actionTitle: String, actionOptions: UNNotificationActionOptions)

@available(iOS 10.0, *)
public class NotificationIdentity {
    var mRequestId: String!
    var mCategoryId: String?
    
    var mCategoryActions: [ActionContext] = []
    
    public init() {}
    
    // Notification number
    public func setRequestId(_ requestId: String) -> NotificationIdentity {
        self.mRequestId = requestId
        return self
    }
    
    // Notification description
    public func setCategoryId(_ categoryId: String) -> NotificationIdentity {
        self.mCategoryId = categoryId
        return self
    }
    
    public func setCategoryAction(_ action: (actionTitle: String, actionOptions: UNNotificationActionOptions)) -> NotificationIdentity {
        mCategoryActions.append(action)
        return self
    }
    
    internal func get() -> (requestId: String, categoryId: String, categoryActions: [ActionContext]){
        guard mCategoryId != nil else {
            return (mRequestId, "", [])
        }
        return (mRequestId, mCategoryId!, mCategoryActions)
    }
}

