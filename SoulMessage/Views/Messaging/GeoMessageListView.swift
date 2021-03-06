//
//  GeoMessageListView.swift
//  SoulMessage
//
//  Created by Justine Wright on 2021/07/07.
//

import SwiftUI
// swiftlint:disable multiple_closures_with_trailing_closure
struct GeoMessageListView: View {
    @ObservedObject var geoMessageListViewModel: GeoMessageListViewModel = GeoMessageListViewModel()
    @State private var showingForm = false

    var body: some View {

            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {

                    List {
                        ForEach(geoMessageListViewModel.listGeoMessageViewModel) {message in
                            GeoMessageView(geoMessageViewModel: message)
                        }
                    }.onAppear {
                        UITableView.appearance().backgroundColor = UIColor.clear
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                    }
                    .listStyle(InsetListStyle())

                    HStack {
                        Spacer()
                        Button(action: {
                            showingForm = true
                        }) { Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.green, Color.blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(height: 60, alignment: .bottomTrailing)
                                .overlay(Image(systemName: "plus").foregroundColor(.white))

                        }
                        .sheet(isPresented: $showingForm) {
                            FormView {(geoMessage) in
                                geoMessageListViewModel.add(geoMessage)
                                showingForm = false
                            }
                        }
                    }

                }

            }

    }
}
