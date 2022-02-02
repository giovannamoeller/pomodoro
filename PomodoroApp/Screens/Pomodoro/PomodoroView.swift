//
//  PomodoroView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

protocol ViewControllerDelegate {
  func presentConfigurationView()
}

protocol SegmentedControlProtocol {
  func initSegmentedControl()
  func segmentedControlChanged(_ sender: UISegmentedControl)
}

protocol StartStopButtonProtocol {
  func buttonPressed(_ sender: UIButton)
  func checkButtonStatus()
}

protocol ConfigurationButtonProtocol {
  func configurationButtonPressed(_ sender: UIButton)
}


class PomodoroView: UIView, TimerManagerDelegate, ColorManagerDelegate {
  
  func changeColor(color: UIColor) {
    optionsView.selectedSegmentTintColor = color
    circularProgressView.stopAnimation()
    circularProgressView.changeProgressColor(color: color)
  }
  
  func setText(duration: TimeInterval) {
    circularProgressView.setText(duration: duration)
  }
  
  private lazy var pomodoroTitleTextView = PomodoroTextView()
  private lazy var optionsView = OptionsView(frame: .zero)
  private lazy var circularProgressView = CircularProgressView()
  private lazy var configurationButtonView = ConfigurationButtonView()
  private lazy var startStopButton = StartStopButtonView()
  
  private lazy var buttonCount = 0
  
  var timerManager = TimerManager()
  var colorManager = ColorManager()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    timerManager.delegate = self
    colorManager.delegate = self
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
    configurationButtonView.addTarget(self, action: #selector(configurationButtonPressed(_:)), for: .touchUpInside)
  }
  
  func configureUI() {
    backgroundColor = UIColor(named: "BackgroundColor")
    optionsView.selectedSegmentTintColor = ColorManager.actualColor
    circularProgressView.changeProgressColor(color: ColorManager.actualColor)
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
    circularProgressView.setDuration(duration: timerManager.duration * 60)
  }
  
  @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
    self.buttonCount = 0
    checkButtonStatus()
    circularProgressView.stopAnimation()
    self.timerManager.pauseTimer()
    self.timerManager.setDuration(duration: timerManager.getDuration(index: sender.selectedSegmentIndex))
    circularProgressView.setDuration(duration: timerManager.duration * 60)
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
      startStopButton.setButtonTitle(.pause)
      timerManager.initTimer()
      circularProgressView.progressAnimation()
      circularProgressView.resumeProgress()
    case let x where x % 2 == 0:
      startStopButton.setButtonTitle(.start)
      timerManager.pauseTimer()
      circularProgressView.pauseProgress()
    case let x where x % 2 != 0:
      startStopButton.setButtonTitle(.pause)
      timerManager.resumeTimer()
      circularProgressView.resumeProgress()
    default: fatalError("index not found")
    }
  }
}

extension PomodoroView: ConfigurationButtonProtocol {
  @objc func configurationButtonPressed(_ sender: UIButton) {
    let vc = ConfigurationViewController()
    vc.colorManager = colorManager
    self.findViewController()?.present(vc, animated: true, completion: nil)
  }
}
