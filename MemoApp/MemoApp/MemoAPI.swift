//
//  MemoAPI.swift
//  MemoApp
//
//  Created by Kang JK on 27/12/2018.
//  Copyright © 2018 Kang JK. All rights reserved.
//

import Foundation
import UIKit

class MemoAPI : UIViewController {
    private var mainMemoList : Array<String> = []
    
    private var idNumbers : Array<String> = []
    
    static let shard = MemoAPI()
    
    func getMainList() -> Array<String> {
        mainMemoList = UserDefaults.standard.object(forKey: "MemoData") as? Array<String> ?? Array<String>()
        return mainMemoList
    }
    
    func addTheData(new : String) -> Array<String> {
        mainMemoList.insert(new, at: 0)
        UserDefaults.standard.set(mainMemoList, forKey: "MemoData")
        return mainMemoList
    }
    
}
