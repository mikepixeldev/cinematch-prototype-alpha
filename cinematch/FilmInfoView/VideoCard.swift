//
//  VideoCard.swift
//  cinematch
//
//  Created by Mike on 25/06/2021.
//

import SwiftUI

struct VideoCard: View {
    
    @State var videoURL:URL
    @State var showPlayIcon:Bool
    var previewLength:Double
    
    var body: some View {
        ZStack {
            VideoView(videoURL: videoURL, previewLength: previewLength)
            if showPlayIcon {
                Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 20, idealWidth: 40, maxWidth: 40, minHeight: 20, idealHeight: 40, maxHeight: 40, alignment: .center)
                .foregroundColor(Color.white)
            }
            
        }
        .onTapGesture {
            print("Yeah")
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    
    static let url = URL(string: "https://r1---sn-25glenes.googlevideo.com/videoplayback?expire=1624618334&ei=_mDVYKaXMI6gxN8Pi8SpiA8&ip=2a01:cb05:81e5:9800:70e8:4bf7:91b7:e8bd&id=o-AKb_NTjM-zVWWhd6YFfEf8440nSxKF14sJ7J5YglLOzL&itag=22&source=youtube&requiressl=yes&mh=dL&mm=31,29&mn=sn-25glenes,sn-25ge7ns7&ms=au,rdu&mv=m&mvi=1&pl=39&initcwndbps=1152500&vprv=1&mime=video/mp4&ns=u5vPNQgJ5FNkvrSQ5_vWre4F&cnr=14&ratebypass=yes&dur=154.877&lmt=1544198354214527&mt=1624596530&fvip=1&fexp=24001373,24007246&c=WEB&txp=5535432&n=boiIvGNnVXj6ZnL9ngkRr&sparams=expire,ei,ip,id,itag,source,requiressl,vprv,mime,ns,cnr,ratebypass,dur,lmt&sig=AOq0QJ8wRQIgW6JAbVHtPazGXH1T6UFn24BsLpCtFXyS_51qJSXTMiMCIQC94qng_gVjVzICI0u0kySfSd_GJGCAcdqqwp9PzU-8_g==&lsparams=mh,mm,mn,ms,mv,mvi,pl,initcwndbps&lsig=AG3C_xAwRQIhAMHd2K-LVBhaOUlpRpjC7UGTI9w9OhdMknVgTcQSS8PBAiBa8tetinZosH_aK5RzToLkk7O47fhWfIGluSqlnp_YQA==")!
    
    static var previews: some View {
        VideoCard(videoURL: url, showPlayIcon: true, previewLength: 20)
    }
}
