////
////  UserViewController.swift
////  Jewerly_Store
////
////  Created by Юлия Цой on 09.12.2023.
////
//
//import UIKit
//
//
//
//class UserViewController: UIViewController {
//    
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var passwordLabel: UILabel!
//    @IBOutlet weak var phoneLAbel: UILabel!
//    @IBOutlet weak var emailLabel: UILabel!
//    
//    @IBOutlet weak var viewInfo: UIView!
//    
//    var user: User?
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//    
//    func setup(){
//        viewInfo.layer.cornerRadius = 20
//    }
//    
//    func displayUserInfo() {
//        if let user = user {
//                nameLabel.text = "Name: \(user.name)"
//                phoneLAbel.text = "Phone: \(user.phone)"
//                passwordLabel.text = "Password: \(user.password)"
//        }
//
//    }
//
//}
