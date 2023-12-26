//
//  Logging.swift
//
//
//  Created by Kaï-Zen Fœnyx Krysies Berg-Šæmañn on 2023-12-26.
//

import Foundation
import OSLog

#if targetEnvironment(simulator)
public typealias SelectedLogger = PrintLogger
#else
public typealias SelectedLogger = Logger
#endif

fileprivate let subsystem = Bundle.main.bundleIdentifier!
fileprivate var loggers: [String: SelectedLogger] = [:]

public protocol Logging {
    var log: SelectedLogger { get }
    static var log: SelectedLogger { get }
}

extension Logging {
    public static var category: String {
        String(describing: Self.self)
    }

    public var log: SelectedLogger {
        Self.log
    }

    public static var log: SelectedLogger {
        if let logger = loggers[category] {
            return logger
        } else {
            let logger = SelectedLogger(subsystem: subsystem, category: category)
            loggers[category] = logger
            return logger
        }
    }
}

#if DEBUG
import SwiftUI

fileprivate struct Preview: View, Logging {
    @State private var levels = OSLogType.allCases
    var body: some View {
        ForEach(levels) { level in
            let msg = "\(level.description) message"
            Button {
                log.log(level: level, "\(msg)")
            } label: {
                Text("\(level.emoji) log ^[a \(msg)](inflect: true)")
            }
            .padding()
        }
    }
}


#Preview {
    Preview()
}
#endif
