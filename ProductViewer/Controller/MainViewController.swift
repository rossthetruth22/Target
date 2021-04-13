//
//  MainViewController.swift
//  ProductViewer
//
//  Created by Royce Reynolds on 4/7/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var products = [Product]()
    var images = [Int:UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let task = URLSession.shared.dataTask(with: URL(string: "https://api.target.com/mobile_case_study_deals/v1/deals")!) { (data, response, error) in
            guard let data = data else {return}
            
            do {
                let products = try JSONDecoder().decode(Products.self, from: data)
                self.products = products.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print("unsucc")
            }

        }
        
      
            
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListCell
        cell?.layer.borderWidth = 0.5
        cell?.layer.cornerRadius = 8
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.title.text = products[indexPath.row].title
        cell?.price.text = products[indexPath.row].regular_price.display_string
        
        if let image = images[indexPath.row]{
            cell?.picture.image = image
        }else{
            DispatchQueue.global().async {
                guard let data = try? Data.init(contentsOf: self.products[indexPath.row].image_url) else {return}
                DispatchQueue.main.async { [weak self] in
                    cell?.picture.image = UIImage(data: data)
                    self?.images[indexPath.row] = UIImage(data: data)
                }
            }
        }
        
        

        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {return}
        if let controlla = segue.destination as? DetailViewController{

            controlla.product = products[(selectedIndexPath.row)]
            let cell = tableView.cellForRow(at: selectedIndexPath) as! ListCell
            controlla.holdImage = cell.picture.image

        }
    }
    

}
