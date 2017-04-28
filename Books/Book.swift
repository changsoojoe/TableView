//
//  Book.swift
//  Books
//
//  Created by SDS-019 on 2017. 4. 28..
//  Copyright © 2017년 SDS-019. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var title:String
    var author:String?
    var coverImage:UIImage?
    var URL:String?
    
    init(title:String, author:String?, coverImage:UIImage?, URL:String?){
        self.title = title
        self.author = author
        self.coverImage = coverImage
        self.URL = URL
    }
}
