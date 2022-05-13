//
//  CardCell.swift
//  CreditCards
//
//  Created by Pedro Brojato on 02/05/22.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var holderLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var flagImageView: UIImageView!
    
    func setup(card: CreditCard) {
        holderLabel.text = card.holderName
        numberLabel.text = card.numberFormated
        flagImageView.image = UIImage(named: card.flag)
        containerView.layer.cornerRadius = 12
    }
}
