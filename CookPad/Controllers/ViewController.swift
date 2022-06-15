//
//  ViewController.swift
//  CookPad
//
//  Created by Prana Apsara Wijaya on 15/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookTableView.dataSource = self
        cookTableView.delegate = self
        cookTableView.register(UINib(nibName: "CookTableViewCell", bundle: nil), forCellReuseIdentifier: "CookCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CookCell", for: indexPath) as? CookTableViewCell {
            
            let cook = cooks[indexPath.row]
            cell.cookTitle.text = cook.title
            cell.cookImage.loadFrom(URLAddress: cook.image)
            cell.cookDesc.text = cook.description
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.cook = cooks[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
