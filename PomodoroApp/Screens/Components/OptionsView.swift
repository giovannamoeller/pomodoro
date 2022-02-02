//
//  OptionsView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class OptionsView: UISegmentedControl {
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    translatesAutoresizingMaskIntoConstraints = false
    insertSegment(withTitle: "pomodoro", at: 0, animated: true)
    insertSegment(withTitle: "short break", at: 1, animated: true)
    insertSegment(withTitle: "long break", at: 2, animated: true)
    selectedSegmentIndex = 0
    //setBackgroundImage(UIImage(named: "Rectangle"), for: .normal, barMetrics: .default)
    backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    selectedSegmentTintColor = UIColor(named: "Color1")
    let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonTextColorDisabled")!.withAlphaComponent(0.4), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
    let highlitedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "HighlightedButtonColor")!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
    setTitleTextAttributes(titleTextAttributes, for: .normal)
    setTitleTextAttributes(highlitedTitleTextAttributes, for: .selected)
  }
  
}
