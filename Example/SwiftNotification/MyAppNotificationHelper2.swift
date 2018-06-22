//
//  MyAppNotificationHelper2.swift
//  SwiftNotification
//
//  Created by Victor on 2018/6/22.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import SwiftNotification

class MyAppNotificationHelper2 {
    public static let shared: MyAppNotificationHelper2 = MyAppNotificationHelper2()
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
            buildHelper.createNotificationByCustom(with: .defaultSound)?.show()
        }else {
            print("Never initialize model of notificationInfo")
        }
    }
    
    // Example for setting notification data model
    func setNotificationInfo(_ data: [AnyHashable: Any]) {
        let _notificationId = data[DefaultKey.NotificationId] as? Int32
        let _category = data[DefaultKey.Category] as? String
        let _title = data[DefaultKey.Title] as? String
        let _content = data[DefaultKey.Content] as? String
        let _timeStamp = data[DefaultKey.TimeStamp] as? Double
        
        info = MyAppNotificationInfo.init(notificationId: _notificationId, category: _category, title: _title, content: _content, timestamp: _timeStamp, isRead: false)
        info?.setcustomUid("My Uid")
    }
}

extension MyAppNotificationHelper2: NotificationBuilderDelegate {
    func getNotificationInfo() -> NotificationInfo {
        return info!
    }
    
    func getNotificationIdentityDic() -> Dictionary<String, NotificationIdentity>? {
        var identityDic = Dictionary<String, NotificationIdentity>()
        identityDic.updateValue(NotificationIdentity()
            .setRequestId("Notification_Test_Request")
            .setCategoryId("Notification_Test_Category")
            .setCategoryAction(("Action1Title", .foreground)), forKey: "Notification_Test_Category")
        return identityDic
    }
}

