//
//  CartTableViewCell.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 18.12.2023.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func didTapRemoveButton(at index: Int)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var removeIcon: UIImageView!

    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartName: UILabel!
    @IBOutlet weak var cartImage: UIImageView!
    
    weak var delegate: CartTableViewCellDelegate?
    
    func configure(with product: Product, index: Int) {
        cartName.text = product.name
        cartPrice.text = product.price
        cartImage.image = UIImage(named: product.imageName)
        removeIcon.tag = index
        removeIcon.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeButtonTapped))
        removeIcon.addGestureRecognizer(tapGesture)
    }
    
    @objc func removeButtonTapped(_ sender: Any) {
        delegate?.didTapRemoveButton(at: removeIcon.tag)
    }
}
