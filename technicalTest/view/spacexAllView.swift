

import SwiftUI
import URLImage

struct spacexAllView: View {
    
    
    var Repo = GenericRepository<latestsModel>()
      @State var list = [latestsModel]()
    @State var latest : latestModel = latestModel()
    var body: some View {
        VStack{
              
            List(list, id:\.id){item in
                VStack{
                    Text(item.name)
                    Text(item.details ?? "Detail Not Found")
                    
                    
                     
                 }
                 
             }
             
             .onAppear(){
                 Repo.getAll(url: ""){ data in
                     
                     list = data;
                     
                 }
             }
         }
    }


struct spacexAllView_Previews: PreviewProvider {
    static var previews: some View {
        spacexAllView()
    }
}

}
   
    
    


