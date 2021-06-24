//
//  ViewController.swift
//  CalculateTrueAirSpeed
//
//  Created by Nazmi Yavuz on 23.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UIView
    @IBOutlet weak var iasTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet var altitudeTextField: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Properties
    
    private var speedComponents: SpeedComponents?
    private var textFieldList: [UITextField] = []
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldList = [iasTextField, temperatureTextField, altitudeTextField]
    }
    
    // MARK: - Private Functions
    
    private func showErrorAlert() {
        // creating alert controller
        let alert = UIAlertController(
            title: "Caution!",
            message: "Please check your entries.", preferredStyle: .alert)
        // creating buttons for action sheet
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // add buttons to the alert controller
        alert.addAction(cancel)
        // show alert controller
        present(alert, animated: true, completion: nil)
        
    }

    
    // MARK: - Button Actions
    
    @IBAction func calculateButtonPressed(_ sender: UIBarButtonItem) {
        
        if !iasTextField.hasText || !temperatureTextField.hasText ||
            !altitudeTextField.hasText {
            showErrorAlert()
            return
        }
        guard let indicatedAirSpeed = iasTextField.text,
              let temperature = temperatureTextField.text,
              let altitude = altitudeTextField.text else {
            
            showErrorAlert()
            return
        }
        
        speedComponents = SpeedComponents(
            indicatedAirSpeed: Double(indicatedAirSpeed) ?? 0.0,
            temperature: Double(temperature) ?? 0.0,
            altitude: Double(altitude) ?? 0.0)
        
        guard let components = speedComponents else { fatalError() }
        resultLabel.text = "\(components.trueAirSpeed)"
    }
    
    @IBAction func clearButtonPressed(_ sender: UIBarButtonItem) {
        self.setEditing(false, animated: true)
        resultLabel.text = ""
        
        for textField in textFieldList {
            textField.text = ""
            textField.resignFirstResponder()
        }
    }
    
}

