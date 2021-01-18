//
//  DetailsVC.swift
//  SureshRewar
//
//  Created by Suresh Rewar on 18/01/21.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var collectionPrice: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    var detailsObj:ListData?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionPrice.text = "$ "+"\(detailsObj?.collectionPrice ?? 0)"
        self.collectionName.text = detailsObj?.collectionName
        self.countryName.text  = detailsObj?.country
        self.trackName.text = detailsObj?.trackName
        self.primaryGenreName.text = detailsObj?.primaryGenreName
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: self.detailsObj?.artworkUrl100 ?? ""){
                do{
                    let data = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.img.image = UIImage(data:data)
                    }
                }catch{
                    //Error
                }
                
            }
        }
    }
    

}
