//
//  ViewController.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 03/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let tags = ["objective-c", "ios", "xcode", "cocoa-touch", "iphone", "swift"]
    
    var selectedTag = "objective-c"
    var searchString = ""
    
    var JSONdata = Data.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup
        setup()
    }

    private func setup() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func requestAPI(tag: String) {
        let beginURL = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged="
        let urlString = beginURL + tag + "&site=stackoverflow"
        //let urlString = "https://itunes.apple.com/search?term=hip&limit=1"
        guard let url = URL(string: urlString) else {
            print("Url error")
            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                print(json)
                
                self.JSONdata = data!
                print("====DATA====")
                print(self.JSONdata)
            } catch let parsingError {
                print("error in JSONSerialization! Error: \(parsingError)")
            }
        })
        task.resume()
        
        // декодим JSON
        decodeJSON()
    }

    private func decodeJSON() {
        do {
            let jsonDecoder = JSONDecoder()
            //jsonDecoder.dataDecodingStrategy = 
            let item = try jsonDecoder.decode(Element.self, from: JSONdata)
            print("Item = \(String(describing: item.items[0].title))")
        }
        catch {
            print("Some Errors: \(error.localizedDescription)")
        }
    }
    
    // по нажатию на кнопку SEARCH
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        searchString = searchTextField.text != "" ? searchTextField.text! : ""
        UIAlertController.showAlert(title: "Searhing at StackOF", msg: "Search tag: \(selectedTag)\nSearch string: \(searchString)", target: self)
        
        requestAPI(tag: selectedTag)
    }
}

// реализация автоскрытия (autohide) клавиатуры
extension ViewController: UITextFieldDelegate {
    // для autohide клавиатуры по тапу на любое место экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    // для скрытия (autohide) клавиатуры по нажатию на клаве кнопки "return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchString = textField.text ?? ""
        return true
    }
}

// расширение для реализации работы UIPickerViewDataSource, UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // число строк в пикере
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // количество элементов в пикере
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tags.count
    }
    
    // список всех элементов пикера
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tags[row]
    }
    
    // если выбрали компонент, то передаем его тэг
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTag = tags[row]
    }
    
}

