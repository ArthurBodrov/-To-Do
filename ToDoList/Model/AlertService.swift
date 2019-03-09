//
//  AlertService.swift
//  ToDoList
//
//  Created by Arthur on 08.03.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit

class AlertService {
    
    func alert() -> AlertViewController{
        
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController
        
        return alertVC

    }
}
