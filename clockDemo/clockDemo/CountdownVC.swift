//
//  CountdownVC.swift
//  clockDemo
//
//  Created by Hasan Ali on 15.03.2020.
//  Copyright © 2020 Hasan Ali Şişeci. All rights reserved.
//

import UIKit

class CountdownVC: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    @IBOutlet weak var timeField: UITextField!
    
    let datePicker = UIDatePicker()
    var timer = Timer()
    var counter : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()

    }
    
    @IBAction func startClicked(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownMethod), userInfo: nil, repeats: true)
        counter = Int(timeField.text!)!
        timeLabel.text = String(counter)
        startOutlet.isEnabled = false
        
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        timer.invalidate()
        counter = Int(timeField.text!)!
        timeLabel.text = String(counter)
        startOutlet.isEnabled = true
    }
    
    @objc func countdownMethod() {
        if counter == 0 {
            timer.invalidate()
            showAlert()
            counter = Int(timeField.text!)!
            startOutlet.isEnabled = true
        } else {
        counter -= 1
        timeLabel.text = String(counter)

        }
        
    }
    
    
    func createDatePicker() {
        
        //DatePicker'da oluşan tarihi textfield'a kaydetmek için kullancağımız butonu koyacağımız barı oluşturuyoruz.
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Barda bulunacak butonu oluşturduk.
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([doneButton], animated: true)
        
        //inputAccessoryView : Text field için sistem tarafından sunulan klavyeye aksesuar görünümü eklemek için kullanıyoruz. Bizde butonumuz için bir toolbar ekliyoruz.
        timeField.inputAccessoryView = toolbar
        
        //inputAccessoryView : Text field için sistem tarafından sunulan klavyenin yerini alacak bir görünüm eklemek için kullanıyoruz. Bizde klavye yerine datePicker kullanıyoruz.
        timeField.inputView = datePicker
        
        //DatePicker'ımızın modunu belirliyor. Tarih, saat, zamanlayıcı gibi.
        datePicker.datePickerMode = .countDownTimer
    }
    
    @objc func doneButtonClicked() {
           
           //Yazdıracağımız formatı saniye cinsinden sayı olarak belirliyoruz.
           //Örneğin 1 saat 3600 saniye olarak işlem görcek
           let formatter = NumberFormatter()
            
        
           //Text field'a date picker'dan gelen değeri yazdırıyoruz.
        timeField.text = formatter.string(from: NSNumber(value: datePicker.countDownDuration))
           
           //Done butonuna bastıktan sonra klavyemizin kapanacağını söylüyruz.
           self.view.endEditing(true)
       }
    
    func showAlert() {
        let alert = UIAlertController(title: "UPS!", message: "Time's Out !", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }

}
