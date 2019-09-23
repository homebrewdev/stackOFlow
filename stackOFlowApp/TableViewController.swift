//
//  TableViewController.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 03/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let ROW_HEIGHT = CGFloat(200) // временно захардкожено
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "SoFTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        
        // настройка UI таблицы
        initTableViewUI()
    }

    // настройка UI таблицы
    private func initTableViewUI() {
        // захардкожено
        tableView.rowHeight = ROW_HEIGHT
        tableView.estimatedRowHeight = ROW_HEIGHT
        
        // бэкграунд таблицы
        let backImageView = UIImageView(image: UIImage(named: "iOS-image"))
        backImageView.frame = self.tableView.frame
        self.tableView.backgroundView = backImageView;

    }
}

// реализация методов делегата и UITableViewDataSource
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SoFTableViewCell
    
        let index = indexPath.row
        cell.textView.text = store.titles[index]
        cell.textView.textColor = .black
        
        cell.creationDateLbl.text = String(store.creationDates[index])
        //cell.authorLabel.text = links[indexPath.row]
        cell.scoreLbl.text = String(store.scores[index])
        
        // заливаем градиент ячейки
        cell.contentView.applyGradient(colours: [.darkGray, .white])
        cell.layer.cornerRadius = 8.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    // вычисляем ширину ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ROW_HEIGHT
    }

    // при выборе(нажатии) на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            // добавляем черную рамку вокруг этой ячейки
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 3
        }
        
        // переход на экран инфо
        performSegue(withIdentifier: "segueFromCell", sender: tableView.cellForRow(at: indexPath))
    
    }
    
}
