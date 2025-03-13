// // ignore: library_prefixes

import "package:flutter/widgets.dart";
import "package:med_meet_flutter/core/constants/api_constants.dart";
import "package:med_meet_flutter/core/helpers/pref_helper.dart";
import "package:med_meet_flutter/core/utils/app_constants.dart";
import "package:socket_io_client/socket_io_client.dart" as io;

enum SocketConnectionState {
  connected,
  disconnected,
  connecting,
}

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  late io.Socket socket;
  // base asseturl is the same as base socket url
  final connectionURL = ApiConstants.baseAssetUrl;
  SocketConnectionState connectionState = SocketConnectionState.disconnected;

  Future<void> socketInitialize() async {
    if (connectionState == SocketConnectionState.disconnected) {
      try {
        connectionState = SocketConnectionState.connecting;
        final authToken = await PrefsHelper.getString(AppConstants.bearerToken);

        final optionBuilder = io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'Authorization': 'Bearer $authToken'}) // optional
            .build();

        socket = io.io(connectionURL, optionBuilder);
        socket.connect();
        socket.on('connect', _onConnect);
        socket.on('disconnect', _onDisconnect);
        socket.on('connect_error', _onConnectError);
        socket.on('error', _onError);
      } catch (e) {
        debugPrint("============>>>>>>>> Error in Socket \n ===>>>> $e");
        connectionState = SocketConnectionState.disconnected;
      }
    } else {
      debugPrint("Socket Already Connected or being connected");
    }
  }

  void emit(String event, dynamic data) {
    if (connectionState == SocketConnectionState.connected) {
      socket.emit(event, data);
    } else {
      // ignore: avoid_print
      print('Cannot emit event. Socket is not connected.');
    }
  }

  /// Listen for an event from the server
  void on(String event, Function(dynamic data) callback) {
    if (connectionState == SocketConnectionState.connected) {
      socket.on(event, callback);
    } else {
      debugPrint("Socket is not connected yet");
    }
  }

  void _onConnect(dynamic data) {
    connectionState = SocketConnectionState.connected;
    // ignore: avoid_print
    print('Socket connected $connectionState');
  }

  /// Handle disconnection
  void _onDisconnect(dynamic reason) {
    // ignore: avoid_print
    print('Socket disconnected: $reason');
  }

  /// Handle connection errors
  void _onConnectError(dynamic error) {
    // ignore: avoid_print
    print('Connection error: $error');
  }

  /// Handle general socket errors
  void _onError(dynamic error) {
    // ignore: avoid_print
    print('Socket error: $error');
  }
}

// import 'package:socket_io_client/socket_io_client.dart' as IO;

// enum SocketConnectionState {
//   connected,
//   disconnected,
//   connecting,
// }

// class SocketService {
//   late IO.Socket _socket;
//   SocketConnectionState _connectionState = SocketConnectionState.disconnected;

//   /// Get the current socket connection state
//   SocketConnectionState get connectionState => _connectionState;

//   /// Initialize the socket connection
//   void initializeSocket(String url,
//       {String? authToken, Map<String, dynamic>? queryParams}) {
//     try {
//       _connectionState = SocketConnectionState.connecting;
//       final options = IO.OptionBuilder()
//           .setTransports(['websocket']) // Use WebSocket transport
//           .enableForceNew() // Force a new socket connection instance
//           .setQuery(queryParams ?? {}) // Optional query parameters
//           .setExtraHeaders({
//             'Authorization': 'Bearer $authToken'
//           }) // Add auth token to headers
//           .build();

//       _socket = IO.io(url, options);

//       // Attach event listeners
//       _socket.on('connect', _onConnect);
//       _socket.on('disconnect', _onDisconnect);
//       _socket.on('connect_error', _onConnectError);
//       _socket.on('error', _onError);
//     } catch (e) {
//       // ignore: avoid_print
//       print('Socket initialization error: $e');
//       _connectionState = SocketConnectionState.disconnected;
//     }
//   }

//   /// Handle successful connection
//   void _onConnect(dynamic data) {
//     // ignore: avoid_print
//     print('Socket connected');
//     _connectionState = SocketConnectionState.connected;
//   }

//   /// Handle disconnection
//   void _onDisconnect(dynamic reason) {
//     // ignore: avoid_print
//     print('Socket disconnected: $reason');
//     _connectionState = SocketConnectionState.disconnected;
//   }

//   /// Handle connection errors
//   void _onConnectError(dynamic error) {
//     // ignore: avoid_print
//     print('Connection error: $error');
//     _connectionState = SocketConnectionState.disconnected;
//   }

//   /// Handle general socket errors
//   void _onError(dynamic error) {
//     // ignore: avoid_print
//     print('Socket error: $error');
//   }

//   /// Emit an event to the server
//   void emit(String event, dynamic data) {
//     if (_connectionState == SocketConnectionState.connected) {
//       _socket.emit(event, data);
//     } else {
//       // ignore: avoid_print
//       print('Cannot emit event. Socket is not connected.');
//     }
//   }

//   /// Listen for an event from the server
//   void on(String event, Function(dynamic data) callback) {
//     _socket.on(event, callback);
//   }

//   /// Remove a specific event listener
//   void off(String event) {
//     _socket.off(event);
//   }

//   /// Check if the socket is currently connected
//   bool isConnected() {
//     return _socket.connected;
//   }

//   /// Disconnect the socket
//   void disconnect() {
//     _socket.disconnect();
//   }

//   /// Dispose the socket
//   void dispose() {
//     _socket.dispose();
//     _connectionState = SocketConnectionState.disconnected;
//   }
// }
