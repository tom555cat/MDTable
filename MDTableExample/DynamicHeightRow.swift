//
//  DynamicHeightRow.swift
//  MDTableExample
//
//  Created by Leo on 2017/6/16.
//  Copyright © 2017年 Leo Huang. All rights reserved.
//

import Foundation
import MDTable

class DynamicHeightRow: RowConvertable{
    //Protocol
    var rowHeight: CGFloat{
        get{
            let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): DynamicHeightCellConst.font]
            let size = CGSize(width: DynamicHeightCellConst.cellWidth, height: .greatestFiniteMagnitude)
            let height = (self.title as NSString).boundingRect(with: size,
                                                               options: [.usesLineFragmentOrigin],
                                                               attributes: convertToOptionalNSAttributedStringKeyDictionary(attributes),
                                                               context: nil).size.height
            return height + 8.0
        }
    }
    var reuseIdentifier: String = "DynamicHeightRow"
    var initalType: RowConvertableInitalType = RowConvertableInitalType.code(className: DynamicHeightCell.self)
    
    //Optional evnet 
    var didSelectRowAt: (UITableView, IndexPath) -> Void

    //Data
    var title:String
    init(title:String) {
        self.title = title
        self.didSelectRowAt = {_,_ in}
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
