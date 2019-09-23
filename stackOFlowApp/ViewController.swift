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
    
//    var store = Store(titles: [""], autors: [""], creationDates: [], links: [""], scores: [])
    
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
        let beginURL = "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged="
        //let beginURL = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged="
        let endURL = "&site=stackoverflow"
        let urlString = beginURL + tag + endURL
        
        guard let url = URL(string: urlString) else {
            print("URL error - something wrong at URL content!")
            return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                print(json)
                
                // декодим JSON
                let item = try JSONDecoder().decode(Element.self, from: data!)
                print("Item = \(item)")
                
                //dataSource.removeAll()
                
                for i in item.items {
                    store.titles.append(i.title!)
                    //print("dataSorce = \(dataSource)")
                    store.links.append(i.link!)
                    store.creationDates.append(i.creation_date!)
                    store.scores.append(i.score!)
                    //autors.append(i.owner)
                    //print("owner = \(i.owner)")
                }
            } catch let parsingError {
                print("error in JSONSerialization! Error: \(parsingError)")
            }
        })
        task.resume()
    
    }
    
    // по нажатию на кнопку SEARCH
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        searchString = searchTextField.text != "" ? searchTextField.text! : ""
        UIAlertController.showAlert(title: "Searсhing at StackOverFlow", msg: "Search tag: \(selectedTag)\nSearch string: \(searchString)", target: self)
        
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
    
    // если выбрали компонент, то передаем его тэг -> selectedTag
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTag = tags[row]
    }
    
}

