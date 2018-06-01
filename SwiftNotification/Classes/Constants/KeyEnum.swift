//
//  KeyEnum.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

public struct DefaultKey {
    public static let NotificationId = "notificationid"
    public static let Category = "category"
    public static let Title = "title"
    public static let Content = "content"
    public static let TimeStamp = "timestamp"
    public static let IsRead = "isRead"
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
