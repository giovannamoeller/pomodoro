//
//  PomodoroView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class PomodoroView: UIView {
  
  private lazy var titleText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.textColor = .white
    text.text = "pomodoro"
    text.font = .systemFont(ofSize: 24.0, weight: .bold)
    return text
  }()
  
  private lazy var optionsView = OptionsView(frame: .zero)
  private lazy var circularProgressView = CircularProgressView()
  private lazy var configurationButton = ConfigurationButtonView()
  
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
    addSubview(titleText)
    addSubview(optionsView)
    addSubview(circularProgressView)
    addSubview(configurationButton)
    //addSubview(timeText)
    //addSubview(startButton)
  }
  
  func configureUI() {
    backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      
      titleText.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32.0),
      
      optionsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
      optionsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
      optionsView.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 32.0),
      optionsView.heightAnchor.constraint(equalToConstant: 64),
      
      circularProgressView.centerXAnchor.constraint(equalTo: centerXAnchor),
      circularProgressView.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      configurationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      configurationButton.topAnchor.constraint(equalTo: circularProgressView.bottomAnchor, constant: 256),
      
    ])
  }
  
}
