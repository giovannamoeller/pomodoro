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
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    translatesAutoresizingMaskIntoConstraints = false
    setBackgroundImage(UIImage(systemName: "gearshape.fill"), for: .normal)
    tintColor = UIColor(named: "ButtonTextColorDisabled")?.withAlphaComponent(0.4)
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: 32.0),
      heightAnchor.constraint(equalToConstant: 32.0)
    ])
    addTarget(self, action: #selector(configurationButtonPressed), for: .touchUpInside)
  }
  
  @objc func configurationButtonPressed() {
    print("config")
  }
  
}
