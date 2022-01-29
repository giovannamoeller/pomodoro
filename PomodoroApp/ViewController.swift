//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 28/01/22.
//

import UIKit

class ViewController: UIViewController {
  
  var circularProgressView: CircularProgressView!
  
  private lazy var ovalImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "oval"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var pomodoroButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("pomodoro", for: .normal)
    button.tintColor = UIColor(named: "ButtonTextColorDisabled")
    return button
  }()
  
  private lazy var buttonsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(pomodoroButton)
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.backgroundColor = UIColor(named: "DarkBackgroundColor")
    stackView.layer.cornerRadius = 32.0
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    circularProgressView = CircularProgressView(frame: .zero, duration: 25 * 60)
    addSubviews()
    configureUI()
    setUpConstraints()
  }
  
  func addSubviews() {
    view.addSubview(ovalImageView)
    view.addSubview(circularProgressView)
    //view.addSubview(timeText)
    view.addSubview(buttonsStackView)
  }
  
  func configureUI() {
    view.backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    circularProgressView.center = view.center
    NSLayoutConstraint.activate([
      
      buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
      buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
      buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
      buttonsStackView.heightAnchor.constraint(equalToConstant: 64),
      
      ovalImageView.centerYAnchor.constraint(equalTo: circularProgressView.centerYAnchor),
      ovalImageView.centerXAnchor.constraint(equalTo: circularProgressView.centerXAnchor),
    ])
  }
  
}

