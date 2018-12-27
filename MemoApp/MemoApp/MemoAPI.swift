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
    
    static let shard = MemoAPI()
    
    func getMainList() -> Array<String> {
        return mainMemoList
    }
    func addTheData(new : String) -> Array<String> {
        mainMemoList.append(new)
        return mainMemoList
    }
}
