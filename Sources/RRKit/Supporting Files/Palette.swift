//
//  Palette.swift
//

import UIKit

public struct Palette {
    
    struct primary {
        static let backgroundColor = UIColor.white
        
        static let brand = UIColor(red: 140/255, green: 72/255, blue: 131/255, alpha: 1)
        static let lightBlue = UIColor(red: 66/255, green: 131/255, blue: 235/255, alpha: 1)
        static let lightGreen = UIColor(red: 15/255, green: 181/255, blue: 105/255, alpha: 1)
        static let gray = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
        static let lightGray = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        static let green = UIColor(red: 15/255, green: 177/255, blue: 106/255, alpha: 1)
        static let red = UIColor(red: 147/255, green: 15/255, blue: 30/255, alpha: 1)
        
        struct text {
            static let title = UIColor(red: 45/255, green: 59/255, blue: 80/255, alpha: 1)
            static let subtitle = UIColor(red: 166/255, green: 178/255, blue: 213/255, alpha: 1)
            static let main = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
            static let white = UIColor.white
        }
        
        struct border {
            static let lightGray = UIColor.lightGray
            static let main = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            static let green = UIColor(red: 15/255, green: 177/255, blue: 106/255, alpha: 1)
        }
        
    }
    
    struct secondary {
        static let lightBlue = UIColor(red: 91/255, green: 172/255, blue: 239/255, alpha: 1)
        static let lightGreen = UIColor(red: 93/255, green: 200/255, blue: 105/255, alpha: 1)
        static let lightRed = UIColor(red: 237/255, green: 33/255, blue: 58/255, alpha: 1)

    }
    
}
