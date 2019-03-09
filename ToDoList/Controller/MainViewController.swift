//
//  MainViewController.swift
//  ToDoList
//
//  Created by Arthur on 07.03.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var weekDayLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mainView: UIView!

    let alertService = AlertService()
    
    @IBAction func pushAddButton(_ sender: Any) {
        
        let alertVC = alertService.alert()
        
        present(alertVC, animated: true)
    }
    
    // MARK: - Gradient
    var gradientLayer: CAGradientLayer! {
        didSet{
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let firstColor = UIColor.rgbColor(85, green: 89, blue: 216, alpha: 1.0)
            let secondColor = UIColor.rgbColor(206, green: 93, blue: 95, alpha: 1.0)
            
            gradientLayer.colors = [firstColor.cgColor, firstColor.cgColor, secondColor.cgColor, secondColor.cgColor]
            gradientLayer.locations = [0, 0.6, 0.6, 1]
            
        }
    }
    
    func gradient(){
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func borderShape(){
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 1, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient()
        borderShape()
        formatDate()
       
    }
    
    // MARK: - Date
    func formatDate(){
        let dateWeekDay = DateFormatter()
        dateWeekDay.dateFormat = "EEEE"
        
        let dateMonth = DateFormatter()
        dateMonth.dateFormat = "MMMM"
        
        let dateDay = DateFormatter()
        dateDay.dateFormat = "d"
        
        let dateWeekDayString = dateWeekDay.string(from: Date.init())
        
        let dateMonthString = dateMonth.string(from: Date.init())
        
        let dateDayString = dateDay.string(from: Date.init())

        monthLabel!.text = dateMonthString
        weekDayLabel!.text = "\(dateWeekDayString),"
        numberLabel!.text = "\(dateDayString)th"
        
    }
    



}
extension UIColor {
    static func rgbColor(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        
        let currentItem = ToDoItems[indexPath.row]
        cell.cellTextLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompeled"] as? Bool) == true {
            cell.checkboxImage.image = UIImage(named: "check")
        } else {
            cell.checkboxImage.image = UIImage(named: "uncheck")
        }
        
        
        
        return cell
    }

     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
        let delete = UITableViewRowAction(style:  .default, title: "Delete") { (action, indexPath) in
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if changeState(at: indexPath.row){
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "check")
        } else {
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "uncheck")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlertSegue"{
            if let alertViewController = segue.destination as? AlertViewController{
                
                alertViewController.tableView = self.tableView

            }
            
        }
        
    }
    
}


