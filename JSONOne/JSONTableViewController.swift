//
//  JSONTableViewController.swift
//  JSONOne
//
//  Created by 林祔利 on 2023/4/19.
//

import UIKit
import Kingfisher

class JSONTableViewController: UITableViewController {

    var items = [inner]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchItem()
        
    }
    func fetchItem(){
         let songURL = "https://itunes.apple.com/search?term=%E5%91%A8%E6%9D%B0%E5%80%AB&media=music&country=tw"
        if let url = URL(string: songURL) {
            URLSession.shared.dataTask(with: url) { data , response , error in
                if let data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do {
                        let song = try decoder.decode(Song.self, from: data)
                        self.items = song.results
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }catch {
                        print(error)
                    }
                }
                
            }.resume()
        }
    }
    // MARK: - Table view data source

    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(JSONTableViewCell.self)", for: indexPath) as! JSONTableViewCell

        let item = items[indexPath.row]
        



        cell.nameLabel.text = item.trackName
        cell.photoImageView.kf.setImage(with: item.artworkUrl100)
        // Configure the cell...

        return cell
    }
    

    @IBSegueAction func showDetail(_ coder: NSCoder) -> ShowViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else {return nil}
        let selectedInner = items[row]
        return ShowViewController(coder: coder, items: [selectedInner])
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
