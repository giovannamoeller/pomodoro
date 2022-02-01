//
//  String+Extension.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 30/01/22.
//

import Foundation

extension String {
  func formatToMinute(from time: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.allowsFractionalUnits = true
    let formattedString = formatter.string(from: time)!
    return formattedString
  }
}
