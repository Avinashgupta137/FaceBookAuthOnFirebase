//
//  AllDataViewController.swift
//  Firebase_facebook
//
//  Created by IPS-149 on 16/03/23.
//

import UIKit

class AllDataViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSourceCnn: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var data: Articles?

    override func viewDidLoad() {
        super.viewDidLoad()
        lblDescription.text = data?.description
        lblTitle.text = data?.title
        lblSourceCnn.text = data?.source?.name
        lblDate.text = data?.publishedAt
        if let urlString = data?.urlToImage, let url = URL(string: urlString) {
                   img.load(url: url)
               }
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
