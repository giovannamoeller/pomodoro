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
  
  func addBottomLineToView(stickyToBounds: Bool = false) {
    let bottomLine = UIView()
    bottomLine.translatesAutoresizingMaskIntoConstraints = false
    bottomLine.backgroundColor = UIColor(red: 227/255, green: 225/255, blue: 225/255, alpha: 1.0)
    addSubview(bottomLine)
    bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 16.0).isActive = true
    if stickyToBounds {
      bottomLine.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor).isActive = true
      bottomLine.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor).isActive = true
    } else {
      bottomLine.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 64.0).isActive = true
      bottomLine.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: -64.0).isActive = true
    }
    bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
  }
}
