import Flutter
import UIKit
import ZendeskSDK
import ZendeskCoreSDK


public class SwiftFlutterZenDeskPlugin: NSObject, FlutterPlugin {
    
    let controller: FlutterViewController
    
    var flutterResult: FlutterResult?
    
    init(controller: FlutterViewController) {
        self.controller = controller
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        
        let channel = FlutterMethodChannel(name: "flutter_zendesk", binaryMessenger: registrar.messenger())
        
        let storyboard : UIStoryboard? = UIStoryboard.init(name: "Main", bundle: nil);
        
        let viewController: UIViewController? = storyboard!.instantiateViewController(withIdentifier: "FlutterViewController")
        
        let instance = SwiftFlutterZenDeskPlugin(controller: viewController as! FlutterViewController)
        
        registrar.addMethodCallDelegate(instance, channel: channel)
        
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.flutterResult = result
        
        if(call.method.elementsEqual("initiate")){
            
            let args = call.arguments as? NSDictionary
            
            let appId = args!["appId"]as? String
            let clientId  = args!["clientId"]as? String
            let url = args!["url"]as? String
            
            Zendesk.initialize(appId: appId!,
                               clientId: clientId!,
                               zendeskUrl: url!)
            Support.initialize(withZendesk: Zendesk.instance)
            
            let ident = Identity.createAnonymous()
            Zendesk.instance?.setIdentity(ident)
            
            let hcConfig = HelpCenterUiConfiguration()
            hcConfig.groupType = .section
            hcConfig.groupIds = [1234, 5678]
            let helpCenter = HelpCenterUi.buildHelpCenterOverviewUi(withConfigs: [hcConfig])
                        
            let rootViewController:UIViewController! = UIApplication.shared.keyWindow?.rootViewController
                  if (rootViewController is UINavigationController) {
                      (rootViewController as! UINavigationController).pushViewController(helpCenter, animated:true)
                  } else {
                      let navigationController:UINavigationController! = UINavigationController(rootViewController:helpCenter)
                    rootViewController.present(navigationController, animated:true, completion:nil)
                  }

            result(nil)

        }else{
            flutterResult!(FlutterMethodNotImplemented)
        }
    }
}
