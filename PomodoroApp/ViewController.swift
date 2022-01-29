//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 28/01/22.
//

import UIKit

class ViewController: UIViewController {
  
  var circularProgressView: CircularProgressView!
  
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
  
  private lazy var pomodoroButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("pomodoro", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
    button.tintColor = UIColor(named: "ButtonTextColorDisabled")?.withAlphaComponent(0.4)
    button.backgroundColor = UIColor(named: "Color1")
    button.clipsToBounds = true
    button.layer.cornerRadius = 26
    button.layer.cornerCurve = .continuous
    
    return button
  }()
  
  private lazy var shortBreakButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("short break", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
    button.tintColor = UIColor(named: "ButtonTextColorDisabled")?.withAlphaComponent(0.4)
    return button
  }()
  
  private lazy var longBreakButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("long break", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
    button.tintColor = UIColor(named: "ButtonTextColorDisabled")?.withAlphaComponent(0.4)
    return button
  }()
  
  private lazy var buttonsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    [pomodoroButton, shortBreakButton, longBreakButton].forEach { button in
      stackView.addArrangedSubview(button)
    }
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.backgroundColor = UIColor(named: "DarkBackgroundColor")
    stackView.layer.cornerRadius = 32.0
    stackView.layoutMargins = .init(top: 8, left: 8, bottom: 8, right: 8)
    stackView.isLayoutMarginsRelativeArrangement = true
    return stackView
  }()
  
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
    circularProgressView = CircularProgressView(frame: .zero, duration: 25 * 60)
    addSubviews()
    configureUI()
    setUpConstraints()
  }
  
  func addSubviews() {
    view.addSubview(titleText)
    view.addSubview(ovalImageView)
    view.addSubview(circularProgressView)
    //view.addSubview(timeText)
    view.addSubview(buttonsStackView)
    view.addSubview(configButton)
  }
  
  func configureUI() {
    view.backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    circularProgressView.center = view.center
    NSLayoutConstraint.activate([
      
      titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
      
      buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      buttonsStackView.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 32.0),
      buttonsStackView.heightAnchor.constraint(equalToConstant: 64),
      
      ovalImageView.centerYAnchor.constraint(equalTo: circularProgressView.centerYAnchor),
      ovalImageView.centerXAnchor.constraint(equalTo: circularProgressView.centerXAnchor),
      
      configButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      configButton.topAnchor.constraint(equalTo: ovalImageView.bottomAnchor, constant: -64.0)
    ])
  }
  
}

