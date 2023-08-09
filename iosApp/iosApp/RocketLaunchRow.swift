//
//  RocketLaunchRow.swift
//  iosApp
//
//  Created by Ramon Ferreira do Nascimento on 09/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct RocketLaunchRow: View {
    var rocketLaunch: RocketLaunch

    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Launch name: \(rocketLaunch.missionName)")
                Text(launchText).foregroundColor(launchColor)
                Text("Launch year: \(String(rocketLaunch.launchYear))")
                Text("Launch details: \(rocketLaunch.details ?? "")")
            }
            Spacer()
        }
    }
}

extension RocketLaunchRow {
    private var launchText: String {
        if let isSuccess = rocketLaunch.launchSuccess {
            return isSuccess.boolValue ? "Successful" : "Unsuccessful"
        } else {
            return "No data"
        }
    }

    private var launchColor: Color {
        if let isSuccess = rocketLaunch.launchSuccess {
            return isSuccess.boolValue ? Color.green : Color.red
        } else {
            return Color.gray
        }
    }
}

struct RocketLaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        let rocketLaunch = RocketLaunch(flightNumber: 143,
                                        missionName: "CRS-24",
                                        launchDateUTC: "2021-12-21T10:06:00.000Z",
                                        details: "SpaceX's 24th ISS resupply mission on behalf of NASA, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. Cargo includes several science experiments. The booster for this mission is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.",
                                        launchSuccess: true,
                                        links: Links(patch: Patch(small: "https://images2.imgbox.com/6f/96/DdGNFAIf_o.png",
                                                                  large: "https://images2.imgbox.com/fe/c3/yV1LnAUT_o.png"),
                                                     article: "https://spaceflightnow.com/2021/12/21/spacex-cargo-flight-sets-record-for-most-orbital-launches-from-space-coast-in-a-year"))
        RocketLaunchRow(rocketLaunch: rocketLaunch)
    }
}
