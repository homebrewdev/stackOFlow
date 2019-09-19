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
    
    let ROW_HEIGHT = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "SoFTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
    
        tableView.rowHeight = 200
        tableView.estimatedRowHeight = 200
        
    }

}

// реализация методов делегата и UITableViewDataSource
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SoFTableViewCell
    
        cell.textView.text = dataSource[indexPath.row]
        cell.textView.textColor = .black
        // редактируем картинку
        cell.imageV.image = #imageLiteral(resourceName: "iOS-image")
        cell.imageV.backgroundColor = UIColor.random
        // наложение теней
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOpacity = 10
//        cell.layer.shadowOffset = .zero
//        cell.layer.shadowRadius = 50
//        cell.imageV.layer.shadowPath = UIBezierPath(rect: cell.imageV.bounds).cgPath
        // градиент устанавливаем
        cell.contentView.applyGradient(colours: [.gray , .lightGray])
        cell.layer.cornerRadius = 8.0
        cell.layer.masksToBounds = true
        //cell.transform.scaledBy(x: 10, y: 10)

        //cell.CellImageView.image = #imageLiteral(resourceName: "iOS-image")
        
        return cell
    }
    
    // вычисляем ширину ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ROW_HEIGHT)
    }

    
    // при выборе(нажатии) на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // переход на экран инфо
        performSegue(withIdentifier: "segueFromCell", sender: tableView.cellForRow(at: indexPath))
    
    }
    
}

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
