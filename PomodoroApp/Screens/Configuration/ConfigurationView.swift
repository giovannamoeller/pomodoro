//
//  ConfigurationView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class ConfigurationView: UIView {
  
  func changeFont(font: Font) {
    settingsText.font = .systemFont(size: 18.0, weight: .bold, fontFamily: font)
    fontText.font = UIFont.changeTextFont(font: font)
    colorText.font = UIFont.changeTextFont(font: font)
    applyChangesButton.titleLabel?.font = .systemFont(size: 16.0, weight: .bold, fontFamily: font)
  }
  
  private lazy var buttonWidth = 52.0
  private var colorSelected: UIColor
  private var fontSelected: Font
  
  var colorManager: ColorManager?
  var fontManager: FontManager?
  
  private lazy var settingsText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.text = "Settings"
    text.textColor = UIColor(named: "DarkBackgroundColor")
    text.font = .systemFont(size: 18.0, weight: .bold, fontFamily: fontSelected)
    return text
  }()
  
  private lazy var colorText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    let attributedString = NSAttributedString(
      string: "color".uppercased(), attributes: [
        NSAttributedString.Key.kern: 2.0,
        NSAttributedString.Key.font: UIFont.changeTextFont(font: fontSelected),
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
    button.addTarget(self, action: #selector(colorButtonPressed(_:)), for: .touchUpInside)
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
    button.addTarget(self, action: #selector(colorButtonPressed(_:)), for: .touchUpInside)
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
    button.addTarget(self, action: #selector(colorButtonPressed(_:)), for: .touchUpInside)
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
      NSAttributedString.Key.font: UIFont.systemFont(size: 14.0, weight: .bold, fontFamily: fontSelected),
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
    button.setTitle("Aa", for: .normal)
    button.titleLabel?.font = .systemFont(size: 18.0, weight: .bold, fontFamily: .defaultOption)
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(fontButtonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "font1"
    buttonReleased(button: button)
    return button
  }()
  
  private lazy var font2: UIButton = {
    let button = UIButton(type: .system)
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.setTitle("Aa", for: .normal)
    button.titleLabel?.font = .systemFont(size: 18.0, weight: .bold, fontFamily: .option2)
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(fontButtonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "font2"
    buttonReleased(button: button)
    return button
  }()
  
  private lazy var font3: UIButton = {
    let button = UIButton(type: .system)
    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    button.setTitle("Aa", for: .normal)
    button.titleLabel?.font = .systemFont(size: 18.0, weight: .bold, fontFamily: .option3)
    button.layer.cornerRadius = buttonWidth / 2.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(fontButtonPressed(_:)), for: .touchUpInside)
    button.restorationIdentifier = "font3"
    buttonReleased(button: button)
    return button
  }()
  
  private lazy var fontButtons = [font1, font2, font3]
  
  private lazy var fontsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    fontButtons.forEach { button in
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
    button.titleLabel?.font = .systemFont(size: 16.0, weight: .bold, fontFamily: fontSelected)
    button.layer.cornerRadius = 24.0
    button.tintColor = .white
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(applyChangesButtonPressed), for: .touchUpInside)
    return button
  }()
  
  init(frame: CGRect, colorManager: ColorManager, fontManager: FontManager) {
    self.colorManager = colorManager
    self.fontManager = fontManager
    self.fontSelected = fontManager.actualFont
    self.colorSelected = colorManager.actualColor
    super.init(frame: frame)
    backgroundColor = .white
    addSubviews()
    setUpConstraints()
    checkFontSelected()
    checkColorSelected()
  }
  
  func checkFontSelected() {
    switch fontSelected {
    case .defaultOption:
      buttonPressed(button: font1)
    case .option2:
      buttonPressed(button: font2)
    case .option3:
      buttonPressed(button: font3)
    }
  }
  
  func addSubviews() {
    addSubview(settingsText)
    settingsText.addBottomLineToView(stickyToBounds: true)
    addSubview(colorText)
    //addBottomLine(colorText)
    addSubview(colorsStackView)
    addSubview(fontText)
    //addBottomLine(fontText)
    addSubview(fontsStackView)
    addSubview(applyChangesButton)
  }
  
  private lazy var colorButtons = [color1, color2, color3]
  
  @objc func colorButtonPressed(_ sender: UIButton) {
    for button in colorButtons {
      deselectColorButton(button: button)
    }
    checkmarkColorButton(button: sender)
    
    switch sender.restorationIdentifier {
    case "color1": colorSelected = UIColor.color1
    case "color2": colorSelected = UIColor.color2
    case "color3": colorSelected = UIColor.color3
    default: fatalError("Color not available.")
    }
    colorManager?.changeColor(color: colorSelected)
  }
  
  func checkColorSelected() {
    switch colorSelected {
    case UIColor(named: "Color1"):
      checkmarkColorButton(button: color1)
    case UIColor(named: "Color2"):
      checkmarkColorButton(button: color2)
    case UIColor(named: "Color3"):
      checkmarkColorButton(button: color3)
    default:
      checkmarkColorButton(button: color1)
    }
  }
  
  func checkmarkColorButton(button: UIButton) {
    let configuration = UIImage.SymbolConfiguration(font: .systemFont(weight: .bold, fontFamily: fontSelected))
    let image = UIImage(systemName: "checkmark", withConfiguration: configuration)
    button.setImage(image, for: .normal)
    button.tintColor = UIColor(named: "DarkBackgroundColor")
  }
  
  func deselectColorButton(button: UIButton) {
    button.setImage(nil, for: .normal)
  }
  
  @objc func fontButtonPressed(_ sender: UIButton) {
    for button in fontButtons {
      buttonReleased(button: button)
    }
    buttonPressed(button: sender)
    switch sender.restorationIdentifier {
    case "font1": fontSelected = Font.defaultOption
    case "font2": fontSelected = Font.option2
    case "font3": fontSelected = Font.option3
    default: fatalError("Font not available.")
    }
    changeFont(font: fontSelected)
    fontManager?.changeFont(font: fontSelected)
  }
  
  func buttonPressed(button: UIButton) {
    button.backgroundColor = UIColor(named: "BackgroundColor")
    button.tintColor = UIColor(named: "ButtonBackgroundColor")
  }
  
  func buttonReleased(button: UIButton) {
    button.backgroundColor = UIColor(named: "ButtonBackgroundColor")
    button.tintColor = UIColor(named: "BackgroundColor")
  }
  
  @objc func applyChangesButtonPressed() {
    fontManager?.setActualFont(font: fontSelected)
    colorManager?.setActualColor(color: colorSelected)
    self.findViewController()?.dismiss(animated: true, completion: nil)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      settingsText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
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
