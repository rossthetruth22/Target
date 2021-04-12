//
//  DetailViewController.swift
//  ProductViewer
//
//  Created by Royce Reynolds on 4/8/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var price: UILabel!
    
    var product: Product!
    var holdImage: UIImage?
    var holdText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(textView.isHidden)
        textView.text = "Royce Reynolds"
        //textView.text = "Royce Reynolds"
        price.text = product.regular_price.display_string
        picture.image = holdImage
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
