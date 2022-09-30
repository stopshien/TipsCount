//
//  ViewController.swift
//  TipsCount
//
//  Created by stopshien on 2022/6/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneySpend: UITextField!
    
    @IBOutlet weak var txtMember: UITextField!
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var TipsLabel: UILabel!
    
    @IBOutlet weak var ShareLabel: UILabel!
    
    @IBOutlet weak var TipsSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //點擊空白處收合鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func BtnCalculator(_ sender: Any) {
        var finalTotal : Double
        var finalTips : Double
        var finalShare : Double
        
        if TipsSwitch.isOn{
            if moneySpend.text != "" && txtMember.text != ""{
            finalTotal = Double(moneySpend.text!)! * 1.1
            finalTips = Double(moneySpend.text!)! * 0.1
            finalShare = finalTotal / Double(txtMember.text!)!
            
            TotalLabel.text = "$" + String(format:"%.2f" , finalTotal)
            TipsLabel.text = "$" + String(format:"%.2f" , finalTips)
            ShareLabel.text = "$\((finalShare + 0.49).rounded())"
            }else{}
            
        }else{
            if moneySpend.text != "" && txtMember.text != ""{
            finalTotal = Double(moneySpend.text!)!
            finalTips = 0
            finalShare = finalTotal / Double(txtMember.text!)!
                
            TotalLabel.text = "$" + String(format:"%.2f" , finalTotal)
            TipsLabel.text = "$" + String(format:"%.2f" , finalTips)
            ShareLabel.text = "$\((finalShare + 0.49).rounded())"
            }else{}
        }
        moneySpend.resignFirstResponder()
        txtMember.resignFirstResponder()
    }
    
    @IBAction func BtnClear(_ sender: Any) {
        clear()
        moneySpend.resignFirstResponder()
        txtMember.resignFirstResponder()
    }
    //清空TextFeild以及Label
        func clear(){
            moneySpend.text = ""
            txtMember.text = ""
            TotalLabel.text = ""
            TipsLabel.text = ""
            ShareLabel.text = ""
}
    //改變圓角
    func corner(){
        TotalLabel.layer.cornerRadius = 20
        TotalLabel.layer.masksToBounds = true
    }
}

/* 使用程式碼顯示圖形
let fullScreen = UIScreen.main.bounds.size
let firstScreen = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
firstScreen.backgroundColor = UIColor.yellow
self.view.addSubview(firstScreen)

firstScreen.center = CGPoint(x: fullScreen.width * 0.5, y: fullScreen.height * 0.5)

firstScreen.layer.cornerRadius = 100
*/
