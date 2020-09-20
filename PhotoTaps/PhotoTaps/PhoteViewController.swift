//
//  PhoteViewController.swift
//  PhotoTaps
//
//  Created by Павел Чернышев on 20.09.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class PhoteViewController: UIViewController {

    var image: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToShare(_ sender: Any) {
        guard let image = self.image else { return }
        let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool {
                print("successful ")
            }
            
        }
        present(shareController, animated: true, completion: nil)
    }
    


}
