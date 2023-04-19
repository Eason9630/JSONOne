//
//  ShowViewController.swift
//  JSONOne
//
//  Created by 林祔利 on 2023/4/19.
//

import UIKit


class ShowViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var items: [inner]
    
    init?(coder: NSCoder, items: [inner]){
        self.items = items
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstItem = items[0]
        let name = firstItem.artistName
        let trackName = firstItem.trackName
        let date = firstItem.releaseDate
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateString = formatter.string(from: date)
        
        nameLabel.text = name
        trackLabel.text = trackName
        dateLabel.text = dateString
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
