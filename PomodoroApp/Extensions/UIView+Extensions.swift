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
    } else if let nextResponder = self.next as? UIView {
      return nextResponder.findViewController()
    } else {
      return nil
    }
  }
}
