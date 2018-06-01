//
//  KeyEnum.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

public enum DefaultKey: String {
    case NotificationId = "notificationid"
    case Category = "category"
    case Title = "title"
    case Content = "content"
    case TimeStamp = "timestamp"
    case IsRead = "isRead"
}

public enum ActionId: String {
    case ActionFirst = "actionFirst"
    case ActionSecond = "actionSecond"
    case ActionThird = "actionThird"
    case ActionFourth = "actionFourth"
}

public enum SoundType: Int {
    case defaultSound, noSound
}
