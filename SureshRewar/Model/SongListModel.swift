//
//  SongListModel.swift
//  SureshRewar
//
//  Created by Suresh Rewar on 18/01/21.
//

import Foundation


struct SongListBaseModel:Codable {
    var resultCount : Int?
    var results : [ListData]?
}


struct ListData:Codable {
    var trackName:String?
    var artistName:String?
    var artworkUrl100:String?
    var collectionPrice:Float?
    var collectionName:String?
    var primaryGenreName:String?
    var country:String?
}
