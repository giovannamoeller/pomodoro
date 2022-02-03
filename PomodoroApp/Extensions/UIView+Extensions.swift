//
//  UIView+Extensions.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 02/02/22.
//

import Foundation
import UIKit

extension UIView {
  func findViewController() -> UIViewController? {
    if let nextResponder = self.next as? UIViewController {
      return nextResponder
    }
    return nil
  }
}
