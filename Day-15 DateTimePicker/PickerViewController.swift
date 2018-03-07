//
//  PickerViewController.swift
//  Day-15 DateTimePicker
//
//  Created by Prashant Gaikwad on 2/22/18.
//  Copyright © 2018 Prashant Gaikwad. All rights reserved.
//

import UIKit
import RxSwift
/*
protocol datetimePickerDelegate {
    func getDateTimePickerValue(_ datetime:String)
  }
*/
class PickerViewController: UIViewController {

 // var  delegate:datetimePickerDelegate?
  
  private var selectedCharacterVariable = Variable("Time")
  var selectedCharater:Observable<String> {
    return selectedCharacterVariable.asObservable()
  }
  
  var timeStr: String = ""
  var dateStr: String = ""
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var timePicker: UIDatePicker!
  

  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    
    timePicker.datePickerMode = .time
    timePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)
    

    
    }
  
  @objc func timeChanged(_ sender: UIDatePicker) {
    let components = Calendar.current.dateComponents([.hour,.minute], from: sender.date)
    if let hours = components.hour, let mins = components.minute {
      print("\(hours) \(mins)")
      timeStr = String(describing:hours) + ":" + String(describing:mins)
    }
  }

  @objc func dateChanged(_ sender: UIDatePicker) {
    let componenets = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
    if let day = componenets.day, let month = componenets.month, let year = componenets.year {
      print("\(day) \(month) \(year)")
      dateStr = String(describing:day) + " / " + String(describing:month) + " / " + String(describing:year)
    }
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func cancelAction(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func setAction(_ sender: Any) {
    
    
    selectedCharacterVariable.value = dateStr + " at " + timeStr
    
    /*
    if let deleObj = delegate {
      deleObj.getDateTimePickerValue(dateStr + " at " + timeStr)
    }
 */
    
    self.dismiss(animated: true, completion: nil)
    
  }
  
  
  
}
