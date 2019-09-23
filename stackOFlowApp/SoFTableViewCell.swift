//
//  SoFTableViewCell.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 18/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class SoFTableViewCell: UITableViewCell {

    // cell outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var creationDateLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK: - Compare date
extension SoFTableViewCell {
    // конвертация даты с запроса в дату для отображения на лейбле
    private func convertDate(dateString: String) -> String {
        
        return ""
    }
    
    private func compareDate(dateString: String, date: Date, dateFormatter: DateFormatter, timeObject: UILabel, text: String) {
        var currentDate: [String] {
            let date = Date(timeIntervalSinceNow: 0.0)
            let dt = DateFormatter()
            dt.dateFormat = "HH.mm.dd.MM.yyyy"
            return dt.string(from: date).components(separatedBy: ".")
        }
        
        let fullDataComponent = dateString.components(separatedBy: " ")
        let timeComponent = fullDataComponent[0].components(separatedBy: ":")
        let dateComponents = fullDataComponent[1].components(separatedBy: ".")
        
        
        if Int(dateComponents[2])! == Int(currentDate[4])! && Int(dateComponents[1])! == Int(currentDate[3])! && Int(dateComponents[0])! == Int(currentDate[2])! && Int(timeComponent[0])! == Int(currentDate[0])! && Int(timeComponent[1])! == Int(currentDate[1])! {
            timeObject.text = "\(text) только что"
        } else if Int(dateComponents[2])! == Int(currentDate[4])! && Int(dateComponents[1])! == Int(currentDate[3])! && Int(dateComponents[0])! == Int(currentDate[2])! && Int(timeComponent[0])! == Int(currentDate[0])! && Int(timeComponent[1])! < Int(currentDate[1])! {
            timeObject.text = "\(text)\(Int(currentDate[1])! - Int(timeComponent[1])!) мин. назад"
        } else if Int(dateComponents[2])! == Int(currentDate[4])! && Int(dateComponents[1])! == Int(currentDate[3])! && Int(dateComponents[0])! == Int(currentDate[2])! && Int(timeComponent[0])! < Int(currentDate[0])! {
            timeObject.text = "\(text)\(Int(currentDate[0])! - Int(timeComponent[0])!) ч. назад"
        } else if Int(dateComponents[2])! == Int(currentDate[4])! && Int(dateComponents[1])! == Int(currentDate[3])! && Int(dateComponents[0])! < Int(currentDate[2])!{
            timeObject.text = "\(text) \(Int(currentDate[2])! - Int(dateComponents[0])!) д. назад"
        } else {
            timeObject.text = dateFormatter.string(from: date)
        }
        
    }
}
