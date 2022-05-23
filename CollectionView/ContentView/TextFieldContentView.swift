//
//  TextFieldContentView.swift
//  CollectionView
//
//  Created by Александр Полетаев on 23.05.2022.
//

import UIKit

class TextFieldContentVieW: UIView, UIContentView {
    
    struct Configuration : UIContentConfiguration{
        var text: String? = ""
        
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentVieW(self)
        }
    }
    
    var configuration: UIContentConfiguration {
        didSet{
            configure(configuration: configuration)
        }
    }
    let textField = UITextField()
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration : UIContentConfiguration){
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textField, height: 16, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentVieW.Configuration {
        TextFieldContentVieW.Configuration()
    }
}
