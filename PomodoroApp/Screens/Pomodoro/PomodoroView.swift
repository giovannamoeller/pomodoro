//
//  PomodoroView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class PomodoroView: UIView {
  
  private lazy var pomodoroTitleTextView = PomodoroTextView()
  private lazy var optionsView = OptionsView(frame: .zero)
  private lazy var circularProgressView = CircularProgressView()
  private lazy var configurationButtonView = ConfigurationButtonView()
  
  private var timerManager = TimerManager()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    addSubviews()
    setUpConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addSubviews() {
    addSubview(pomodoroTitleTextView)
    addSubview(optionsView)
    addSubview(circularProgressView)
    addSubview(configurationButtonView)
  }
  
  func configureUI() {
    backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      pomodoroTitleTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
      pomodoroTitleTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32.0),
      
      optionsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
      optionsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
      optionsView.topAnchor.constraint(equalTo: pomodoroTitleTextView.bottomAnchor, constant: 32.0),
      optionsView.heightAnchor.constraint(equalToConstant: 52),
      
      circularProgressView.centerXAnchor.constraint(equalTo: centerXAnchor),
      circularProgressView.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      configurationButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
      configurationButtonView.topAnchor.constraint(equalTo: circularProgressView.bottomAnchor, constant: 256),
    ])
  }
  
}
