import Foundation

class Diary {
    let name : String
    let text : String
    let tags : [String]
    let createdAt : Date
    let dateStr : String
    let myFormatter : DateFormatter = DateFormatter()
    let locale = Locale(identifier: "uk_UA")
    
    init(name : String? = nil,text : String? = nil, tags : [String]? = nil, createdAt : Date? = nil) {
        self.name = name ?? ""
        self.text = text ?? ""
        self.tags = tags ?? []
        self.createdAt = createdAt ?? Date()
        myFormatter.locale = locale
        myFormatter.dateStyle = .long
        dateStr = myFormatter.string(from: self.createdAt)
    }
    
    func fullDescription() -> String  {
        var wrappedTags : [String] = []
        
        for tag in tags {
            wrappedTags.append("[\(tag)]")
        }
        
        let result : [String] = [dateStr, name, wrappedTags.joined(separator: " "), text]
        return result.filter{!$0.isEmpty}.joined(separator: "\n")
    }
}

var diary = Diary(name: "Сніданок",text: "Їм кашу, п’ю чай",tags: ["чай","каша"])
print(diary.fullDescription())

print("\n");

diary = Diary(text: "Вивчаю Swift", createdAt: nil)
print(diary.fullDescription())

print("\n");

diary = Diary()
print(diary.fullDescription())
