//
//  NotificationIdentity.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

import Foundation
import UserNotifications

typealias ActionContext = (actionTitle: String, actionOptions: UNNotificationActionOptions)

public class NotificationIdentity {
    var mId: Int32!
    var mRequestId: Int32!
    var mCategoryId: String?
    
    var mCategoryActions: [ActionContext] = []
    
    public init(_ mId: Int32) {
        self.mId = mId
    }
    
    // Notification number
    public func setRequestId(_ requestId: Int32) -> NotificationIdentity {
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
    
    internal func get() -> (numId: Int32, requestId: Int32, categoryId: String, categoryActions: [ActionContext]){
        guard mCategoryId != nil else {
            return (mId, mRequestId, "", [])
        }
        return (mId, mRequestId, mCategoryId!, mCategoryActions)
    }
}

