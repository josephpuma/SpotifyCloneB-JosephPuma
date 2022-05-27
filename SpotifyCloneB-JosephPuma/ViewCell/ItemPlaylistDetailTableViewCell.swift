//
//  ItemPlaylistDetailTableViewCell.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by Joseph Cconislla Puma on 26/05/22.
//

import UIKit

class ItemPlaylistDetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
