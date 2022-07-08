//
//  API.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import Alamofire
import Gallery

class API: NSObject {
    
    // MARK: - Login Api
    class func loginCodeNetwork(Url: String, phoneNumber: String, password: String, compleition: @escaping (_ error: Error?, _ success: Bool?, _ data: UserDataModel?) -> Void) {
        
        let params : [String: Any] =
        [
         "phone": phoneNumber,
         "password": password,
         "fcm_token_ios":"12312"
        ]
        
        Alamofire.request(Url, method: .post , parameters: params)
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {return}
                    parsingJSONFromAPIResponse(data: data)
                case .failure:
                    print("Error \(response.result.error!)")
                    compleition(response.result.error, nil, nil)
                }
            }
    
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UserModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing.data)
                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing.data)
                }
            }
                
            catch let jsonError{
                print("Catch Error: \(jsonError.localizedDescription)")
                compleition(jsonError, false, nil)
            }
        }
    }
    
    // MARK: - Get Chat Messages
    class func chatCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool?,_ data: ChatModel?) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "X-company-id": "20",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            
            switch response.result {
            case .success:
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            
            case .failure:
                print("Error \(response.result.error!)")
                compleition(response.result.error, nil, nil)
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(ChatModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing)
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                compleition(jsonError, false, nil)
            }
        }
        
    }

    // MARK: - Send Chat Message
    class func sendMsgCodeNetwork(Url: String, msg: String, compleition: @escaping (_ error: Error?, _ success: Bool?) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let params : [String: Any] =
        [
            "_method":"PUT",
            "message": msg
       //     "type": "",
        //    "attachment": ""
    //            "thumbnail": ""
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .post, parameters: params, headers: headers ).responseJSON {
            response in
            
            switch response.result {
            case .success:
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            
            case .failure:
                print("Error \(response.result.error!)")
                compleition(response.result.error, nil)
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(SendMsgModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                }
                else{
                    compleition(nil, false)
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                compleition(jsonError, false)
            }
        }
        
    }
}
