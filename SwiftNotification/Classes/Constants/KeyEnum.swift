//
//  KeyEnum.swift
//  SwiftNotification
//
//  Created by Victor on 2018/5/28.
//  Copyright © 2018 Victor. All rights reserved.
//

open class DefaultKey {
    public static let notificationId = "notificationId"
    public static let category = "category"
    public static let title = "title"
    public static let content = "content"
    public static let timestamp = "timestamp"
    public static let isRead = "isRead"
}

public enum ActionId {
    case actionFirst
    case actionSecond
    case actionThird
    case actionFourth
    
    public var identifier: String {
        switch self {
        case .actionFirst:
            return "actionFirst"
        case .actionSecond:
            return "actionSecond"
        case .actionThird:
            return "actionThird"
        case .actionFourth:
            return "actionFourth"
        }
    }
}

public enum SoundType: Int {
    case defaultSound, noSound
}
