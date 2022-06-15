//
//  DetailViewController.swift
//  CookPad
//
//  Created by Prana Apsara Wijaya on 15/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cookTitle: UILabel!
    @IBOutlet weak var cookImage: UIImageView!
    @IBOutlet weak var cookDesc: UILabel!
    
    var cook: Cook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = cook {
            cookTitle.text = data.title
            cookImage.loadFrom(URLAddress: data.image)
            cookDesc.text = data.description
        }
        
        cookImage.layer.cornerRadius = 32
        cookImage.layer.masksToBounds = true
    }
}


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
