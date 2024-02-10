//
//  BrowseMoreCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/10/24.
//

import UIKit

final class BrowseMoreCollectionViewCell: UICollectionViewCell {
    
    private let showMoreButton = UIButton().then {
        var container = AttributeContainer()
        container.font = UIFont.pretendard(size: 13, weight: .semibold)
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("더보기", attributes: container)
        config.baseForegroundColor = #colorLiteral(red: 0.7411764264, green: 0.7411764264, blue: 0.7411764264, alpha: 1)
        config.image = UIImage(named: "ShowMoreImage")
        config.imagePlacement = .top
        config.imagePadding = 6
        config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        $0.configuration = config
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Configure UI

extension BrowseMoreCollectionViewCell {
    
    private func configureSubviews() {
        [showMoreButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func configureLayout() {
        showMoreButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
    }

}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let myView = BrowseMoreCollectionViewCell()
            return myView
        }.previewLayout(.sizeThatFits)
    }
}
#endif
