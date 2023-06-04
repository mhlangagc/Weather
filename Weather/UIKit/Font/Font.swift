import UIKit

struct Font {
    static let sansProRegular = UIFont(name: "SourceSansPro-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14.0,
                                                                                                     weight: UIFont.Weight.regular)
    static let sansProSemibold = UIFont(name: "SourceSansPro-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14.0,
                                                                                                       weight: UIFont.Weight.semibold)
}
