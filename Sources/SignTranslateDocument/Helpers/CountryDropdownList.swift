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
    public let name: Name
    public struct Name:Codable{
        public var common:String
    }
}
public struct CountryDropdownList: View {
    @State private var countries = [Country]()
    @Binding var selectedCountry: String
    @State private var searchText: String = ""
    
    
    public init(countries: [Country] = [Country](), selectedCountry: Binding<String>, searchText: String = "") {
        self.countries = countries
        self._selectedCountry = selectedCountry
        self.searchText = searchText
    }
    
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
    
    public init(text: Binding<String>, isEditing: Bool = false) {
        self._text = text
        self.isEditing = isEditing
    }
    
    public var body: some View {
        HStack {
            TextField("Search Countries", text: $text)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                ).padding(.horizontal, 10)
        }
    }
}
