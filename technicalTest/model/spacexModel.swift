

import Foundation
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

//    var reddit :  redditModel?
//    var flickr : flickrModel?
//    var presskit : Bool?
//    var webcast : String?
//    var youtube_id : String?
//    var article : Bool?
//    var wikipedia : Bool?
}

struct fairingsModel: Codable{
    var reused : String?
    var recovery_attempt : String?
    var recovered : String?
    var ships: [String]?
    
//    "reused": null,
//    "recovery_attempt": null,
//    "recovered": null,
//    "ships": []
    
    
    
}
struct latestModel : Codable , Identifiable {
    var id : String = ""
    var name : String = ""
    var links : linksModel = linksModel()
    var flight_number : Int = 0
    var details : String?
}
//struct latestModel : Codable , Identifiable {
//
//    var fairings : fairingsModel?
//    var links : linksModel?
//    var static_fire_date_utc : String?
//    var static_fire_date_unix : String?
//    var net : Bool?
//    var window : String?
//    var rocket : String?
//    var success : Bool?
//    var failures : [String]?
//    var details : String?
//    
//    
////    "details": null,
//    var crew : [String]?
//    var ships : [String]?
//    var capsules  : [String]?
//    var payloads : [String]?
//    var launchpad : String?
//    var flight_number : Int?
//    var name : String
//    
////    name": "Starlink 4-7 (v1.5)",
//    var date_utc : Date?
//    var date_unix : Date?
//    var date_precision : Bool?
//    var cores : [coresModel]?
//    var auto_update : Bool?
//    var tbd : Bool?
//    var launch_library_id : UUID?
//    var id : String?
//    
//}

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







