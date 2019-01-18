
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MemoCList: UITableView!
    
    var MemoData = MemoAPI.shard.getMainList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemoCList.dataSource = self
        MemoCList.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.MemoCList.reloadData()
        }
    }   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savedMemo" {
            
        } else if segue.identifier == "addButton" {
            
        }
    }
    @IBAction func addData(_ sender: Any) {
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
    }
    
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [""]
        return MemoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        
        if let addCellName : UILabel = cell.viewWithTag(1) as? UILabel {
            addCellName.text = MemoData[indexPath.row]
        }
        return cell
    }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memoNumber = indexPath.row
        UserDefaults.standard.set(memoNumber, forKey: "MemoNumber")
        performSegue(withIdentifier: "savedMemo", sender: self)
    }
}
