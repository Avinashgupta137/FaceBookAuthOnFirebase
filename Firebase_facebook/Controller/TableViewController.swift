//
//  TableViewController.swift
//  Firebase_facebook
//
//  Created by IPS-149 on 16/03/23.
//

import UIKit
import Kingfisher

class TableViewController: UIViewController {

    var articlesArray: [Articles] = []
    var json: Json4Swift_Base?
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        defaults.set("John Doe", forKey: "userName")
        
        
        getJson() { [self] (json) in
            DispatchQueue.main.sync {
                if let articles = json.articles {
                    for article in articles {
                        self.articlesArray.append(article)
                        tblView.reloadData()
                    }
                }
            }
            
        }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    //MARK: - API CALLING
    func getJson(completion: @escaping (Json4Swift_Base)-> ()) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-02-17&sortBy=publishedAt&apiKey=593f5a82de084c33afe3c1955d829e8d"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) {data, res, err in
                if let data = data {
                    do {
                        let json: Json4Swift_Base = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
                        completion(json)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }


}
//MARK: - TABLEVIEW
extension TableViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        
       // cell.lblDate.text = articlesArray[indexPath.row].publishedAt
        cell.lblSourceName.text = articlesArray[indexPath.row].source?.name
        cell.lblTitle.text = articlesArray[indexPath.row].title
        if let outputDateString = Date.convertDateFormat(inputDateString: articlesArray[indexPath.row].publishedAt!, inputDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ", outputDateFormat: "yyyy-MM-dd") {
          //  print(outputDateString) // prints "2023-03-16"
            cell.lblDate.text = outputDateString
        }
        
        if let imageUrlString = articlesArray[indexPath.row].urlToImage, let imageUrl = URL(string: imageUrlString) {
            cell.imgView.kf.setImage(with: imageUrl)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = articlesArray[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "AllDataViewController") as? AllDataViewController
        vc?.data = selectedData
        navigationController?.pushViewController(vc!, animated: true)
        
    
    }
}
