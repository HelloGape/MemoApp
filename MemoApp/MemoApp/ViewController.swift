//
//  ViewController.swift
//  MemoApp
//
//  Created by Kang JK on 26/12/2018.
//  Copyright © 2018 Kang JK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MemoCList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MemoCList.dataSource = self
        MemoCList.delegate = self
    }
    
    @IBAction func createNewMemo(_ sender: Any) {
        
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemoAPI.shard.getMainList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        if let addCellName : UILabel = cell.viewWithTag(1) as? UILabel {
            addCellName.text = MemoAPI.shard.getMainList()[indexPath.row]
        }
        return cell
    }
}
extension ViewController : UITableViewDelegate {
}
