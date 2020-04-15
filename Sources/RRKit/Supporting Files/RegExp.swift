//
//  RegExp.swift
//

import Foundation

struct RegExpPart {
    static let start = "^"
    
    struct constants {
        static let lowercaseLettersRequired = ".*[a-z].*"
        static let uppercaseLetterRequired = ".*[A-Z].*"
        static let digitRequired = ".*[\\d].*" // can writing as \d or ".*[\\d].*" or ".*[0-9].*"
        static let symbolRequired = ".*[!@#$&*,._~-].*"
    }
    
    struct methods {
        static func numberOfRequiredLowercaseLetters(_ number: Int) -> String {
            let number = abs(number) // in case where number equal 0, lowercase letters is unlimeted
            return "(?=.*[a-z]{\(number)})"
        }
        
        static func numberOfRequiredUppercaseLetters(_ number: Int) -> String {
            let number = abs(number) // in case where number equal 0, uppercase letters is unlimeted
            return "(?=.*[A-Z]{\(number)})"
        }
        
        static func numberOfRequiredDigits(_ number: Int) -> String {
            let number = abs(number) // in case where number equal 0, digits is unlimeted
            return "(?=.*[0-9]{\(number)})"
        }
        
        static func numberOfRequiredSymbols(_ number: Int) -> String {
            let number = abs(number) // in case where number equal 0, symbols is unlimeted
            return "(?=.*[!@#$&*]{\(number)})"
        }
        
        static func requiredStringRange(min: Int, max: Int) -> String {
            // in case where number equal 0, symbols is unlimeted
            let requiredStringRange = "\(start)[\(constants.uppercaseLetterRequired)\(constants.lowercaseLettersRequired)\(constants.digitRequired)\(constants.symbolRequired)]{\(min),\(max)}\(end)"
            return requiredStringRange
        }
    }
    
    static let email = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    static let end = "$"
}
