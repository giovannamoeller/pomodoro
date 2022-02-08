//
//  TimeTextView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class TimeTextView: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = UIColor(named: "TextColor") ?? .white
    font = .systemFont(size: 72.0, weight: .heavy)
  }
}
