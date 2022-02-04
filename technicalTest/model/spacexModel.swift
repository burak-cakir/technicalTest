

import Foundation

struct latestModel : Codable , Identifiable {
    var id : String = ""
    var name : String = ""
    var links : linksModel = linksModel()
    var flight_number : Int = 0
    var details : String?
    var success : Bool = false
    var launchpad : String = ""

    
}
struct patchModel : Codable {

    var small  : String = ""
    var large : String = ""
}
struct redditModel : Codable {
    var campaign  : String = ""
    var launch : String = ""
    var media : String = ""
    var recovery : String = ""
}

struct flickrModel : Codable {
    var small  : String = ""
    var orjinal : String = ""
}

struct linksModel : Codable {
    var patch : patchModel = patchModel()
}

struct fairingsModel: Codable{
    var reused : String?
    var recovery_attempt : String?
    var recovered : String?
    var ships: [String]?

    
    
}

struct latestsModel : Codable , Identifiable {
    var id : String = ""
    var name : String = ""
    var details : String? = ""

}



struct coresModel : Codable {
    var core : String?
    var flight : Int?
    var gridfins : Bool?
    var legs : Bool?
    var reused : Bool?
    var landing_attempt : Bool?
    var landing_success : Bool?
    var landing_type : String?
}







