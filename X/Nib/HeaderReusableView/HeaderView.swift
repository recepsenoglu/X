//
//  HeaderView.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 3.10.2023.
//

import UIKit

final class HeaderView: UIView {

    private let nibName = "HeaderView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = loadViewFromNib() else {return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
}
