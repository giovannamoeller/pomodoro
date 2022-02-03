//
//  ColorManager.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 02/02/22.
//

import Foundation
import UIKit

protocol ColorManagerDelegate {
  func changeColor(color: UIColor)
}

class ColorManager {
  static var actualColor: UIColor = .init(named: "Color1") ?? .clear
  
  var delegate: ColorManagerDelegate?

  func changeColor(color: UIColor) {
    self.delegate?.changeColor(color: color)
  }
}
