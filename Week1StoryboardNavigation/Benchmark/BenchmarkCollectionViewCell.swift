//
//  BenchmarkCollectionViewCell.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/17/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class BenchmarkCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: BenchmarkCollectionViewCell.self)
    //        static let nib = UINib(nibName: String(describing: BenchmarkCollectionViewCell.self), bundle: nil)
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.cornerRadius = 4
        label.font = UIFont.systemFont(ofSize: 18)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    func update(text: String, image: UIImage) {
        imageView.image = image
        label.text = text
    }
    
    private func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        let oldAxis = stackView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
        guard oldAxis != newAxis else { return }
        
        stackView.axis = newAxis
        stackView.spacing = isHorizontalStyle ? 16 : 4
        label.textAlignment = isHorizontalStyle ? .left : .center
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3) {
            self.label.transform = fontTransform
            self.layoutIfNeeded()
        }
    }
}
