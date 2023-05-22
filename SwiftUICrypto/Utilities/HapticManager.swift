//
//  HapticManager.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 22/05/2023.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
