//
//  PomodoroTextView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class PomodoroTextView: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .white
    text = "pomodoro"
    font = .systemFont(size: 24.0, weight: .bold)
  }
}
