// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_network_info.dart';

export 'src/enums.dart';

/// The interface that implementations of network_info must implement.
///
/// Platform implementations should extend this class rather than implement it as `NetworkInfo`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [NetworkInfoPlatform] methods.
abstract class NetworkInfoPlatform extends PlatformInterface {
  /// Constructs a NetworkInfoPlatform.
  NetworkInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static NetworkInfoPlatform _instance = MethodChannelNetworkInfo();

  /// The default instance of [NetworkInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelNetworkInfo].
  static NetworkInfoPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [NetworkInfoPlatform] when they register themselves.
  static set instance(NetworkInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Obtains the wifi name (SSID) of the connected network
  Future<String?> getWifiName() {
    throw UnimplementedError('getWifiName() has not been implemented.');
  }

  /// Obtains the wifi BSSID of the connected network.
  Future<String?> getWifiBSSID() {
    throw UnimplementedError('getWifiBSSID() has not been implemented.');
  }

  /// Obtains the IP v4 address of the connected wifi network
  Future<String?> getWifiIP() {
    throw UnimplementedError('getWifiIP() has not been implemented.');
  }

  /// Obtains the IP v6 address of the connected wifi network
  Future<String?> getWifiIPv6() {
    throw UnimplementedError('getWifiIPv6() has not been implemented.');
  }

  /// Obtains the submask of the connected wifi network
  Future<String?> getWifiSubmask() {
    throw UnimplementedError('getWifiSubmask() has not been implemented.');
  }

  /// Obtains the gateway IP address of the connected wifi network
  Future<String?> getWifiGatewayIP() {
    throw UnimplementedError('getWifiGatewayIP() has not been implemented.');
  }

  /// Obtains the broadcast of the connected wifi network
  Future<String?> getWifiBroadcast() {
    throw UnimplementedError('getWifiBroadcast() has not been implemented.');
  }
}
