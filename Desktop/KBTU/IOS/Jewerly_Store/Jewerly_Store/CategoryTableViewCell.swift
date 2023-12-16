//
//  CategoryTableViewCell.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 16.12.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categNameLabel: UILabel!
    @IBOutlet weak var categImage: UIImageView!
    
    func configure(from post: Category){
        categNameLabel.text = post.name
        categImage.image = UIImage(named: post.imageName)
    }
    
}
