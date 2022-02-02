//
//  ConfigurationViewController.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 01/02/22.
//

import UIKit

class ConfigurationViewController: UIViewController {
  
  var colorManager: ColorManager?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = ConfigurationView(frame: .zero, colorManager: colorManager ?? .init())
  }
}
