//
//  MarketDataModel.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 17/05/2023.
//

import Foundation

// JSON Data:
/*
 URL: https://api.coingecko.com/api/v3/global
 JSON RESPONSE:
 {
   "data": {
     "active_cryptocurrencies": 10756,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 742,
     "total_market_cap": {
       "btc": 43535973.82378887,
       "eth": 646186621.8034611,
       "ltc": 12784521335.060099,
       "bch": 10111369521.896343,
       "bnb": 3785588233.7874155,
       "eos": 1309966860527.7708,
       "xrp": 2614595886852.8833,
       "xlm": 13268744033616.695,
       "link": 177327631551.9695,
       "dot": 220927640466.6538,
       "yfi": 173728663.74965987,
       "usd": 1174362649136.4622,
       "aed": 4312230288562.8687,
       "ars": 271407086893632.84,
       "aud": 1767893752548.5771,
       "bdt": 126417945470111.62,
       "bhd": 442746462350.9362,
       "bmd": 1174362649136.4622,
       "brl": 5802525849383.258,
       "cad": 1586226896903.0615,
       "chf": 1054537730594.4722,
       "clp": 938468423804421,
       "cny": 8218307254921.87,
       "czk": 25667942252625.21,
       "dkk": 8066109855593.788,
       "eur": 1083160471441.878,
       "gbp": 944382514105.4717,
       "hkd": 9200485456527.148,
       "huf": 399570857493390.7,
       "idr": 17467929659437578,
       "ils": 4288467060357.5894,
       "inr": 96755384004833,
       "jpy": 160823680167317.7,
       "krw": 1572190049015311,
       "kwd": 360611538670.33386,
       "lkr": 364529460258372.3,
       "mmk": 2471763258930603,
       "mxn": 20541646124406.254,
       "myr": 5310467899395.077,
       "ngn": 541992017763321.56,
       "nok": 12642761986961.523,
       "nzd": 1881761129371.496,
       "php": 65926950532371.586,
       "pkr": 331621013277199.5,
       "pln": 4862002290942.839,
       "rub": 94550009632052.62,
       "sar": 4403771857063.046,
       "sek": 12247971797750.715,
       "sgd": 1576494953629.6658,
       "thb": 40187277034774.375,
       "try": 23200827106967.562,
       "twd": 36187397851815.55,
       "uah": 43471198982511.195,
       "vef": 117588932058.03395,
       "vnd": 27538109163793370,
       "zar": 22518522407819.27,
       "xdr": 875151487213.5814,
       "xag": 49619217625.81989,
       "xau": 590657438.0096772,
       "bits": 43535973823788.87,
       "sats": 4353597382378886.5
     },
     "total_volume": {
       "btc": 1197316.1741498173,
       "eth": 17771273.405667026,
       "ltc": 351596916.9585172,
       "bch": 278080520.7291993,
       "bnb": 104110362.60105993,
       "eos": 36026402350.81018,
       "xrp": 71906004833.27148,
       "xlm": 364913896411.39185,
       "link": 4876823066.832112,
       "dot": 6075900319.081447,
       "yfi": 4777845.095708949,
       "usd": 32297047031.028004,
       "aed": 118593949271.75928,
       "ars": 7464174253501.302,
       "aud": 48620200679.83886,
       "bdt": 3476716782006.3125,
       "bhd": 12176309701.167831,
       "bmd": 32297047031.028004,
       "brl": 159579709380.30933,
       "cad": 43624041286.42102,
       "chf": 29001650134.264088,
       "clp": 25809539193905.41,
       "cny": 226017964827.8369,
       "czk": 705913747114.0883,
       "dkk": 221832267532.61578,
       "eur": 29788826061.55141,
       "gbp": 25972187122.75365,
       "hkd": 253029600112.23715,
       "huf": 10988904310079.652,
       "idr": 480398917796293.25,
       "ils": 117940418525.08635,
       "inr": 2660943951178.192,
       "jpy": 4422935254187.654,
       "krw": 43238003177382.54,
       "kwd": 9917454231.817781,
       "lkr": 10025203995390.22,
       "mmk": 67977855291932.34,
       "mxn": 564931549434.5146,
       "myr": 146047246674.3085,
       "ngn": 14905737764237.846,
       "nok": 347698284507.97546,
       "nzd": 51751754657.01432,
       "php": 1813107580969.0889,
       "pkr": 9120163579935.45,
       "pln": 133713650354.09938,
       "rub": 2600292260756.0835,
       "sar": 121111504087.82764,
       "sek": 336840857019.36646,
       "sgd": 43356395657.674835,
       "thb": 1105221097925.296,
       "try": 638063723146.7408,
       "twd": 995217355737.6133,
       "uah": 1195534751608.228,
       "vef": 3233903319.2168336,
       "vnd": 757346640292600.5,
       "zar": 619299138821.7134,
       "xdr": 24068211606.180557,
       "xag": 1364616123.03688,
       "xau": 16244122.774725903,
       "bits": 1197316174149.8174,
       "sats": 119731617414981.73
     },
     "market_cap_percentage": {
       "btc": 44.505247725532,
       "eth": 18.622253779927732,
       "usdt": 7.055525706149454,
       "bnb": 4.169864728640276,
       "usdc": 2.5252493684658592,
       "xrp": 1.9823767327737718,
       "ada": 1.1006798171366028,
       "steth": 1.0409139644457346,
       "doge": 0.865627199096318,
       "sol": 0.6978301744586443
     },
     "market_cap_change_percentage_24h_usd": 0.21364016730190696,
     "updated_at": 1684309570
   }
 }
 */

//   let globalData = try? JSONDecoder().decode(GlobalData.self, from: jsonData)

import Foundation

// MARK: - GlobalData
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
   
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
       
    }
    
    var marketCap:String {
        if let item = totalMarketCap.first(where: { (key,value) in
            return key == "usd"
        }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: {$0.key == "usd"}) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
    
    
}
