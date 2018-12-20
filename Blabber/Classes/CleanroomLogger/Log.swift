//
//  Log.swift
//  Blabber
//
//  Created by Francesco Ceravolo on 19/12/18.
//

import UIKit
import CleanroomLogger

public enum LogLevel: Int {
    case verbose = 1
    case debug = 2
    case info = 3
    case warning = 4
    case error = 5
    
    func severity() -> CleanroomLogger.LogSeverity {
        return CleanroomLogger.LogSeverity(rawValue: rawValue) ?? .info
    }
}

public enum LogFormatter {
    case xcode
    case readable
    case parsable
    
    func formatter() -> CleanroomLogger.LogFormatter {
        switch self {
        case .xcode:
            return XcodeLogFormatter()
        case .readable:
            return ReadableLogFormatter()
        case .parsable:
            return ParsableLogFormatter()
        }
    }
}

public struct LogSettings {
    let level: LogLevel
    let formatter: LogFormatter
    
    public init(_ level: LogLevel = .info, formatter: LogFormatter = .readable) {
        self.level = level
        self.formatter = formatter
    }
}


public typealias Log = CleanroomLogger.Log

public enum Logger {
    
    public static func setup(settings: LogSettings = LogSettings()) {
        var configs = [LogConfiguration]()
        let logLevel = settings.level.severity()
        let logFormatter = settings.formatter.formatter()
        
        let stderr = StandardStreamsLogRecorder(formatters: [XcodeLogFormatter()])
        configs.append(BasicLogConfiguration(minimumSeverity: logLevel, recorders: [stderr]))
        
        // create a recorder for logging via OSLog (if possible)
        // and add a configuration that references it
        if let osLog = OSLogRecorder(formatters: [logFormatter]) {
            // the OSLogRecorder initializer will fail if running on
            // a platform that doesn’t support the os_log() function
            configs.append(BasicLogConfiguration(minimumSeverity: logLevel, recorders: [osLog]))
        }
        
        // create a configuration for a 15-day rotating log directory
        let filePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "").appending("/Log")
        let fileCfg = RotatingLogFileConfiguration(minimumSeverity: logLevel,
                                                   daysToKeep: 15,
                                                   directoryPath: filePath,
                                                   formatters: [logFormatter])
        
        // crash if the log directory doesn’t exist yet & can’t be created
        try! fileCfg.createLogDirectory()
        
        configs.append(fileCfg)
        
        // enable logging using the LogRecorders created above
        CleanroomLogger.Log.enable(configuration: configs)
    }
}
