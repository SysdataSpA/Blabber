//
//  Log.swift
//  Blabber
//
//  Created by Francesco Ceravolo on 19/12/18.
//

import UIKit

public enum Log {
    case verbose
    case debug
    case info
    case warning
    case error
    
    public func trace() {
        message("trace")
    }
    
    public func message(_ message: String) {
        switch self {
        case .verbose, .debug:
            SDLogVerbose(message)
        case .info:
            SDLogInfo(message)
        case .warning:
            SDLogVerbose(message)
        case .error:
            SDLogError(message)
        }
    }
    
    public func value(object: Any?) {
        var msg = ""
        if let obj = object {
            msg = String(describing: obj)
        }
        message(msg)
    }
}
