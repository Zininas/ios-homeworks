//
//  Photos.swift
//  Navigation
//
//  Created by Александр Зинин on 25.05.2022.
//

import UIKit

struct PhotosModel {
    var author: String
    var image: String
    
    static func makeMockModel() -> [PhotosModel] {
        var model = [PhotosModel]()
        model.append(PhotosModel(author: "", image: "1"))
        model.append(PhotosModel(author: "", image: "2"))
        model.append(PhotosModel(author: "", image: "3"))
        model.append(PhotosModel(author: "", image: "4"))
        model.append(PhotosModel(author: "", image: "5"))
        model.append(PhotosModel(author: "", image: "6"))
        model.append(PhotosModel(author: "", image: "7"))
        model.append(PhotosModel(author: "", image: "8"))
        model.append(PhotosModel(author: "", image: "9"))
        model.append(PhotosModel(author: "", image: "10"))
        model.append(PhotosModel(author: "", image: "11"))
        model.append(PhotosModel(author: "", image: "12"))
        model.append(PhotosModel(author: "", image: "13"))
        model.append(PhotosModel(author: "", image: "14"))
        model.append(PhotosModel(author: "", image: "15"))
        model.append(PhotosModel(author: "", image: "16"))
        model.append(PhotosModel(author: "", image: "17"))
        model.append(PhotosModel(author: "", image: "18"))
        model.append(PhotosModel(author: "", image: "19"))
        model.append(PhotosModel(author: "", image: "20"))
        model.append(PhotosModel(author: "", image: "21"))
   return model
    }
}
