import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗","🚕", "🚜","🚂", "✈️","🚙","🚌", "🚎","🏎", "🚓","🚑","🚒", "🚐","🛻", "🚚"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                    CardView(content: emoji)
                }
            }
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)

            }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount <= 1{
                return
            }else {
                emojiCount -= 1
            }
        }, label: {
            VStack{
                Text("Remove")
                Text("Card")
            }
        })
    }
    
    var add: some View {
        Button(action: {
            if emojiCount >= emojis.count{
                return
            }else {
                emojiCount += 1
            }
            
        }, label: {
            VStack{
                Text("Add")
                Text("Card")
            }
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View{
        return ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.stroke(lineWidth: 5)
                Text(content).font(.largeTitle)
            }else {
                shape.fill(.red)
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}
 




































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
//        ContentView()
//            .preferredColorScheme(.light)
//            .previewDevice("iPhone 12 mini")
    }
}
