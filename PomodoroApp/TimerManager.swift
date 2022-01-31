//
//  TimerManager.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 30/01/22.
//

import Foundation

class TimerManager {
  var timer: Timer = Timer()
  var runCount = 0
  var duration: TimeInterval = 0
  
  func stopTimer() {
    timer.invalidate()
  }
  
  func resumeTimer() {
    initTimer(isRepeating: true)
  }
  
  func initTimer(isRepeating: Bool = false) {
    if !isRepeating {
      self.runCount = 0
    }
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      self.runCount += 1
      //self.timeText?.text = String((self.duration * 60) - Double(self.runCount))
      if self.runCount == Int(self.duration * 60) {
        self.stopTimer()
      }
    }
    timer.fire()
  }
}
