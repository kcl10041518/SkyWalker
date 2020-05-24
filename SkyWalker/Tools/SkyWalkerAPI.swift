//
//  SkyWalkerAPI.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import Foundation
import HandyJSON
import Moya
import Alamofire
import SVProgressHUD


var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

let LoadingPlugin = NetworkActivityPlugin { (type, target) in
    guard let vc = topVC else { return }
    switch type {
    case .began:
        SVProgressHUD.show()
    case .ended:
        SVProgressHUD.dismiss()
    }
}

let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<SkyWalkerApi>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}
let ApiProvider = MoyaProvider<SkyWalkerApi>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<SkyWalkerApi>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])


enum SkyWalkerApi {
    case login //登录
}

extension SkyWalkerApi:TargetType {
    
    private struct UApiKey {
        static var key = ""
    }
    var baseURL: URL { return URL(string: "http://app.u17.com/v3/appV3_3/ios/phone")! }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        default:
            break
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    
    var task: Task {
        var parmeters = ["time": Int32(Date().timeIntervalSince1970),
                         "device_id": UIDevice.current.identifierForVendor!.uuidString,
                         "key": UApiKey.key,
                         "model": "none",
                         "target": "U17_3.0",
                         "version": Bundle.main.infoDictionary!["CFBundleShortVersionString"]!]
        switch self {
        case .login:
            parmeters[""] = "text"
        default:
            break;
        }
        
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil;
    }
    
    
}


extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
        
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(ResponseData<T>.self) else {
                completion(nil)
                return
            }
            completion(returnData.data?.returnData)
        })
    }
}


struct ReturnData<T: HandyJSON>: HandyJSON {
    var message:String?
    var returnData: T?
    var stateCode: Int = 0
}

struct ResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: ReturnData<T>?
}
