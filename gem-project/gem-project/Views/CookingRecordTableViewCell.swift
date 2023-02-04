//
//  CookingRecordTableViewCell.swift
//  FunRecipe
//
//  Created by 中江洋史 on 2022/10/28.
//

import UIKit

class CookingRecordTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var recordedAtLabel: UILabel!
    @IBOutlet private weak var recipeTypeLabel: UILabel!
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var commentView: UIView!
    @IBOutlet private weak var recipeTypeView: UIView!
    @IBOutlet private weak var recordedAtView: UIView!
    
    static let identifier = "CookingRecordTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private lazy var setup: (()->()) = {
        cardView.layer.cornerRadius = 18
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowRadius = 8
        cardView.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        imgView.layer.cornerRadius = 18
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        commentView.layer.cornerRadius = 18
        commentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        recipeTypeView.layer.cornerRadius = 8
        recordedAtView.layer.cornerRadius = 8
        
        accessibilityIdentifier = CookingRecordTableViewCell.identifier + "_\(tag)"
        commentLabel.accessibilityIdentifier = "CommentLabel_\(tag)"
        recordedAtLabel.accessibilityIdentifier = "RecordedAtLabel_\(tag)"
        recipeTypeLabel.accessibilityIdentifier = "RecipeTypeLabel_\(tag)"
        imgView.accessibilityIdentifier = "ImgView_\(tag)"
        cardView.accessibilityIdentifier = "CardView_\(tag)"
        recipeTypeView.accessibilityIdentifier = "RecipeTypeView_\(tag)"
        recordedAtView.accessibilityIdentifier = "RecordedAtView_\(tag)"
        return {}
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    public func configure(with item: CookingRecordItem) {
        commentLabel.text = item.postName
        recipeTypeLabel.text = ""
        recordedAtLabel.text = item.postDate.stringFromDate(format: "RECORDED_AT".localized())
        if let imageData = item.imageData {
            imgView.image = UIImage(data: imageData)
        }
        
        recipeTypeView.backgroundColor = UIColor.theme
    }
}
