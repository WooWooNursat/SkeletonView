//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

extension UIView {
    
    @objc var subviewsSkeletonables: [UIView] {
        subviewsToSkeleton.filter { $0.isSkeletonable }
    }

    @objc var subviewsToSkeleton: [UIView] {
        subviews
    }
    
}

extension UITableView {
    
    override var subviewsToSkeleton: [UIView] {
        var result = [UIView]()

        for subview in subviews {
            if String(describing: type(of: subview)) == "UITableViewWrapperView" {
                result.append(contentsOf: subview.subviews)
            } else {
                result.append(subview)
            }
        }
        
        return result
    }
    
}

extension UITableViewCell {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UITableViewHeaderFooterView {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UICollectionView {
    override var subviewsToSkeleton: [UIView] {
        subviews
    }
}

extension UICollectionViewCell {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UIStackView {
    override var subviewsToSkeleton: [UIView] {
        arrangedSubviews
    }
}
