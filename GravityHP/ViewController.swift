//
//  ViewController.swift
//  GravityHP
//
//  Created by SIJI MOON on 11/11/2016.
//  Copyright © 2016 SIJI MOON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var frontTableView: UITableView!

    let imagesNames1 = ["GravityHP-001", "GravityHP-002", "GravityHP-003"]
    let imagesNames2 = ["GravityHP-004", "GravityHP-005", "GravityHP-006", "GravityHP-007", "GravityHP-008", "GravityHP-009", "GravityHP-010", "GravityHP-011" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FrontTableViewCell

        if indexPath.section == 0 && indexPath.row <= 2 {
            cell.frontImageView?.image = UIImage(named: imagesNames1[indexPath.row])
        }
        if indexPath.section == 1 && indexPath.row <= 7 {
            cell.frontImageView?.image = UIImage(named: imagesNames2[indexPath.row])
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 {
                return 160
            }
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 155
            }
            else if indexPath.row == 1 {
                return 205
            }
            else if indexPath.row == 2 {
                return 145
            }
            else if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 6 {
                return 170
            }
            else if indexPath.row == 5 {
                return 160
            }
            else if indexPath.row == 7 {
                return 120
            }
        }
        return 20
    }
}

