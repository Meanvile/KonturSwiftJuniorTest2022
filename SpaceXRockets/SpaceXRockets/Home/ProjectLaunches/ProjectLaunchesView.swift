//
//  ProjectLaunchesView.swift
//  SpaceXRockets
//
//  Created by Sergey on 13.04.2022.
//

import SwiftUI

struct ProjectLaunchesView: View {
    
    private var rocketId: String = ""
    private var rocketName: String = ""
    init(with rocketId: String, rocketName: String) {
        self.rocketName = rocketName
        self.rocketId = rocketId
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .clear
    }
    @ObservedObject var viewModel: LaunchesViewModel = LaunchesViewModel()
    
    var body: some View {
        VStack{
            List {
                ForEach(self.viewModel.presenters) {item in
                    if item.rocket == self.rocketId {
                        VStack {
                            HStack {
                                VStack {
                                    Text(item.name)
                                        .font(Font.custom("LabGrotesque", size: 20))
                                        .foregroundColor(Color.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(item.date)
                                        .font(Font.custom("LabGrotesque", size: 16))
                                        .foregroundColor(Color(red:142 / 255, green: 142 / 255, blue:143 / 255))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(width: 140)
                                if item.success == true {
                                    Image("rsz_rocket-success")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .foregroundColor(Color.white)
                                } else {
                                    Image("rsz_rocket-failure")
                                        .rotationEffect(.degrees(180))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        .listRowBackground(Color.black)
                        .frame(height: 50)
                        .padding() 
                        .background(Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                        .contentShape(Rectangle())
                        .cornerRadius(25.0)
                    }
                }
                .listRowBackground(Color.black)
            }
            .background(.black)
        }
        .background(.black)
        .navigationBarTitle(self.rocketName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {self.viewModel.onAppear()})
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

