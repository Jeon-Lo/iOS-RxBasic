//
//  LogEx.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import Foundation


class LogEx {
    
    static let DISABLE_TAG = [/*"responseOutput", "Response Json", "PARAMETERS", "PUSH REQUEST" */"responseOutput"]
    static let LOG_TAG = "LogEx_ChangoTuri"
    
    //TODO 릴리즈시 항상 debug가 false로 되어있는지 확인!
    private static var DEBUG = false
    
    enum LEVEL : Int {
        case VERVOSE = 10, DEBUG = 20, INFO = 30, WARN = 40, ERROR = 50, ASSET = 60
    }
    
    private static var level : LEVEL = .VERVOSE
    
    public static func setMode(_ debug : Bool, _ level : LEVEL = .VERVOSE) {
        self.DEBUG = debug
        self.level = level
    }
    
    public static func v(_ message : String){
        self.v(LOG_TAG, message)
    }
    
    public static func v(_ tag : String, _ message : String, _ isRequere : Bool = false){
        if DISABLE_TAG.contains(tag) && !isRequere {
            return
        }
        if DEBUG && self.level.rawValue <= LEVEL.VERVOSE.rawValue {
            print("⚪\(getCurrentTime()) V/\(tag): \(message)⚪")
        }
    }
    
    public static func d(_ message : String){
        self.d(LOG_TAG, message)
    }
    
    public static func d(_ tag : String, _ message : String, _ isRequere : Bool = false){
        if DISABLE_TAG.contains(tag) && !isRequere {
            return
        }
        if DEBUG && self.level.rawValue <= LEVEL.DEBUG.rawValue {
            print("🍏\(getCurrentTime()) D/\(tag): \(message)🍏")
        }
    }
    
    public static func i(_ message : String){
        self.i(LOG_TAG, message)
    }
    
    public static func i(_ tag : String, _ message : String, _ isRequere : Bool = false){
        if DISABLE_TAG.contains(tag) && !isRequere {
            return
        }
        if DEBUG && self.level.rawValue <= LEVEL.INFO.rawValue {
            print("🔵\(getCurrentTime()) I/\(tag): \(message)🔵")
        }
    }
    
    public static func w(_ message : String){
        self.w(LOG_TAG, message)
    }
    
    public static func w(_ tag : String, _ message : String, _ isRequere : Bool = false){
        if DISABLE_TAG.contains(tag) && !isRequere {
            return
        }
        if DEBUG && self.level.rawValue <= LEVEL.WARN.rawValue {
            print("🍊\(getCurrentTime()) W/\(tag): \(message)🍊")
        }
    }
    
    public static func e(_ message : String){
        self.e(LOG_TAG, message)
    }
    
    public static func e(_ tag : String, _ message : String, _ isRequere : Bool = false){
        if DISABLE_TAG.contains(tag) && !isRequere {
            return
        }
        if DEBUG && self.level.rawValue <= LEVEL.ERROR.rawValue {
            print("🔴\(getCurrentTime()) E/\(tag): \(message)🔴")
        }
    }
    
    public static func a(_ message : String){
        self.a(LOG_TAG, message)
    }
    
    public static func a(_ tag : String, _ message : String, _ isRequere : Bool = false){
        if DISABLE_TAG.contains(tag) && !isRequere {
            return
        }
        if DEBUG && self.level.rawValue <= LEVEL.ASSET.rawValue {
            print("💗\(getCurrentTime()) A/\(tag): \(message)💗")
        }
    }
    
    public static func getCurrentTime(_ dateFormat : String = "yyyy-MM-dd HH:mm:ss.SSS") -> String{
        let now=NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = NSLocale(localeIdentifier: "ko_KR") as Locale
        return dateFormatter.string(from: now as Date)
    }

    var notContains = [0,1,2,3,4,5,6,7,8,9]
    
    func solution(_ numbers:[Int]) -> Int {
        notContains.contains(1)
        for i in 0 ..< 10 {
            for number in numbers {
                if i == number {
                    notContains.remove(at: i)
                    break
                }
            }
        }
        var result = 0
        for c in notContains {
            result += c
        }
        return result
    }

}
