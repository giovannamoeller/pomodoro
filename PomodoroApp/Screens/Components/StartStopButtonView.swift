//
//  StartStopButtonView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class StartStopButtonView: UIView {
  
  var buttonCount = 0
  var timerManager: TimerManager?
  
  private lazy var startStopButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    let attributedString = NSAttributedString(
      string: "start".uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor.white
     ]
    )
    button.setAttributedTitle(attributedString, for: .normal)
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    return button
  }()
  
  @objc func buttonPressed(_ sender: UIButton) {
    self.buttonCount += 1
    checkButtonStatus()
  }
  
  func checkButtonStatus() {
    if self.buttonCount == 1 {
      setButtonTitle("pause")
      timerManager?.initTimer()
    } else if buttonCount % 2 == 0 {
      // pause
      timerManager?.pauseTimer()
      setButtonTitle("start")
    } else {
      // start
      timerManager?.resumeTimer()
      setButtonTitle("pause")
    }
  }
  
  private func setButtonTitle(_ str: String) {
    let attributedString = NSAttributedString(
      string: str.uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor.white
     ]
    )
    startStopButton.setAttributedTitle(attributedString, for: .normal)
  }
  
  func updateTimer(timerManager: TimerManager) {
    self.timerManager = timerManager
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
