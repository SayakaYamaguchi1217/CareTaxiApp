import SwiftUI

struct ArrangementView: View {
    var body: some View {
        ZStack {
            AlignmentPanel(text: ".topLeading\n（左上寄せ）", alignment: .topLeading, color: Color(red: 1.0, green: 0.8, blue: 0.8)) // ピンク系
            AlignmentPanel(text: ".top\n（上寄せ）", alignment: .top, color: Color(red: 1.0, green: 1.0, blue: 0.8)) // クリームイエロー
            AlignmentPanel(text: ".topTrailing\n（右上寄せ）", alignment: .topTrailing, color: Color(red: 0.8, green: 1.0, blue: 0.8)) // ミントグリーン
            AlignmentPanel(text: ".leading\n（左寄せ）", alignment: .leading, color: Color(red: 0.8, green: 0.9, blue: 1.0)) // パステルブルー
            AlignmentPanel(text: ".center\n（中央配置、デフォルト）", alignment: .center, color: Color(red: 1.0, green: 0.9, blue: 1.0)) // ラベンダー
            AlignmentPanel(text: ".trailing\n（右寄せ）", alignment: .trailing, color: Color(red: 0.95, green: 0.95, blue: 0.95)) // やさしいグレー
            AlignmentPanel(text: ".bottomLeading\n（左下寄せ）", alignment: .bottomLeading, color: Color(red: 0.9, green: 0.95, blue: 0.9)) // グリーングレー
            AlignmentPanel(text: ".bottom\n（下寄せ）", alignment: .bottom, color: Color(red: 0.95, green: 0.9, blue: 0.85)) // ベージュ
            AlignmentPanel(text: ".bottomTrailing\n（右下寄せ）", alignment: .bottomTrailing, color: Color(red: 0.85, green: 0.95, blue: 0.95)) // アクアグレー
        }
    }
}

struct AlignmentPanel: View {
    let text: String
    let alignment: Alignment
    let color: Color

    var body: some View {
        let words = text.components(separatedBy: "\n")
        VStack {
            ForEach(0..<words.count, id: \.self) { index in
                Text(words[index])
            }
        }
        .frame(width: 128, height: 100)
        .background(color)
        .cornerRadius(12) // 角を丸くしてさらに柔らかく
        .frame(width: 400, height: 600, alignment: alignment)
    }
}

#Preview {
    ArrangementView()
}
