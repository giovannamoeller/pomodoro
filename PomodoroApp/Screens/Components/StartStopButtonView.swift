//
//  StartStopButtonView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class StartStopButtonView: UIButton {
  
  private lazy var buttonCount = 0
  
  var timerManager: TimerManager?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setTimerManager(timerManager: TimerManager) {
    self.timerManager = timerManager
  }
  
  func configureUI() {
    translatesAutoresizingMaskIntoConstraints = false
    let attributedString = NSAttributedString(
      string: Button.start.rawValue.uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor.white
     ]
    )
    setAttributedTitle(attributedString, for: .normal)
    addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
  }
  
  @objc func buttonPressed(_ sender: UIButton) {
    print("porra")
    buttonCount += 1
    checkButtonStatus()
  }
  
  func checkButtonStatus() {
    switch buttonCount {
    case 1:
      setButtonTitle(.pause)
      //timerManager?.initTimer()
    case let x where x % 2 == 0:
      // pause
      //timerManager?.pauseTimer()
      setButtonTitle(.start)
    case let x where x % 2 != 0:
      // start
      //timerManager?.resumeTimer()
      setButtonTitle(.pause)
    default: fatalError("index not found")
    }
  }
  
  private func setButtonTitle(_ button: Button) {
    let attributedString = NSAttributedString(
      string: button.rawValue.uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor.white
     ]
    )
    setAttributedTitle(attributedString, for: .normal)
  }
  
  func updateTimer(timerManager: TimerManager) {
    //self.timerManager = timerManager
  }
}
