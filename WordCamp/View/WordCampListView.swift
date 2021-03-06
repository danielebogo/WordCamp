import SwiftUI

struct WordCampListView: View {
    @ObservedObject var event: PhoneEventViewModel

    var body: some View {
        HStack(spacing: 12) {
            CircleImage(url: event.thumbnail)
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(radius: 4)
            VStack(alignment: .leading) {
                Text(event.readableTitle).font(.headline)
                Text(event.location).font(.subheadline)
                Text(event.date)
            }
        }
    }
}

struct WordCampListView_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = PhoneEventViewModel(event: PreviewData.wordCamp())
        return Group {
            WordCampListView(event: viewModel)
            // Hack: Embeded in navigation view to get the device to show in dark mode as well
            NavigationView {
                WordCampListView(event: viewModel)
            }.colorScheme(.dark)
        }
    }
}
