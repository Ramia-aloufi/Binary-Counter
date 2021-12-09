//
//  ViewController.swift
//  Binary Counter
//
//  Created by R on 05/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit
protocol PassTextDelegate {
    func pass(text: Int,text2:Int)
}
class ViewController: UIViewController,PassTextDelegate {

    

    

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalLabel: UILabel!

    let n = 16
    var total = 0
    
    var numArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...n{
            numArray.append(Int(pow(10, Double(i))))
        }
        
        for i in numArray{
            total += i
            totalLabel.text = "\(total)"
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return n
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stepperValue = numArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells") as! CustomeCell
        cell.numberLabel.text = String(stepperValue)
        cell.stepper.value = Double(stepperValue)
        cell.stepper.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func pass(text: Int, text2: Int) {
        let oo = text - text2
        let rr = Int(totalLabel.text!)! + oo
        self.totalLabel.text =  "\(rr)"
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / CGFloat(n)
    }
    }

