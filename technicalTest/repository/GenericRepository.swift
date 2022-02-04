//
//  GenericRepository.swift
//  technicalTest
//
//  Created by burak cakir on 3.02.2022.
//

import Foundation
import Alamofire

struct GenericRepository<T> where T : Codable{
    
    var  baseUrl = Config.apiURL
    
    func getAll(url: String, completianHandler: @escaping(([T]) -> Void)){
        
        let request = AF.request(baseUrl + url);
        
        request.responseDecodable(of: [T].self){ response in
            completianHandler(response.value!)
        }
        
    }
    
    
    func Add(url:String, newModel: T, completionHandler: @escaping (T) -> Void ){
        

        AF.request(baseUrl + url, method: .post, parameters: newModel, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: T.self){ response in
                
              
                completionHandler(response.value!)
        
            }
    }
    
    
    func Delete(url: String, id: Int){
        
        AF.request("\(url)\(id)", method: .delete)
            .responseData(){ response in
                
            }
        
    }
}
