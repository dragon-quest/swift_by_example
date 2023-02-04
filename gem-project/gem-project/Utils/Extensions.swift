//
//  Extensions.swift
//  FunRecipe
//

import UIKit

private let formatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.locale = Locale(identifier: "ja_JP")
    formatter.timeZone = NSTimeZone.system
    return formatter
}()

extension Date {
    
    // Date->String
    func string(format: String = "yyyy-M-d H:m:s") -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}

extension String {
    func dateFromString(format: String = "yyyy-M-d H:m:s") -> Date? {
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    func stringFromDate(format: String = "yyyy-M-d H:m:s") -> String {
        guard let date = dateFromString() else {
            return ""
        }
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func localized(withTableName tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "") -> String {
        NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: self)
    }
}

extension UIColor {
    class var theme: UIColor { return #colorLiteral(red: 0.4274509804, green: 0.7568627451, blue: 0.6196078431, alpha: 1) }
    class var notification: UIColor { return #colorLiteral(red: 1, green: 0.4666666667, blue: 0, alpha: 1) }
    class var negative: UIColor { return #colorLiteral(red: 0.9843137255, green: 0.4588235294, blue: 0.4588235294, alpha: 1) }
    class var darkBackground: UIColor { return #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1) }
    class var darkLightBackground: UIColor { return #colorLiteral(red: 0.3401621282, green: 0.3401621282, blue: 0.3401621282, alpha: 1) }
}
