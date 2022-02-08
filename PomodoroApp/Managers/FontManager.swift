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

  func changeFont(font: Font) {
    self.delegate?.changeFont(font: font)
  }
}
