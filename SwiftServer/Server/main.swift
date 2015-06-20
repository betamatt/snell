//
//  main.swift
//  SwiftServer
//
//  Created by Jonathan Klein on 6/13/15.
//  Copyright © 2015 artificial. All rights reserved.
//

import Foundation
import SwiftServerLib

let webServer = GCDWebServer()

webServer.addDefaultHandlerForMethod("GET", requestClass: GCDWebServerRequest.self, processBlock: {gdcRequest in
  let adapter = GCDWebServerAdapter(GDCRequest: gdcRequest)

  var response: Response = TestController(request: adapter.request).run()

  return adapter.response(response)
})

webServer.runWithPort(8080, bonjourName: nil)

print("Listening on \(webServer.serverURL)...")
