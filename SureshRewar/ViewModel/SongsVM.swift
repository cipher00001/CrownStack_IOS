//
//  SongsVM.swift
//  SureshRewar
//
//  Created by Suresh Rewar on 18/01/21.
//

import Foundation


enum HandleError:Error {
    case nullRes
    case msg(String)
}

class SongsVM {
    static func getList(completion: @escaping (_ res:Result<SongListBaseModel?,HandleError>) -> Void)
    {
        ServiceHandler.executeServiceCall { (data, json, error) in
            do{
                 let resData = try JSONDecoder().decode(SongListBaseModel.self, from:data!)
                completion(.success(resData))
            }catch{
                print(error)
                completion(.failure(.msg("Something went wrong")))
            }
        }
    }
}
