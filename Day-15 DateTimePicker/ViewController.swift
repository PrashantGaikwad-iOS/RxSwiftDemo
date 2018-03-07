//
//  ViewController.swift
//  Day-15 DateTimePicker
//
//  Created by Prashant Gaikwad on 2/22/18.
//  Copyright © 2018 Prashant Gaikwad. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController { //datetimePickerDelegate {

  let disposeBag = DisposeBag()
  @IBOutlet weak var dateTimeLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func gotoNextView(_ sender: Any) {
    let nextVC = storyboard?.instantiateViewController(withIdentifier: "PickerViewController") as! PickerViewController
   //  nextVC.delegate = self
    
    nextVC.selectedCharater
      .subscribe(onNext: { [weak self] time in
        
        self?.dateTimeLabel.text = time
      }).disposed(by: disposeBag)
    
    
    navigationController?.present(nextVC, animated: true, completion: nil)
  }
  
  func getDateTimePickerValue(_ datetime: String) {
  //  dateTimeLabel.text = datetime
  }
  
  
}

