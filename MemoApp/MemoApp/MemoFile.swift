import Foundation
import UIKit

class MemoFile : UIViewController {
    @IBOutlet weak var memo: UITextView!
    let memoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
    var memoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
    
    override func viewDidLoad() {
        if memoNumber == -1 {
            memo.text = ""
        } else {
            memo.text = memoData[memoNumber]
        }
    }
    @IBAction func saveMemo(_ sender: Any) {
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        if MemoNumber == -1 {
            MemoAPI.shard.addTheData(new: memo.text)
        }else {
            memoData.remove(at: MemoNumber)
            memoData.insert(memo.text, at: MemoNumber)
            UserDefaults.standard.set(memoData, forKey: "MemoData")
        }
    }
    @IBAction func deleteButton(_ sender: Any) {
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        if MemoNumber == -1 {
            
        }else {
            memoData.remove(at: MemoNumber)
            UserDefaults.standard.set(memoData, forKey: "MemoData")
        }
    }
}
