//
//  NotificationBuilderHelper.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

import Foundation
import UserNotifications

@available(iOS 10.0, *)
public class NotificationBuilderHelper {
    public weak var delegate: NotificationBuilderDelegate!
    
    private var msgData: [AnyHashable: Any]
    private(set) var mRequest: UNNotificationRequest?
    private(set) var mCategory: UNNotificationCategory?
    
    
    public init(withMessage data: [AnyHashable: Any], notificationId: Int32) {
        self.msgData = data
        msgData.updateValue(
            notificationId, forKey: DefaultKey.NotificationId)
    }
    
    public func createNotification(with type: SoundType,
                                   add actions: [ActionContext]? = nil,
                                   alter actionIndex: Int? = nil) -> NotificationBuilderHelper? {
        let notificationInfo = self.delegate.notificationInfo
        let mBuilder = NotificationBuilder(type: type)
            .setTitle(title: notificationInfo.getTitle())
            .setBody(body: notificationInfo.getContent())
            .setUserInfo(userInfo: msgData)
            .setCategoryIdentifer(categoryIdentifier: (notificationInfo.getCategory()))
        mRequest = UNNotificationRequest(
            identifier: String(notificationInfo.getNotificationId()),
            content: mBuilder.getContent(),
            trigger: mBuilder.getTimeTrigger(interval: 1))
        
        guard let actions = actions else {
            mCategory = UNNotificationCategory(identifier: notificationInfo.getCategory(),
                                               actions: [],
                                               intentIdentifiers: [], options: [])
            return self
        }
        
        if let index = actionIndex {
            mCategory = UNNotificationCategory(identifier: notificationInfo.getCategory(),
                                               actions: getActions([actions[index]]),
                                               intentIdentifiers: [], options: [])
        }else {
            mCategory = UNNotificationCategory(identifier: notificationInfo.getCategory(),
                                               actions: getActions(actions),
                                               intentIdentifiers: [], options: [])
        }
        return self
    }
    
    public func createNotificationByCustom(with type: SoundType,
                                           alter actionIndex: Int? = nil) -> NotificationBuilderHelper? {
        let notificationInfo = self.delegate.notificationInfo
        guard let mIdentity = self.delegate.notificationIdentityDic?[notificationInfo.getCategory()]?.get() else {
            print("Never create NotificationIdentity in function getNotificationIdentityDic()")
            return nil
        }
        
        let mBuilder = NotificationBuilder(type: type)
            .setTitle(title: notificationInfo.getTitle())
            .setBody(body: notificationInfo.getContent())
            .setUserInfo(userInfo: msgData)
            .setCategoryIdentifer(categoryIdentifier: mIdentity.categoryId)
        mRequest = UNNotificationRequest(
            identifier: mIdentity.requestId,
            content: mBuilder.getContent(),
            trigger: mBuilder.getTimeTrigger(interval: 1))
        
        if let index = actionIndex {
            mCategory = UNNotificationCategory(identifier: mIdentity.categoryId,
                                               actions: getActions([mIdentity.categoryActions[index]]),
                                               intentIdentifiers: [], options: [])
        }else {
            mCategory = UNNotificationCategory(identifier: mIdentity.categoryId,
                                               actions: getActions(mIdentity.categoryActions),
                                               intentIdentifiers: [], options: [])
        }
        return self
    }
    
    public func show() {
        if let mRequest = mRequest, let mCategory = mCategory {
            let center = NotificationSettings.getNotificationCenter()
            center.setNotificationCategories([mCategory])
            center.add(mRequest) { (e: Error?) -> (Void) in
                if let e = e {
                    print(e)
                }
            }
        }
    }
    
    public func updateMsgData(data: [AnyHashable: Any]) -> NotificationBuilderHelper {
        for (key, value) in data {
            msgData.updateValue(value, forKey: key)
        }
        return self
    }
    
    private func getActions(_ actions: [ActionContext]) -> [UNNotificationAction] {
        var mActions: [UNNotificationAction] = []
        let count = actions.count
        guard count != 0 else {
            return mActions
        }
        
        if count >= 1 {
            mActions.append(UNNotificationAction(identifier: (ActionId.ActionFirst.identifier),
                                                 title: (actions[0].actionTitle),
                                                 options: [actions[0].actionOptions]))
        }
        
        if count >= 2 {
            mActions.append(UNNotificationAction(identifier: (ActionId.ActionSecond.identifier),
                                                 title: (actions[1].actionTitle),
                                                 options: [actions[1].actionOptions]))
        }
        
        if count >= 3 {
            mActions.append(UNNotificationAction(identifier: (ActionId.ActionThird.identifier),
                                                 title: (actions[2].actionTitle),
                                                 options: [actions[2].actionOptions]))
        }
        
        if count >= 4 {
            mActions.append(UNNotificationAction(identifier: (ActionId.ActionFourth.identifier),
                                                 title: (actions[3].actionTitle),
                                                 options: [actions[3].actionOptions]))
        }
        return mActions
    }
}

