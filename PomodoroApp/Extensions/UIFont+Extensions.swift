//
//  UIFont+Extensions.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 08/02/22.
//

import Foundation
import UIKit

extension UIFont {
  private static var defaultSize = 14.0
    
  // override function
  static func systemFont(size fontSize: CGFloat = defaultSize, weight: UIFont.Weight = .regular, fontFamily: Font = .defaultOption) -> UIFont {
    var fontPrefix: String = ""
    switch weight {
    case .regular: fontPrefix = "-Regular"
    case .bold: fontPrefix = "-Bold"
    case .heavy: fontPrefix = "-ExtraBold"	
    default: fontPrefix = "-Regular"
    }
        
    return UIFont(name: "\(fontFamily.rawValue)\(fontPrefix)", size: fontSize) ?? .systemFont(ofSize: UIFont.defaultSize)
  }
}
