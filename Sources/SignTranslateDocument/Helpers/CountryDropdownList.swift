//
//  CountryDropdownList.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//
import SwiftUI
public struct Country: Codable, Identifiable, Hashable {
    public static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.name.common == rhs.name.common
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.name.common)
    }
    
    public var id: String { name.common }
    let name: Name
    struct Name:Codable{
        var common:String
    }
}
public struct CountryDropdownList: View {
    @State private var countries = [Country]()
    @Binding var selectedCountry: String
    @State private var searchText: String = ""
    
    public var body: some View {
        
        VStack{
            SearchBar(text: $searchText)
            Picker("Select a country", selection: $selectedCountry) {
                ForEach(countries.filter { searchText.isEmpty ? true : $0.name.common.contains(searchText) }, id: \.name.common) { country in
                    Text(country.name.common).tag(country.name.common)
                }
            }
            .searchable(text: $searchText)
            .task {
                fetchCountries()
            }
        }
    }
    
    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Country].self, from: data) {
                    DispatchQueue.main.async {
                        self.countries = decodedResponse
                    }
                    return
                }
            }
        }.resume()
    }
}
struct CountryDropdownList_Previews: PreviewProvider {
    static var previews: some View {
        CountryDropdownList(selectedCountry: .constant("cambodia"))
    }
}
public struct SearchBar: View {
    @Binding var text: String
    @State var isEditing = false
    public var body: some View {
        HStack {
            TextField("Search Countries", text: $text)
//                .padding(7)
//                .padding(.horizontal, 25)
//                .background(Color.gray)
//                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
//                        if isEditing {
//                            Button(action: {
//                                text = ""
//                            }) {
//                                Image(systemName: "multiply.circle.fill")
//                                    .foregroundColor(.gray)
////                                    .padding(.trailing, 8)
//                            }
//                        }
                    }
                ).padding(.horizontal, 10)
//                .onTapGesture {
//                    isEditing = true
//                }
//            if isEditing {
//                Button(action: {
//                    isEditing = false
//                    text = ""
//                }) {
//                    Text("Cancel")
//                }.padding(.trailing, 10)
//                .transition(.move(edge: .trailing))
//                .animation(.default)
//            }
        }
    }
}
