//
//  ProductListTableViewCell.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 16.12.2023.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productListPrice: UILabel!
    @IBOutlet weak var productListName: UILabel!
    @IBOutlet weak var productListImage: UIImageView!
    
    func configure(from post: Product){
        productListName.text = post.name
        productListPrice.text = post.price
        productListImage.image = UIImage(named: post.imageName)
    }
}
