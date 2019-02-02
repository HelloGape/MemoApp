import UIKit

class MemoFile : UIViewController {
    @IBOutlet weak var memo: UITextView!
    
    let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
    var memoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
    
    override func viewDidLoad() {
        if MemoNumber == -1 {
            memo.text = ""
        } else {
            memo.text = memoData[MemoNumber]
        }
    }
    @IBAction func saveMemo(_ sender: Any) {
        
        if MemoNumber == -1 {
            MemoAPI.shard.addTheData(new: memo.text)
        }else {
            MemoAPI.shard.changeData(new: memo.text)
            addRealmData(Title: memo.text, Text: memo.text, Date: Date())
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func deleteButton(_ sender: Any) {
        if MemoNumber == -1 {
        }else {
            MemoAPI.shard.deleteData()
        }
        self.navigationController?.popViewController(animated: true)
    }
}
