//
//  LoggerProtocol.swift
//
//
//  Created by Kaï-Zen Fœnyx Krysies Berg-Šæmañn on 2023-12-26.
//

import Foundation
import OSLog

/// The protocol for a logger.
public protocol LoggerProtocol {
    associatedtype LogMessageType

    /// Logs a message with the specified log level.
    ///
    /// - Parameters:
    ///   - level: The log level.
    ///   - message: The message to log.
    func log(level: OSLogType, _ message: LogMessageType)

    /// Logs a message.
    ///
    /// - Parameter message: The message to log.
    func log(_ message: LogMessageType)

    /// Logs a trace message.
    ///
    /// - Parameter message: The message to log.
    func trace(_ message: LogMessageType)

    /// Logs a debug message.
    ///
    /// - Parameter message: The message to log.
    func debug(_ message: LogMessageType)

    /// Logs an info message.
    ///
    /// - Parameter message: The message to log.
    func info(_ message: LogMessageType)

    /// Logs a notice message.
    ///
    /// - Parameter message: The message to log.
    func notice(_ message: LogMessageType)

    /// Logs a warning message.
    ///
    /// - Parameter message: The message to log.
    func warning(_ message: LogMessageType)

    /// Logs an error message.
    ///
    /// - Parameter message: The message to log.
    func error(_ message: LogMessageType)

    /// Logs a critical message.
    ///
    /// - Parameter message: The message to log.
    func critical(_ message: LogMessageType)

    /// Logs a fault message.
    ///
    /// - Parameter message: The message to log.
    func fault(_ message: LogMessageType)
}

extension LoggerProtocol {
    public func debug(_ message: LogMessageType) {
        log(level: .debug, message)
    }

    public func info(_ message: LogMessageType) {
        log(level: .info, message)
    }

    // `log` equivalent to `debug`
    public func log(_ message: LogMessageType) {
        debug(message)
    }

    // `trace` equivalent to `debug`
    public func trace(_ message: LogMessageType) {
        // same as debug
        debug(message)
    }

    // `notice` equivalent to `log`
    public func notice(_ message: LogMessageType) {
        log(message)
    }

    // `critical` equivalent to `fault`
    public func critical(_ message: LogMessageType) {
        fault(message)
    }

    // `warning` equivalent to `error`
    public func warning(_ message: LogMessageType) {
        error(message)
    }

    public func error(_ message: LogMessageType) {
        log(level: .error, message)
    }

    public func fault(_ message: LogMessageType) {
        log(level: .fault, message)
    }
}

