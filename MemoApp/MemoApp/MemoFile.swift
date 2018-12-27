//
//  MemoFile.swift
//  MemoApp
//
//  Created by Kang JK on 27/12/2018.
//  Copyright © 2018 Kang JK. All rights reserved.
//

import Foundation
import UIKit

class MemoFile : UIViewController {
    @IBOutlet weak var memo: UITextView!
    
    override func viewDidLoad() {
    }
    @IBAction func saveMemo(_ sender: Any) {
        MemoAPI.shard.addTheData(new: memo.text)
        UserDefaults.standard.set(MemoAPI.shard.getMainList(), forKey: "memoData")
    }
}
