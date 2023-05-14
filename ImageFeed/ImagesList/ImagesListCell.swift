//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by paul kellerman on 14.05.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet var dateLabel: UILabel!

}
