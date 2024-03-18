//
//  ViewController.swift
//  ClapBeat
//
//  Created by 椙本洸希 on 2022/11/12.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return repeatNumbersForPicker[row] as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        repeatCount = row+1
    }
    

    //PickerView
    @IBOutlet weak var pickerView: UIPickerView!
    
    let clapInstance = Clap()
    var repeatNumbersForPicker = NSMutableArray()
    var repeatCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        repeatCount = 1
        
        for i in 0 ..< 10 {
            let numberText = String(format: "%d回", i+1)
            repeatNumbersForPicker[i] = numberText
        }
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    //Buttonクリックした
    @IBAction func play(_ sender: Any) {
        clapInstance.repeatClap(count: repeatCount)
    }

}

