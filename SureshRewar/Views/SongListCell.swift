//
//  SongListCell.swift
//  SureshRewar
//
//  Created by Suresh Rewar on 18/01/21.
//

import UIKit

class SongListCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 20
        self.mainView.layer.borderWidth = 1
        self.mainView.layer.borderColor = UIColor.separator.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.img.image = nil
        self.price.text = "N/A"
        self.trackName.text = "N/A"
    }
    
    func setupData(data:ListData,tag:Int) {
        self.price.text = "$ "+"\(data.collectionPrice ?? 0)"
        self.trackName.text = data.trackName
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string:data.artworkUrl100 ?? ""){
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
