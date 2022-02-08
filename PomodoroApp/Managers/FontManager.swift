//
//  FontManager.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 07/02/22.
//

import Foundation
import UIKit

protocol FontManagerDelegate {
  func changeFont(font: Font)
}

class FontManager {
  var delegate: FontManagerDelegate?
  var actualFont: Font
  
  func setActualFont(font: Font) {
    self.actualFont = font
  }

  func changeFont(font: Font) {
    self.delegate?.changeFont(font: font)
  }
  
  init() {
    self.actualFont = .defaultOption
  }
}
