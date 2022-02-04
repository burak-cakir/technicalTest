//
//  getimage.swift
//  technicalTest
//
//  Created by burak cakir on 4.02.2022.
//

import Foundation
import URLImage
func getImage( myimage : latestsModel) -> URL{
    if(myimage.links.patch.small.count > 0){
       return URL(string: myimage.links.patch.small)!
  
    }
    else{
        return URL(string: "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")!
      
    }
}
