//
//  PomodoroView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

protocol SegmentedControlProtocol {
  func initSegmentedControl()
  func segmentedControlChanged(_ sender: UISegmentedControl)
}

protocol StartStopButtonProtocol {
  func buttonPressed(_ sender: UIButton)
  func checkButtonStatus()
}

class PomodoroView: UIView {
  
  private lazy var pomodoroTitleTextView = PomodoroTextView()
  private lazy var optionsView = OptionsView(frame: .zero)
  private lazy var circularProgressView = CircularProgressView()
  private lazy var configurationButtonView = ConfigurationButtonView()
  private lazy var startStopButton = StartStopButtonView()
  
  private lazy var buttonCount = 0
  var timerManager = TimerManager()
    
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
    optionsView.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
    initSegmentedControl()
    addSubview(circularProgressView)
    addSubview(startStopButton)
    startStopButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
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
      
      startStopButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      startStopButton.topAnchor.constraint(equalTo: circularProgressView.timeText.bottomAnchor, constant: 8.0),
    ])
  }
  
}

extension PomodoroView: SegmentedControlProtocol {
  
  func initSegmentedControl() {
    self.timerManager.setDuration(duration: Time.pomodoro.rawValue)
  }
  
  @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
    self.buttonCount = 0
    checkButtonStatus()
    self.timerManager.stopTimer()
    self.timerManager.setDuration(duration: timerManager.getDuration(index: sender.selectedSegmentIndex))
  }
  
}

extension PomodoroView: StartStopButtonProtocol {
  @objc func buttonPressed(_ sender: UIButton) {
    buttonCount += 1
    checkButtonStatus()
  }
  
  func checkButtonStatus() {
    switch buttonCount {
    case 1:
      timerManager.initTimer()
      startStopButton.setButtonTitle(.pause)
    case let x where x % 2 == 0:
      // pause
      timerManager.pauseTimer()
      startStopButton.setButtonTitle(.start)
    case let x where x % 2 != 0:
      // start
      timerManager.resumeTimer()
      startStopButton.setButtonTitle(.pause)
    default: fatalError("index not found")
    }
  }
}

