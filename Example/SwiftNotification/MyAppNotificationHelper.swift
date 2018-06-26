//
//  MyAppNotificationHelper.swift
//  NotificationExample
//
//  Created by Victor on 2018/5/29.
//  Copyright © 2018 Victor. All rights reserved.
//

import SwiftNotification

class MyAppNotificationHelper {
    public static let shared: MyAppNotificationHelper = MyAppNotificationHelper()
    private init() {}
    
    fileprivate var info: MyAppNotificationInfo?
    
    func buildNotification(data: [AnyHashable: Any]) {
        setNotificationInfo(data)
        if let info = info {
            let buildHelper = NotificationBuilderHelper.init(withMessage: data, notificationId: info.getNotificationId())
            buildHelper.delegate = self
            
            // MARK: You can do something here, like distinguishing different notifications and storing them separately in the database by notificationInfo
            
            // Example: saveNotificationDB(notificationInfo)
            
            // Create local notification and show it
            let actionsContext: [ActionContext] = [("Action1Title", .foreground)]
            buildHelper.createNotification(with: .defaultSound, add: actionsContext)?.show()
        }else {
            print("Never initialize model of notificationInfo")
        }
    }
    
    // Example for setting notification data model
    func setNotificationInfo(_ data: [AnyHashable: Any]) {
        let _notificationId = data[DefaultKey.notificationId] as? Int32
        let _category = data[DefaultKey.category] as? String
        let _title = data[DefaultKey.title] as? String
        let _content = data[DefaultKey.content] as? String
        let _timeStamp = data[DefaultKey.timestamp] as? Double
        
        info = MyAppNotificationInfo.init(notificationId: _notificationId, category: _category, title: _title, content: _content, timestamp: _timeStamp, isRead: false)
        info?.setcustomUid("My Uid")
    }
}

extension MyAppNotificationHelper: NotificationBuilderDelegate {
    func getNotificationInfo() -> NotificationInfo {
        return info!
    }
    
    func getNotificationIdentityDic() -> Dictionary<String, NotificationIdentity>? {
        return nil
    }
}
