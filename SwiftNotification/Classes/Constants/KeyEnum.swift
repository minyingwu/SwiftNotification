//
//  KeyEnum.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

open class DefaultKey {
    public static let NotificationId = "notificationid"
    public static let Category = "category"
    public static let Title = "title"
    public static let Content = "content"
    public static let TimeStamp = "timestamp"
    public static let IsRead = "isRead"
}

public enum ActionId {
    case ActionFirst
    case ActionSecond
    case ActionThird
    case ActionFourth
    
    public var identifier: String {
        switch self {
        case .ActionFirst:
            return "actionFirst"
        case .ActionSecond:
            return "actionSecond"
        case .ActionThird:
            return "actionThird"
        case .ActionFourth:
            return "actionFourth"
        }
    }
}

public enum SoundType: Int {
    case defaultSound, noSound
}
