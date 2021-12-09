//
//  CustomeCell.swift
//  Binary Counter
//
//  Created by R on 05/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class CustomeCell: UITableViewCell {
    let vc = ViewController()
    
    var delegate: PassTextDelegate?
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func strappedClicked(_ sender: UIStepper) {
        let rr = numberLabel.text
        let senderValue = Int(sender.value).description
        numberLabel.text = senderValue
        
        delegate?.pass(text: Int(sender.value), text2: Int(rr!)!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
