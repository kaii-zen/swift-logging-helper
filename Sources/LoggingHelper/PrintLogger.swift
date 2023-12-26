//
//  PrintLogger.swift
//  
//
//  Created by Kaï-Zen Fœnyx Krysies Berg-Šæmañn on 2023-12-26.
//

import Foundation
import OSLog

public struct PrintLogger: LoggerProtocol {
    public typealias LogMessageType = String
    public let subsystem: String
    public let category: String

    public func log(level: OSLogType, _ message: LogMessageType) {
        let bundleId = Bundle.main.bundleIdentifier
        let filename = URL(string: #file)?.lastPathComponent ?? ""
        print(level.emoji, message)
        print("\t", category, "(\(subsystem == bundleId ? filename : subsystem))")
    }
}

extension OSLogType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .debug: "debug"
        case .info: "info"
        case .error: "error"
        case .fault: "fault"
        case .default: "default"
        default: "unknown"
        }
    }

}

protocol EmojiRepresentable {
    var emoji: String { get }
}

extension OSLogType: EmojiRepresentable {
    var emoji: String {
        switch self {
        case .debug: "🐞"
        case .info: "ℹ️"
        case .error: "⛔️"
        case .fault: "🔥"
        case .default: "📝"
        default: " "
        }
    }
}

extension OSLogType: CaseIterable {
    public static var allCases: [OSLogType] {
        [ .debug, .info, .error, .fault, .default ]
    }
}

extension OSLogType: Identifiable {
    public var id: UInt8 { rawValue }
}
