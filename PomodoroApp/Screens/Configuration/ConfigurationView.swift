//
//  ConfigurationView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class ConfigurationView: UIView {
  
  private lazy var buttonWidth = 52.0
  private lazy var colorSelected = UIColor(named: "Color3")
  private lazy var fontSelected = Font.defaultOption
  
  var colorManager: ColorManager?
  var fontManager: FontManager?
  
  private lazy var settingsText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.text = "Settings"
    text.textColor = UIColor(named: "DarkBackgroundColor")
    text.font = .init(name: Font.option3.rawValue, size: 18.0)
    return text
  }()
  
  private lazy var colorText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    let attributedString = NSAttributedString(
      string: "color".uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
        NSAttributedString.Key.foregroundColor: UIColor(named: "DarkBackgroundColor")!
     ]
    )
    text.attributedText = attributedString
    return text
  }()
  
  private lazy var color1: UIButton = {
    let button = UIButton()
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.backgroundColor = UIColor(named: "Color1")
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "color1"
    return button
  }()
  
  private lazy var color2: UIButton = {
    let button = UIButton()
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.backgroundColor = UIColor(named: "Color2")
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "color2"
    return button
  }()
  
  private lazy var color3: UIButton = {
    let button = UIButton()
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.backgroundColor = UIColor(named: "Color3")
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "color3"
    return button
  }()
  
  private lazy var colorsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    [color1, color2, color3].forEach { button in
      stackView.addArrangedSubview(button)
    }
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 16
    return stackView
  }()
  
  //MARK: Font
  
  private lazy var fontText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    let attributedString = NSAttributedString(
      string: "font".uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
        NSAttributedString.Key.foregroundColor: UIColor(named: "DarkBackgroundColor")!
     ]
    )
    text.attributedText = attributedString
    return text
  }()
  
  private lazy var font1: UIButton = {
    let button = UIButton(type: .system)
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.backgroundColor = UIColor(named: "ButtonBackgroundColor")
    button.setTitle("Aa", for: .normal)
    button.tintColor = UIColor(named: "BackgroundColor")
    button.titleLabel?.font = .init(name: Font.defaultOption.rawValue, size: 18.0)
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "font1"
    return button
  }()
  
  private lazy var font2: UIButton = {
    let button = UIButton(type: .system)
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.backgroundColor = UIColor(named: "ButtonBackgroundColor")
    button.setTitle("Aa", for: .normal)
    button.tintColor = UIColor(named: "BackgroundColor")
    button.titleLabel?.font = .init(name: Font.option2.rawValue, size: 18.0)
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "font2"
    return button
  }()
  
  private lazy var font3: UIButton = {
    let button = UIButton(type: .system)
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.backgroundColor = UIColor(named: "ButtonBackgroundColor")
    button.setTitle("Aa", for: .normal)
    button.tintColor = UIColor(named: "BackgroundColor")
    button.titleLabel?.font = .init(name: Font.option3.rawValue, size: 18.0)
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "font3"
    return button
  }()
  
  
  private lazy var fontsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    [font1, font2, font3].forEach { button in
      stackView.addArrangedSubview(button)
    }
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 16
    return stackView
  }()
  
  private lazy var applyChangesButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor(named: "Color1")
    button.setTitle("Apply", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
    button.layer.cornerRadius = 24.0
    button.tintColor = .white
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(applyChangesButtonPressed), for: .touchUpInside)
    return button
  }()
  
  init(frame: CGRect, colorManager: ColorManager, fontManager: FontManager) {
    super.init(frame: frame)
    self.colorManager = colorManager
    self.fontManager = fontManager
    backgroundColor = .white
    addSubviews()
    setUpConstraints()
  }
  
  func addSubviews() {
    addSubview(settingsText)
    addSubview(colorText)
    addSubview(colorsStackView)
    addSubview(fontText)
    addSubview(fontsStackView)
    addSubview(applyChangesButton)
  }
  
  @objc func buttonPressed(_ sender: UIButton) {
    
    let buttons = [font1, font2, font3]
    
    for button in buttons {
      //print(button.isSelected)
    }
    /*if let identifier = sender.restorationIdentifier {
      switch identifier {
      case "color1":
        colorManager?.changeColor(color: .init(named: "Color1") ?? .clear)
        fontManager?.changeFont(font: .defaultOption)
      case "color2": colorManager?.changeColor(color: .init(named: "Color2") ?? .clear)
      case "color3": colorManager?.changeColor(color: .init(named: "Color3") ?? .clear)
      default: fatalError("identifier not found")
      }
    }*/
  }
  
  @objc func applyChangesButtonPressed() {
    colorManager?.changeColor(color: self.colorSelected ?? .clear)
    fontManager?.changeFont(font: fontSelected)
    self.findViewController()?.dismiss(animated: true, completion: nil)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      settingsText.centerXAnchor.constraint(equalTo: centerXAnchor),
      settingsText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32.0),
      
      colorText.centerXAnchor.constraint(equalTo: centerXAnchor),
      colorText.topAnchor.constraint(equalTo: settingsText.bottomAnchor, constant: 64.0),
      
      colorsStackView.topAnchor.constraint(equalTo: colorText.bottomAnchor, constant: 32.0),
      colorsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      fontText.centerXAnchor.constraint(equalTo: centerXAnchor),
      fontText.topAnchor.constraint(equalTo: colorsStackView.bottomAnchor, constant: 64.0),
      
      fontsStackView.topAnchor.constraint(equalTo: fontText.bottomAnchor, constant: 32.0),
      fontsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      applyChangesButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      applyChangesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64.0),
      applyChangesButton.widthAnchor.constraint(equalToConstant: 124.0),
      applyChangesButton.heightAnchor.constraint(equalToConstant: 48.0)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
