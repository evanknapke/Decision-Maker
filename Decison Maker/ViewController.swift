//
//  ViewController.swift
//  Decison Maker
//
//  Created by Evan Knapke on 12/17/18.
//  Copyright © 2018 Evan Knapke. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard) )
        
        view.addGestureRecognizer(Tap)
    }
    
    @objc func dismissKeyboard () {
        view.endEditing(true)
    }
}


class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputField: UITextField!
    @IBOutlet weak var wordDisplay: UITextView!
    var wordList: [String] = []
    
    @IBAction func handleGoButton() {
        if wordList.isEmpty {
            outputField.text = "Add your options first"
        } else {
            outputField.text = wordList[Int(arc4random_uniform(UInt32(wordList.count)))]
        }
    }
    
    @IBAction func handleClearButton() {
        wordList.removeAll()
        inputField.text?.removeAll()
        outputField.text?.removeAll()
        wordDisplay.text?.removeAll()
    }
    
    @IBAction func handleAddButton() {
        let inputWord = inputField.text
        wordList.append(inputWord!)
        
        if wordDisplay.text != nil {
            wordDisplay.text = wordDisplay.text + "\n" + inputWord!
        } else {
            wordDisplay.text = wordDisplay.text + inputWord!
        }
        
        inputField.text?.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboard()
        self.inputField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        
        inputField.resignFirstResponder()  //if desired
        handleAddButton()
        return true
    }
    
    func performAction() {
        //action events
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

