import Realm
import RealmSwift
import UIKit

class MemoAPI : UIViewController {
    private var mainMemoList : Array<String> = []
    
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
    func changeData(new:String) -> Array<String> {
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int

        mainMemoList.remove(at: MemoNumber )
        mainMemoList.insert(new, at: MemoNumber)
        UserDefaults.standard.set(mainMemoList, forKey: "MemoData")
        
        return mainMemoList
    }
    func deleteData() -> Array<String> {
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int

        mainMemoList.remove(at: MemoNumber)
        UserDefaults.standard.set(mainMemoList, forKey: "MemoData")
        return mainMemoList
    }
}
class MemoDataDetail : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var text : String = ""
    @objc dynamic var Date : Date!
}

func addRealmData(Title : String , Text : String ,Date : Date) {
    let data = MemoDataDetail()
    data.Date = Date
    data.title = Title
    data.text = Text
    
    let realm = try! Realm()
    try! realm.write {
        realm.add(data)
    }
    print("-------success add the date------")
}
