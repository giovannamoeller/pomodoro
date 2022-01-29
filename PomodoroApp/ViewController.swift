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
  }
  
  func configureUI() {
    view.backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    circularProgressView.center = view.center
    NSLayoutConstraint.activate([
      //timeText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      //timeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      ovalImageView.centerYAnchor.constraint(equalTo: circularProgressView.centerYAnchor),
      ovalImageView.centerXAnchor.constraint(equalTo: circularProgressView.centerXAnchor),
    ])
  }
  
}

