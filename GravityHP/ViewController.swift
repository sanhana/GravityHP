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
    let imagesNames3 = ["Button0", "Button1", "Button2", "Button3"]
    let storyboardIDs = ["None", "TechnologySoukaiNavi", "ProductSoukaiNavi", "GrobalSoukaiNavi"]

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
            return imagesNames1.count
        }
        return imagesNames2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 && indexPath.row <= 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FrontTableViewCell

            cell.frontImageView?.image = UIImage(named: imagesNames1[indexPath.row])
            
            return cell
        }
        else if indexPath.section == 1 && (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3) {
            let Button1Cell = tableView.dequeueReusableCell(withIdentifier: "Button1Cell", for: indexPath) as! Button1TableViewCell
            Button1Cell.Button1ImageView?.image = UIImage(named: imagesNames2[indexPath.row])

            Button1Cell.AnyButton1.setImage(UIImage(named:imagesNames3[indexPath.row]), for: UIControlState.normal)

            return Button1Cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FrontTableViewCell
        
        cell.frontImageView?.image = UIImage(named: imagesNames2[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 {
                return 175
            }
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 166
            }
            else if indexPath.row == 1 {
                return 228
            }
            else if indexPath.row == 2 {
                return 126
            }
            else if indexPath.row == 3 {
                return 190
            }
            else if indexPath.row == 4 {
                return 196
            }
            else if indexPath.row == 5 {
                return 176
            }
            else if indexPath.row == 6 {
                return 196
            }
            else if indexPath.row == 7 {
                return 136
            }
        }
        return 20
    }
    
    @IBAction func AnyButton1Action(_ sender: Any) {

        let botton = sender as! UIButton
        let cell = botton.superview?.superview as! Button1TableViewCell
        let row = frontTableView.indexPath(for: cell)?.row
        let storyboard: UIStoryboard = self.storyboard!

        let nextView = storyboard.instantiateViewController(withIdentifier: storyboardIDs[row!]) as! UINavigationController
        self.present(nextView, animated: true, completion: nil)
    }
}

