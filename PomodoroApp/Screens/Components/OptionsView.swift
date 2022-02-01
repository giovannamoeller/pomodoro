//
//  OptionsView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class OptionsView: UISegmentedControl {
  
  private var buttonCount = 0
  
  private var timerManager: TimerManager?
  
  private lazy var segmentedControlView: UISegmentedControl = {
    let view = UISegmentedControl()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.insertSegment(withTitle: "pomodoro", at: 0, animated: true)
    view.insertSegment(withTitle: "short break", at: 1, animated: true)
    view.insertSegment(withTitle: "long break", at: 2, animated: true)
    view.selectedSegmentIndex = 0
    
    //view.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal, barMetrics: .default)
    
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    view.selectedSegmentTintColor = UIColor(named: "Color1")
    
    let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonTextColorDisabled")!.withAlphaComponent(0.4), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
    let highlitedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "HighlightedButtonColor")!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
    view.setTitleTextAttributes(titleTextAttributes, for: .normal)
    view.setTitleTextAttributes(highlitedTitleTextAttributes, for: .selected)
    
    timerManager?.setDuration(duration: Time.pomodoro.rawValue)
    
    view.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
    return view
  }()
  
  @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
    self.buttonCount = 0
    //checkButtonStatus()
    timerManager?.stopTimer()
    timerManager?.setDuration(duration: timerManager?.getDuration(index: segmentedControlView.selectedSegmentIndex) ?? 0)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(segmentedControlView)
    translatesAutoresizingMaskIntoConstraints = false
    setUpConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      segmentedControlView.heightAnchor.constraint(equalToConstant: 52.0),
      segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
      segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
    ])
  }
  
  
}
