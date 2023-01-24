//
//  DeatailView.swift
//  RandomFoto
//
//  Created by Александр Косяков on 24.01.2023.
//

import UIKit

final class DeatailView: UIView {

    // MARK: - UI Elements
    
  
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

//        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension DeatailView {
    
}

// MARK: - Constant Constrains

private extension CGFloat {
    static let leadingMargin: CGFloat = 10
    
}
