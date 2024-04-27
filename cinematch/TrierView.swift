import SwiftUI

struct TrierView: View {
    
    @ObservedObject var listeTri: ListeTrier
    
    var body: some View {
        
        List (0..<listeTri.categorieNoms.count) { i in
            
            HStack {
                
                Text(listeTri.categorieNoms[i])
                Spacer()
                
                if listeTri.categorieActive == i {
                    FlecheSubView(boolTriCroissant: listeTri.categorieTriCroissant)
                        .onTapGesture {
                            self.listeTri.categorieTriCroissant.toggle()
                            self.listeTri.changeTriCroissant(triCroissant: listeTri.categorieTriCroissant)
                            self.listeTri.trier(catégorie: listeTri.categorieActive,
                                                triCroissant: listeTri.categorieTriCroissant)
                        }
                }
                
            }.foregroundColor(listeTri.categorieActive == i ? Color.black : Color.gray)
            .onTapGesture {
                
                if i != listeTri.categorieActive {
                    self.listeTri.changeCategorie(categorieActive: i)
                    self.listeTri.trier(catégorie: listeTri.categorieActive,
                                        triCroissant: listeTri.categorieTriCroissant)
                }
            }
            
        }.listStyle(InsetGroupedListStyle())
    }
}

struct TrierView_Previews: PreviewProvider {
    static var previews: some View {
        TrierView(listeTri: listeTrier)
    }
}

struct FlecheSubView: View {
    
    let boolTriCroissant: Bool
    
    var body: some View {
        Image(systemName: boolTriCroissant ? "arrowtriangle.down" : "arrowtriangle.up")
    }
}
