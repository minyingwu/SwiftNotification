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
            buildHelper.createNotification(with: .defaultSound)?.show()
        }else {
            print("Never initialize model of notificationInfo")
        }
    }
    
    func setNotificationInfo(_ data: [AnyHashable: Any]) {
        let _notificationId = data[DefaultKey.NotificationId] as? Int32 ?? 0
        let _category = data[DefaultKey.Category] as? String ?? ""
        let _title = data[DefaultKey.Title] as? String ?? ""
        let _content = data[DefaultKey.Content] as? String ?? ""
        let _timeStamp = data[DefaultKey.TimeStamp] as? Double ?? 0.00
        
        info = MyAppNotificationInfo.init(notificationId: _notificationId, category: _category, title: _title, content: _content, timestamp: _timeStamp, isRead: false)
        info?.setcustomUid("My Uid")
    }
}

extension MyAppNotificationHelper: NotificationBuilderDelegate {
    func getNotificationInfo() -> NotificationInfo {
        return info!
    }
    
    func getNotificationIdentityDic() -> Dictionary<String, NotificationIdentity> {
        var identityDic = Dictionary<String, NotificationIdentity>()
        identityDic.updateValue(NotificationIdentity()
            .setRequestId("Notification_Test_Request")
            .setCategoryId("Notification_Test_Category")
            .setCategoryAction(("Action1Title", .foreground)), forKey: "Notification_Test_Category")
        return identityDic
    }
}
