//
//  ConfigurationButtonView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class ConfigurationButtonView: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(systemName: "gearshape.fill"), for: .normal)
    button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
    button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
    button.tintColor = UIColor(named: "ButtonTextColorDisabled")?.withAlphaComponent(0.4)
    addSubview(button)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
