//
//  ViewController.swift
//  kadai100M
//
//  Created by 椙本洸希 on 2023/07/01.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource {

    @IBOutlet weak var charImage: UIImageView!
    
    @IBOutlet weak var pick: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2;
    }
    
    

}

