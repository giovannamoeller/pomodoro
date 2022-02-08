//
//  StartStopButtonView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class StartStopButtonView: UIButton {
      
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    translatesAutoresizingMaskIntoConstraints = false
    let attributedString = NSAttributedString(
      string: Button.start.rawValue.uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(size: 14.0, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor(named: "TextColor") ?? .clear
     ]
    )
    setAttributedTitle(attributedString, for: .normal)
  }
  
  func setButtonTitle(_ button: Button) {
    let attributedString = NSAttributedString(
      string: button.rawValue.uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(size: 14.0, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor(named: "TextColor") ?? .clear
     ]
    )
    setAttributedTitle(attributedString, for: .normal)
  }
  
  func changeFont(font: Font) {
    let attributedString = NSAttributedString(
      string: Button.start.rawValue.uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(size: 14.0, weight: .bold, fontFamily: font),
      NSAttributedString.Key.foregroundColor: UIColor(named: "TextColor") ?? .clear
     ]
    )
    setAttributedTitle(attributedString, for: .normal)
  }
  
}
