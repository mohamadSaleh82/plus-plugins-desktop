// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source is governed by a BSD-style license that can
// be found in the LICENSE file.

#if os(iOS)
import Flutter
#elseif os(macOS)
import Cocoa
import FlutterMacOS
#endif

public class SwiftConnectivityPlusPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private let connectivityProvider: ConnectivityProvider
  private var eventSink: FlutterEventSink?

  init(connectivityProvider: ConnectivityProvider) {
    self.connectivityProvider = connectivityProvider
    super.init()
    self.connectivityProvider.connectivityUpdateHandler = connectivityUpdateHandler
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    #if os(iOS)
    let binaryMessenger = registrar.messenger()
    #elseif os(macOS)
    let binaryMessenger = registrar.messenger
    #endif

    let channel = FlutterMethodChannel(
      name: "dev.mohamadsaleh82.plus/connectivity",
      binaryMessenger: binaryMessenger)

    let streamChannel = FlutterEventChannel(
      name: "dev.mohamadsaleh82.plus/connectivity_status",
      binaryMessenger: binaryMessenger)

    let connectivityProvider = PathMonitorConnectivityProvider()
    let instance = SwiftConnectivityPlusPlugin(connectivityProvider: connectivityProvider)
    streamChannel.setStreamHandler(instance)

    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
    eventSink = nil
    connectivityProvider.stop()
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "check":
      result(statusFrom(connectivityTypes: connectivityProvider.currentConnectivityTypes))
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func statusFrom(connectivityType: ConnectivityType) -> String {
    switch connectivityType {
    case .wifi:
      return "wifi"
    case .cellular:
      return "mobile"
    case .wiredEthernet:
      return "ethernet"
    case .other:
        return "other"
    case .none:
      return "none"
    }
  }
  
  private func statusFrom(connectivityTypes: [ConnectivityType]) -> [String] {
    return connectivityTypes.map {
      self.statusFrom(connectivityType: $0)
    }
  }

  public func onListen(
    withArguments _: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    eventSink = events
    connectivityProvider.start()
    // Update this to handle a list
    connectivityUpdateHandler(connectivityTypes: connectivityProvider.currentConnectivityTypes)
    return nil
  }

  private func connectivityUpdateHandler(connectivityTypes: [ConnectivityType]) {
    DispatchQueue.main.async {
      self.eventSink?(self.statusFrom(connectivityTypes: connectivityTypes))
    }
  }

  public func onCancel(withArguments _: Any?) -> FlutterError? {
    connectivityProvider.stop()
    eventSink = nil
    return nil
  }
}
