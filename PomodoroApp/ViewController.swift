//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 28/01/22.
//

import UIKit

class ViewController: UIViewController {
  
  var circularProgressView: CircularProgressView!
  private var buttonCount: Int = 0
  
  private lazy var titleText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.textColor = .white
    text.text = "pomodoro"
    text.font = .systemFont(ofSize: 24.0, weight: .bold)
    return text
  }()
  
  private lazy var ovalImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "oval"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
    imageView.layer.shadowOpacity = 1
    imageView.layer.shadowOffset = .init(width: -20, height: -20)
    imageView.layer.shadowRadius = 40
    return imageView
  }()
  
  private lazy var buttonsView: UISegmentedControl = {
    let view = UISegmentedControl()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.insertSegment(withTitle: "pomodoro", at: 0, animated: true)
    view.insertSegment(withTitle: "short break", at: 1, animated: true)
    view.insertSegment(withTitle: "long break", at: 2, animated: true)
    view.selectedSegmentIndex = 0
    
    //view.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal, barMetrics: .default)
    
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
    
    view.selectedSegmentTintColor = UIColor(named: "Color1")
    
    let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonTextColorDisabled")!.withAlphaComponent(0.4), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
    let highlitedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "HighlightedButtonColor")!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
    view.setTitleTextAttributes(titleTextAttributes, for: .normal)
    view.setTitleTextAttributes(highlitedTitleTextAttributes, for: .selected)
    
    circularProgressView.setDuration(duration: Time.pomodoro.rawValue)
    
    view.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
    return view
  }()
  
  private lazy var timeText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.textColor = .white
    text.font = .systemFont(ofSize: 48.0, weight: .heavy)
    return text
  }()
  
  private lazy var startButton: UIButton = {
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
      print("clicou em start pela primeira vez")
      setButtonTitle("pause")
      circularProgressView.initTimer()
    } else if buttonCount % 2 == 0 {
      // pause
      print("pausou")
      circularProgressView.pauseTimer()
      setButtonTitle("start")
    } else {
      // start
      print("reiniciou")
      circularProgressView.resumeTimer()
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
    startButton.setAttributedTitle(attributedString, for: .normal)
  }
  
  func getDuration() -> TimeInterval {
    var duration: TimeInterval
    switch buttonsView.selectedSegmentIndex {
    case 0: duration = Time.pomodoro.rawValue
    case 1: duration = Time.shortBreak.rawValue
    case 2: duration = Time.longBreak.rawValue
    default: fatalError("Index not found")
    }
    return duration
  }
  
  @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
    self.buttonCount = 0
    checkButtonStatus()
    circularProgressView.stopTimer()
    circularProgressView.setDuration(duration: getDuration())
  }
  
  
  private lazy var configButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(systemName: "gearshape.fill"), for: .normal)
    button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
    button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
    button.tintColor = UIColor(named: "ButtonTextColorDisabled")?.withAlphaComponent(0.4)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    circularProgressView = CircularProgressView(frame: .zero, timeText: timeText, startStopButton: startButton)
    addSubviews()
    configureUI()
    setUpConstraints()
  }
  
  func addSubviews() {
    view.addSubview(titleText)
    view.addSubview(ovalImageView)
    view.addSubview(circularProgressView)
    view.addSubview(buttonsView)
    view.addSubview(configButton)
    view.addSubview(timeText)
    view.addSubview(startButton)
  }
  
  func configureUI() {
    view.backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    circularProgressView.center = view.center
    NSLayoutConstraint.activate([
      
      titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
      
      buttonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      buttonsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      buttonsView.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 32.0),
      buttonsView.heightAnchor.constraint(equalToConstant: 52),
      
      ovalImageView.centerYAnchor.constraint(equalTo: circularProgressView.centerYAnchor),
      ovalImageView.centerXAnchor.constraint(equalTo: circularProgressView.centerXAnchor),
      
      configButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      configButton.topAnchor.constraint(equalTo: ovalImageView.bottomAnchor, constant: -64.0),
      
      timeText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      timeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      startButton.topAnchor.constraint(equalTo: timeText.bottomAnchor, constant: 8.0)
    ])
  }
  
  
}


