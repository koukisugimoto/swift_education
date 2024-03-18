//
//  ViewController.swift
//  DollerYen
//
//  Created by 椙本洸希 on 2022/10/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // 入力金額を扱う変数
    var input:Double = 0.0
    // 換算後の金額を扱う変数
    var result:Double = 0.0
    // 変換レートを扱う変数
    var rate:Double = 0.0
    //「ドル→円」or「円→ドル」のどちらが押されているのかを管理するための変数
    var isYenToDollar:Bool = true
    
    //入力単位(円 or ドル)を表示するLabel用の変数
    @IBOutlet weak var inputCurrency: UILabel!
    //金額を入力するInputField用の変数
    @IBOutlet weak var inputField: UITextField!
    // 通貨レートを表示するLabel用の変数
    @IBOutlet weak var rateLabel: UILabel!
    //「ドル→円」or「円→ドル」を選ぶためのSegmented Control用の変数
    @IBOutlet weak var selector: UISegmentedControl!
    // 換算後の通貨の単位（円 or ドル）を表示するLabel用の変数
    @IBOutlet weak var resultLabel: UILabel!
    // 換算後の金額を表示するLabel用の変数
    @IBOutlet weak var resultCurrency: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 変換レートを設定（例：1ドルあたり80.5円）
        rate = 120.0
        // inputとresultを0に初期化
        input = 0
        result = 0
        // rateLabelの値をrateの値に応じて更新（小数点以下1桁まで）
        rateLabel.text = String(format: "%.1f", rate)
        // 初期状態の計算方法は「円→ドル」に設定
        isYenToDollar = true
        //inputFieldのDelegate通知設定
        inputField.delegate = self;
    }
    
    //換算処理
    func convert(){
        
        if selector.selectedSegmentIndex == 0 {
            
            // 円→ドル変換の場合
            
            //ドルの金額　＝　円の入力値を変換レートで割った値
            result = input / rate
            // 小数点以下2桁までのみをresultLabelに表示
            resultLabel.text = String(format: "%.2f", result)
            
        } else {
            
            // ドル→円変換の場合
            
            // 円の金額　＝　ドルの入力値を変換レートで掛けた値
            result = input * rate

            // 小数点以下を切り捨て、整数部分のみをresultLabelに表示
            resultLabel.text = String(format: "%.0f", result)
            
        }
        
    }
    
    @IBAction func changeCalcMethod(sender: AnyObject) {
        // 左側（円→ドル）が選択された場合（selectorの値が「0」のとき）
        if sender.selectedSegmentIndex == 0 {
            isYenToDollar = true
            inputCurrency.text = "円"
            resultCurrency.text = "ドル"
            // 右側（ドル→円）が選択された場合（selectorの値が「1」のとき）
        } else if sender.selectedSegmentIndex == 1 {
            isYenToDollar = false
            inputCurrency.text = "ドル"
            resultCurrency.text = "円"
        }
        // 通貨を変換
        self.convert()
    }

    // UITextFieldのキーボード上の「Return」ボタンが押された時に呼ばれる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //ユーザから入力された値を変数inputへ格納する
        input = atof(textField.text)
        //キーボードを閉じる
        textField.resignFirstResponder()
        //変換処理の呼び出し
        self.convert()
        //メソッドを終了する
        return true
    }
}

