//
//  CalculationViewController.swift
//  ProkShutters
//
//  Created by Andrey Krit on 10/10/17.
//  Copyright © 2017 Andrey Krit. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class CalculationViewController: UIViewController {
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var profileTextField: UITextField!
    @IBOutlet weak var installationFeatureSegmentedControl: UISegmentedControl!
    @IBOutlet weak var controlTypeTextField: UITextField!
    @IBOutlet weak var driveChoiceSegment: UISegmentedControl!
    @IBOutlet weak var driveControlStackView: UIStackView!
    @IBOutlet weak var nhkView: UIView!
    @IBOutlet weak var additionalDriveMaterial: UITextField!
    @IBOutlet weak var remoteControlView: UIView!
    @IBOutlet weak var builtInRecieverSwitch: UISwitch!
    @IBOutlet weak var driveTextField: UITextField!
    @IBOutlet weak var remoteControlTextField: UITextField!
    @IBOutlet weak var buttonControlTextField: UITextField!
    @IBOutlet weak var lockingView: UIView!
    @IBOutlet weak var casseteView: UIView!
    @IBOutlet weak var springView: UIView!
    @IBOutlet weak var nhkSwitch: UISwitch!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var driveSegmentView: UIView!
    
    
    let colorPicker = UIPickerView()
    let profilePicker = UIPickerView()
    let controlTypePicker = UIPickerView()
    let drivePicker = UIPickerView()
    let remoteControlPicker = UIPickerView()
    let controlButtonPicker = UIPickerView()
    let additionalDriveMaterialPicker = UIPickerView()
    
    var controlDataSource: [String] = ["кассета", "пружина", "червячный механизм", "подъемник + трос", "автоматика"]
    var colorsDataSource: [String] = ["белый", "коричневый", "серый", "бежевый"]
    var profileDataSource: [String] = ["39", "45", "55", "45 экстр."]
    var driveDataSource: [String] = ["40/13 Nm крутой двигатель", "50/28 Nm крутой двигатель", "50/35 Nm более крутой двигатель"]
    var remoteControlDataSource = ["1 кан.", "2 кан.", "3 кан.", "5 кан.", "15 кан."]
    var controlButtonDataSource = ["без выключателя", "клавишный выключатель", "выключаель на ключе", "выключатель с приемником"]
    var additionalDriveMaterialDataSource = ["какие-то кольца", "еще какие-то штуки"]
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        fillView()
        configurePickerViews()
        configureTextFieldsInputViews()
        setTextFieldDelegates()
    }
    
    private func fillView() {
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        additionalDriveMaterial.isHidden = true
        springView.isHidden = true
        remoteControlView.isHidden = true
        driveControlStackView.isHidden = true
        springView.isHidden = true
    }
    
    private func setupViewProperties() {
        resultView.layer.cornerRadius = 6
        resultView.setShadow()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func configurePickerViews() {
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        profilePicker.delegate = self
        profilePicker.dataSource = self
        
        controlTypePicker.delegate = self
        controlTypePicker.dataSource = self
        
        drivePicker.delegate = self
        drivePicker.dataSource = self
       
        remoteControlPicker.delegate = self
        remoteControlPicker.dataSource = self
        
        controlButtonPicker.delegate = self
        controlButtonPicker.dataSource = self
        
        additionalDriveMaterialPicker.dataSource = self
        additionalDriveMaterialPicker.delegate = self
        
        
    }
    
    private func configureTextFieldsInputViews() {
        
        controlTypeTextField.inputView = controlTypePicker
        controlTypeTextField.inputView?.backgroundColor = UIColor.white
        colorTextField.inputView = colorPicker
        colorTextField.inputView?.backgroundColor = UIColor.white
        profileTextField.inputView = profilePicker
        profileTextField.inputView?.backgroundColor = UIColor.white
        driveTextField.inputView = drivePicker
        driveTextField.inputView?.backgroundColor = UIColor.white
        remoteControlTextField.inputView = remoteControlPicker
        remoteControlTextField.inputView?.backgroundColor = UIColor.white
        buttonControlTextField.inputView = controlButtonPicker
        buttonControlTextField.inputView?.backgroundColor = UIColor.white
        additionalDriveMaterial.inputView = additionalDriveMaterialPicker
        additionalDriveMaterial.inputView?.backgroundColor = UIColor.white
    }
    
    private func setTextFieldDelegates() {
        controlTypeTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nhkSwitchChanged(_ sender: UISwitch) {
        //remoteControlView.isHidden = sender.isOn && builtInRecieverSwitch.isOn
    }
    
    @IBAction func builtInRecieverSwitchChanged(_ sender: UISwitch) {
        nhkView.isHidden = sender.isOn
        if sender.isOn {
            nhkSwitch.isOn = !sender.isOn
        }
        remoteControlView.isHidden = !sender.isOn
        buttonControlTextField.text = "без выключателя"
    }
}

extension CalculationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case colorPicker:
            return colorsDataSource.count
        case profilePicker:
            return profileDataSource.count
        case controlTypePicker:
            return controlDataSource.count
        case drivePicker:
            return driveDataSource.count
        case remoteControlPicker:
            return remoteControlDataSource.count
        case controlButtonPicker:
            return controlButtonDataSource.count
        case additionalDriveMaterialPicker:
            return additionalDriveMaterialDataSource.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colorPicker:
            return colorsDataSource[row]
        case profilePicker:
            return profileDataSource[row]
        case controlTypePicker:
            return controlDataSource[row]
        case drivePicker:
            return driveDataSource[row]
        case remoteControlPicker:
            return remoteControlDataSource[row]
        case controlButtonPicker:
            return controlButtonDataSource[row]
        case additionalDriveMaterialPicker:
            return additionalDriveMaterialDataSource[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case colorPicker:
            colorTextField.text = colorsDataSource[row]
        case profilePicker:
            profileTextField.text = profileDataSource[row]
        case controlTypePicker:
            controlTypeTextField.text = controlDataSource[row]
        case remoteControlPicker:
           remoteControlTextField.text = remoteControlDataSource[row]
        case drivePicker:
            driveTextField.text = driveDataSource[row]
        case controlButtonPicker:
            buttonControlTextField.text = controlButtonDataSource[row]
        case additionalDriveMaterialPicker:
            additionalDriveMaterial.text = additionalDriveMaterialDataSource[row]
        
        default:
            return
        }
        view.endEditing(true)
    }
}

extension CalculationViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == controlTypeTextField {
            driveControlStackView.isHidden = !(textField.text == "автоматика")
            additionalDriveMaterial.isHidden = !(textField.text == "автоматика")
//            casseteView.isHidden = textField.text == "автоматика"
//            springView.isHidden = textField.text == "автоматика"
            lockingView.isHidden = textField.text == "автоматика"
            springView.isHidden = !(textField.text == "пружина")
            casseteView.isHidden = !(textField.text == "кассета")
        }
        if textField == buttonControlTextField {
            remoteControlView.isHidden = !(textField.text == "выключатель с приемником")
        }
    }
}

extension UIView {
    func setShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.6
    }
}
