//
//  IAAlbumTableViewCell.swift
//  Albums
//
//  Created by Michael Stewart on 10/28/14.
//  Copyright (c) 2014 iOS in Action. All rights reserved.
//

import UIKit
import AssetsLibrary

class IAAlbumTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFromAlbum(album:ALAssetsGroup) {
        self.albumImageView.image = UIImage(CGImage:album.posterImage().takeUnretainedValue())
//        println(self.albumImageView.clipsToBounds)
        self.albumTitleLabel.text = album.valueForProperty(ALAssetsGroupPropertyName) as String
    }

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
}
