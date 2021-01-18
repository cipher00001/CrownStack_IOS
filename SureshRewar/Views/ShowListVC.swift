//
//  ShowListVC.swift
//  SureshRewar
//
//  Created by Suresh Rewar on 18/01/21.
//

import UIKit

class ShowListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var songList:SongListBaseModel?
    fileprivate func getDataFromServer() {
        SongsVM.getList { result in
            switch result{
            case .success(let data):
                self.songList = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(.msg(let msg)):
                print(msg)
            case .failure(.nullRes):
                print("error")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "SongListCell", bundle: nil), forCellReuseIdentifier: "SongListCell")
    }
    


}

extension ShowListVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = songList?.resultCount{
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongListCell", for: indexPath) as! SongListCell
       if let cellData = songList?.results{
        cell.setupData(data:cellData[indexPath.row], tag: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcObj = self.storyboard?.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
        if let data = self.songList?.results{
            vcObj.detailsObj = data[indexPath.row]
            self.navigationController?.pushViewController(vcObj, animated: true)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

