//
//  TimeTextView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class TimeTextView: UIView {
  
  private lazy var timeText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.textColor = .white
    text.font = .systemFont(ofSize: 48.0, weight: .heavy)
    return text
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
