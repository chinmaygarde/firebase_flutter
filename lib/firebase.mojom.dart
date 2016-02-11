// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library firebase_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;

class EventType extends bindings.MojoEnum {
  static const EventType eventTypeChildAdded = const EventType._(0);
  static const EventType eventTypeChildRemoved = const EventType._(1);
  static const EventType eventTypeChildChanged = const EventType._(2);
  static const EventType eventTypeChildMoved = const EventType._(3);
  static const EventType eventTypeValue = const EventType._(4);

  const EventType._(int v) : super(v);

  static const Map<String, EventType> valuesMap = const {
    "eventTypeChildAdded": eventTypeChildAdded,
    "eventTypeChildRemoved": eventTypeChildRemoved,
    "eventTypeChildChanged": eventTypeChildChanged,
    "eventTypeChildMoved": eventTypeChildMoved,
    "eventTypeValue": eventTypeValue,
  };
  static const List<EventType> values = const [
    eventTypeChildAdded,
    eventTypeChildRemoved,
    eventTypeChildChanged,
    eventTypeChildMoved,
    eventTypeValue,
  ];

  static EventType valueOf(String name) => valuesMap[name];

  factory EventType(int v) {
    switch (v) {
      case 0:
        return eventTypeChildAdded;
      case 1:
        return eventTypeChildRemoved;
      case 2:
        return eventTypeChildChanged;
      case 3:
        return eventTypeChildMoved;
      case 4:
        return eventTypeValue;
      default:
        return null;
    }
  }

  static EventType decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    EventType result = new EventType(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum EventType.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case eventTypeChildAdded:
        return 'EventType.eventTypeChildAdded';
      case eventTypeChildRemoved:
        return 'EventType.eventTypeChildRemoved';
      case eventTypeChildChanged:
        return 'EventType.eventTypeChildChanged';
      case eventTypeChildMoved:
        return 'EventType.eventTypeChildMoved';
      case eventTypeValue:
        return 'EventType.eventTypeValue';
    }
  }

  int toJson() => mojoEnumValue;
}



class DataSnapshot extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String key = null;
  String jsonValue = null;

  DataSnapshot() : super(kVersions.last.size);

  static DataSnapshot deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static DataSnapshot decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DataSnapshot result = new DataSnapshot();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.key = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.jsonValue = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(key, 8, false);
    
    encoder0.encodeString(jsonValue, 16, false);
  }

  String toString() {
    return "DataSnapshot("
           "key: $key" ", "
           "jsonValue: $jsonValue" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["key"] = key;
    map["jsonValue"] = jsonValue;
    return map;
  }
}


class Error extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int code = 0;
  String message = null;

  Error() : super(kVersions.last.size);

  static Error deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Error decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Error result = new Error();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.code = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.message = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(code, 8);
    
    encoder0.encodeString(message, 16, false);
  }

  String toString() {
    return "Error("
           "code: $code" ", "
           "message: $message" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["code"] = code;
    map["message"] = message;
    return map;
  }
}


class AuthData extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String uid = null;
  String provider = null;
  String token = null;

  AuthData() : super(kVersions.last.size);

  static AuthData deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static AuthData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AuthData result = new AuthData();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.uid = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.provider = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.token = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(uid, 8, false);
    
    encoder0.encodeString(provider, 16, false);
    
    encoder0.encodeString(token, 24, false);
  }

  String toString() {
    return "AuthData("
           "uid: $uid" ", "
           "provider: $provider" ", "
           "token: $token" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["uid"] = uid;
    map["provider"] = provider;
    map["token"] = token;
    return map;
  }
}


class _ValueEventListenerOnCancelledParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  _ValueEventListenerOnCancelledParams() : super(kVersions.last.size);

  static _ValueEventListenerOnCancelledParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ValueEventListenerOnCancelledParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ValueEventListenerOnCancelledParams result = new _ValueEventListenerOnCancelledParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, false);
  }

  String toString() {
    return "_ValueEventListenerOnCancelledParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _ValueEventListenerOnDataChangeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  DataSnapshot snapshot = null;

  _ValueEventListenerOnDataChangeParams() : super(kVersions.last.size);

  static _ValueEventListenerOnDataChangeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ValueEventListenerOnDataChangeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ValueEventListenerOnDataChangeParams result = new _ValueEventListenerOnDataChangeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.snapshot = DataSnapshot.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(snapshot, 8, false);
  }

  String toString() {
    return "_ValueEventListenerOnDataChangeParams("
           "snapshot: $snapshot" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["snapshot"] = snapshot;
    return map;
  }
}


class _ChildEventListenerOnCancelledParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  _ChildEventListenerOnCancelledParams() : super(kVersions.last.size);

  static _ChildEventListenerOnCancelledParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ChildEventListenerOnCancelledParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ChildEventListenerOnCancelledParams result = new _ChildEventListenerOnCancelledParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, false);
  }

  String toString() {
    return "_ChildEventListenerOnCancelledParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _ChildEventListenerOnChildAddedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  DataSnapshot snapshot = null;
  String previousChildName = null;

  _ChildEventListenerOnChildAddedParams() : super(kVersions.last.size);

  static _ChildEventListenerOnChildAddedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ChildEventListenerOnChildAddedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ChildEventListenerOnChildAddedParams result = new _ChildEventListenerOnChildAddedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.snapshot = DataSnapshot.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.previousChildName = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(snapshot, 8, false);
    
    encoder0.encodeString(previousChildName, 16, true);
  }

  String toString() {
    return "_ChildEventListenerOnChildAddedParams("
           "snapshot: $snapshot" ", "
           "previousChildName: $previousChildName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["snapshot"] = snapshot;
    map["previousChildName"] = previousChildName;
    return map;
  }
}


class _ChildEventListenerOnChildChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  DataSnapshot snapshot = null;
  String previousChildName = null;

  _ChildEventListenerOnChildChangedParams() : super(kVersions.last.size);

  static _ChildEventListenerOnChildChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ChildEventListenerOnChildChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ChildEventListenerOnChildChangedParams result = new _ChildEventListenerOnChildChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.snapshot = DataSnapshot.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.previousChildName = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(snapshot, 8, false);
    
    encoder0.encodeString(previousChildName, 16, true);
  }

  String toString() {
    return "_ChildEventListenerOnChildChangedParams("
           "snapshot: $snapshot" ", "
           "previousChildName: $previousChildName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["snapshot"] = snapshot;
    map["previousChildName"] = previousChildName;
    return map;
  }
}


class _ChildEventListenerOnChildMovedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  DataSnapshot snapshot = null;
  String previousChildName = null;

  _ChildEventListenerOnChildMovedParams() : super(kVersions.last.size);

  static _ChildEventListenerOnChildMovedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ChildEventListenerOnChildMovedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ChildEventListenerOnChildMovedParams result = new _ChildEventListenerOnChildMovedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.snapshot = DataSnapshot.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.previousChildName = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(snapshot, 8, false);
    
    encoder0.encodeString(previousChildName, 16, true);
  }

  String toString() {
    return "_ChildEventListenerOnChildMovedParams("
           "snapshot: $snapshot" ", "
           "previousChildName: $previousChildName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["snapshot"] = snapshot;
    map["previousChildName"] = previousChildName;
    return map;
  }
}


class _ChildEventListenerOnChildRemovedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  DataSnapshot snapshot = null;

  _ChildEventListenerOnChildRemovedParams() : super(kVersions.last.size);

  static _ChildEventListenerOnChildRemovedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ChildEventListenerOnChildRemovedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ChildEventListenerOnChildRemovedParams result = new _ChildEventListenerOnChildRemovedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.snapshot = DataSnapshot.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(snapshot, 8, false);
  }

  String toString() {
    return "_ChildEventListenerOnChildRemovedParams("
           "snapshot: $snapshot" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["snapshot"] = snapshot;
    return map;
  }
}


class _FirebaseInitWithUrlParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  _FirebaseInitWithUrlParams() : super(kVersions.last.size);

  static _FirebaseInitWithUrlParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseInitWithUrlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseInitWithUrlParams result = new _FirebaseInitWithUrlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(url, 8, false);
  }

  String toString() {
    return "_FirebaseInitWithUrlParams("
           "url: $url" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["url"] = url;
    return map;
  }
}


class _FirebaseAddValueEventListenerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object listener = null;

  _FirebaseAddValueEventListenerParams() : super(kVersions.last.size);

  static _FirebaseAddValueEventListenerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseAddValueEventListenerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseAddValueEventListenerParams result = new _FirebaseAddValueEventListenerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.listener = decoder0.decodeServiceInterface(8, false, ValueEventListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterface(listener, 8, false);
  }

  String toString() {
    return "_FirebaseAddValueEventListenerParams("
           "listener: $listener" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FirebaseAddChildEventListenerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object listener = null;

  _FirebaseAddChildEventListenerParams() : super(kVersions.last.size);

  static _FirebaseAddChildEventListenerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseAddChildEventListenerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseAddChildEventListenerParams result = new _FirebaseAddChildEventListenerParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.listener = decoder0.decodeServiceInterface(8, false, ChildEventListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterface(listener, 8, false);
  }

  String toString() {
    return "_FirebaseAddChildEventListenerParams("
           "listener: $listener" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FirebaseObserveSingleEventOfTypeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  EventType eventType = null;

  _FirebaseObserveSingleEventOfTypeParams() : super(kVersions.last.size);

  static _FirebaseObserveSingleEventOfTypeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseObserveSingleEventOfTypeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseObserveSingleEventOfTypeParams result = new _FirebaseObserveSingleEventOfTypeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
        result.eventType = EventType.decode(decoder0, 8);
        if (result.eventType == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable EventType.');
        }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeEnum(eventType, 8);
  }

  String toString() {
    return "_FirebaseObserveSingleEventOfTypeParams("
           "eventType: $eventType" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["eventType"] = eventType;
    return map;
  }
}


class FirebaseObserveSingleEventOfTypeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  DataSnapshot snapshot = null;

  FirebaseObserveSingleEventOfTypeResponseParams() : super(kVersions.last.size);

  static FirebaseObserveSingleEventOfTypeResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseObserveSingleEventOfTypeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseObserveSingleEventOfTypeResponseParams result = new FirebaseObserveSingleEventOfTypeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.snapshot = DataSnapshot.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(snapshot, 8, false);
  }

  String toString() {
    return "FirebaseObserveSingleEventOfTypeResponseParams("
           "snapshot: $snapshot" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["snapshot"] = snapshot;
    return map;
  }
}


class _FirebaseAuthWithCustomTokenParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String token = null;

  _FirebaseAuthWithCustomTokenParams() : super(kVersions.last.size);

  static _FirebaseAuthWithCustomTokenParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseAuthWithCustomTokenParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseAuthWithCustomTokenParams result = new _FirebaseAuthWithCustomTokenParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.token = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(token, 8, false);
  }

  String toString() {
    return "_FirebaseAuthWithCustomTokenParams("
           "token: $token" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["token"] = token;
    return map;
  }
}


class FirebaseAuthWithCustomTokenResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error error = null;
  AuthData authData = null;

  FirebaseAuthWithCustomTokenResponseParams() : super(kVersions.last.size);

  static FirebaseAuthWithCustomTokenResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseAuthWithCustomTokenResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseAuthWithCustomTokenResponseParams result = new FirebaseAuthWithCustomTokenResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.authData = AuthData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeStruct(authData, 16, true);
  }

  String toString() {
    return "FirebaseAuthWithCustomTokenResponseParams("
           "error: $error" ", "
           "authData: $authData" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    map["authData"] = authData;
    return map;
  }
}


class _FirebaseAuthAnonymouslyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _FirebaseAuthAnonymouslyParams() : super(kVersions.last.size);

  static _FirebaseAuthAnonymouslyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseAuthAnonymouslyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseAuthAnonymouslyParams result = new _FirebaseAuthAnonymouslyParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_FirebaseAuthAnonymouslyParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class FirebaseAuthAnonymouslyResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error error = null;
  AuthData authData = null;

  FirebaseAuthAnonymouslyResponseParams() : super(kVersions.last.size);

  static FirebaseAuthAnonymouslyResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseAuthAnonymouslyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseAuthAnonymouslyResponseParams result = new FirebaseAuthAnonymouslyResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.authData = AuthData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeStruct(authData, 16, true);
  }

  String toString() {
    return "FirebaseAuthAnonymouslyResponseParams("
           "error: $error" ", "
           "authData: $authData" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    map["authData"] = authData;
    return map;
  }
}


class _FirebaseAuthWithOAuthTokenParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String provider = null;
  String credentials = null;

  _FirebaseAuthWithOAuthTokenParams() : super(kVersions.last.size);

  static _FirebaseAuthWithOAuthTokenParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseAuthWithOAuthTokenParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseAuthWithOAuthTokenParams result = new _FirebaseAuthWithOAuthTokenParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.provider = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.credentials = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(provider, 8, false);
    
    encoder0.encodeString(credentials, 16, false);
  }

  String toString() {
    return "_FirebaseAuthWithOAuthTokenParams("
           "provider: $provider" ", "
           "credentials: $credentials" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["provider"] = provider;
    map["credentials"] = credentials;
    return map;
  }
}


class FirebaseAuthWithOAuthTokenResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error error = null;
  AuthData authData = null;

  FirebaseAuthWithOAuthTokenResponseParams() : super(kVersions.last.size);

  static FirebaseAuthWithOAuthTokenResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseAuthWithOAuthTokenResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseAuthWithOAuthTokenResponseParams result = new FirebaseAuthWithOAuthTokenResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.authData = AuthData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeStruct(authData, 16, true);
  }

  String toString() {
    return "FirebaseAuthWithOAuthTokenResponseParams("
           "error: $error" ", "
           "authData: $authData" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    map["authData"] = authData;
    return map;
  }
}


class _FirebaseAuthWithPasswordParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String email = null;
  String password = null;

  _FirebaseAuthWithPasswordParams() : super(kVersions.last.size);

  static _FirebaseAuthWithPasswordParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseAuthWithPasswordParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseAuthWithPasswordParams result = new _FirebaseAuthWithPasswordParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.email = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.password = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(email, 8, false);
    
    encoder0.encodeString(password, 16, false);
  }

  String toString() {
    return "_FirebaseAuthWithPasswordParams("
           "email: $email" ", "
           "password: $password" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}


class FirebaseAuthWithPasswordResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error error = null;
  AuthData authData = null;

  FirebaseAuthWithPasswordResponseParams() : super(kVersions.last.size);

  static FirebaseAuthWithPasswordResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseAuthWithPasswordResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseAuthWithPasswordResponseParams result = new FirebaseAuthWithPasswordResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.authData = AuthData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeStruct(authData, 16, true);
  }

  String toString() {
    return "FirebaseAuthWithPasswordResponseParams("
           "error: $error" ", "
           "authData: $authData" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    map["authData"] = authData;
    return map;
  }
}


class _FirebaseUnauthParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _FirebaseUnauthParams() : super(kVersions.last.size);

  static _FirebaseUnauthParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseUnauthParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseUnauthParams result = new _FirebaseUnauthParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_FirebaseUnauthParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class FirebaseUnauthResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseUnauthResponseParams() : super(kVersions.last.size);

  static FirebaseUnauthResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseUnauthResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseUnauthResponseParams result = new FirebaseUnauthResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseUnauthResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebaseGetChildParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String path = null;
  Object child = null;

  _FirebaseGetChildParams() : super(kVersions.last.size);

  static _FirebaseGetChildParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseGetChildParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseGetChildParams result = new _FirebaseGetChildParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.path = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.child = decoder0.decodeInterfaceRequest(16, false, FirebaseStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(path, 8, false);
    
    encoder0.encodeInterfaceRequest(child, 16, false);
  }

  String toString() {
    return "_FirebaseGetChildParams("
           "path: $path" ", "
           "child: $child" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FirebaseGetParentParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object parent = null;

  _FirebaseGetParentParams() : super(kVersions.last.size);

  static _FirebaseGetParentParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseGetParentParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseGetParentParams result = new _FirebaseGetParentParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.parent = decoder0.decodeInterfaceRequest(8, false, FirebaseStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterfaceRequest(parent, 8, false);
  }

  String toString() {
    return "_FirebaseGetParentParams("
           "parent: $parent" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FirebaseGetRootParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object root = null;

  _FirebaseGetRootParams() : super(kVersions.last.size);

  static _FirebaseGetRootParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseGetRootParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseGetRootParams result = new _FirebaseGetRootParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.root = decoder0.decodeInterfaceRequest(8, false, FirebaseStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterfaceRequest(root, 8, false);
  }

  String toString() {
    return "_FirebaseGetRootParams("
           "root: $root" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _FirebaseSetValueParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String jsonValue = null;
  int priority = 0;
  bool hasPriority = false;

  _FirebaseSetValueParams() : super(kVersions.last.size);

  static _FirebaseSetValueParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseSetValueParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseSetValueParams result = new _FirebaseSetValueParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.jsonValue = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.priority = decoder0.decodeInt32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.hasPriority = decoder0.decodeBool(20, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(jsonValue, 8, false);
    
    encoder0.encodeInt32(priority, 16);
    
    encoder0.encodeBool(hasPriority, 20, 0);
  }

  String toString() {
    return "_FirebaseSetValueParams("
           "jsonValue: $jsonValue" ", "
           "priority: $priority" ", "
           "hasPriority: $hasPriority" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["jsonValue"] = jsonValue;
    map["priority"] = priority;
    map["hasPriority"] = hasPriority;
    return map;
  }
}


class FirebaseSetValueResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseSetValueResponseParams() : super(kVersions.last.size);

  static FirebaseSetValueResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseSetValueResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseSetValueResponseParams result = new FirebaseSetValueResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseSetValueResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebaseRemoveValueParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _FirebaseRemoveValueParams() : super(kVersions.last.size);

  static _FirebaseRemoveValueParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseRemoveValueParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseRemoveValueParams result = new _FirebaseRemoveValueParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_FirebaseRemoveValueParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class FirebaseRemoveValueResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseRemoveValueResponseParams() : super(kVersions.last.size);

  static FirebaseRemoveValueResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseRemoveValueResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseRemoveValueResponseParams result = new FirebaseRemoveValueResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseRemoveValueResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebasePushParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object child = null;

  _FirebasePushParams() : super(kVersions.last.size);

  static _FirebasePushParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebasePushParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebasePushParams result = new _FirebasePushParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.child = decoder0.decodeInterfaceRequest(8, false, FirebaseStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterfaceRequest(child, 8, false);
  }

  String toString() {
    return "_FirebasePushParams("
           "child: $child" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class FirebasePushResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String key = null;

  FirebasePushResponseParams() : super(kVersions.last.size);

  static FirebasePushResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebasePushResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebasePushResponseParams result = new FirebasePushResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.key = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(key, 8, false);
  }

  String toString() {
    return "FirebasePushResponseParams("
           "key: $key" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["key"] = key;
    return map;
  }
}


class _FirebaseSetPriorityParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int priority = 0;

  _FirebaseSetPriorityParams() : super(kVersions.last.size);

  static _FirebaseSetPriorityParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseSetPriorityParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseSetPriorityParams result = new _FirebaseSetPriorityParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.priority = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(priority, 8);
  }

  String toString() {
    return "_FirebaseSetPriorityParams("
           "priority: $priority" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["priority"] = priority;
    return map;
  }
}


class FirebaseSetPriorityResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseSetPriorityResponseParams() : super(kVersions.last.size);

  static FirebaseSetPriorityResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseSetPriorityResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseSetPriorityResponseParams result = new FirebaseSetPriorityResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseSetPriorityResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebaseCreateUserParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String email = null;
  String password = null;

  _FirebaseCreateUserParams() : super(kVersions.last.size);

  static _FirebaseCreateUserParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseCreateUserParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseCreateUserParams result = new _FirebaseCreateUserParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.email = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.password = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(email, 8, false);
    
    encoder0.encodeString(password, 16, false);
  }

  String toString() {
    return "_FirebaseCreateUserParams("
           "email: $email" ", "
           "password: $password" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}


class FirebaseCreateUserResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error error = null;
  String jsonValue = null;

  FirebaseCreateUserResponseParams() : super(kVersions.last.size);

  static FirebaseCreateUserResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseCreateUserResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseCreateUserResponseParams result = new FirebaseCreateUserResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.jsonValue = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
    
    encoder0.encodeString(jsonValue, 16, true);
  }

  String toString() {
    return "FirebaseCreateUserResponseParams("
           "error: $error" ", "
           "jsonValue: $jsonValue" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    map["jsonValue"] = jsonValue;
    return map;
  }
}


class _FirebaseChangeEmailParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String oldEmail = null;
  String password = null;
  String newEmail = null;

  _FirebaseChangeEmailParams() : super(kVersions.last.size);

  static _FirebaseChangeEmailParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseChangeEmailParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseChangeEmailParams result = new _FirebaseChangeEmailParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.oldEmail = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.password = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.newEmail = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(oldEmail, 8, false);
    
    encoder0.encodeString(password, 16, false);
    
    encoder0.encodeString(newEmail, 24, false);
  }

  String toString() {
    return "_FirebaseChangeEmailParams("
           "oldEmail: $oldEmail" ", "
           "password: $password" ", "
           "newEmail: $newEmail" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["oldEmail"] = oldEmail;
    map["password"] = password;
    map["newEmail"] = newEmail;
    return map;
  }
}


class FirebaseChangeEmailResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseChangeEmailResponseParams() : super(kVersions.last.size);

  static FirebaseChangeEmailResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseChangeEmailResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseChangeEmailResponseParams result = new FirebaseChangeEmailResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseChangeEmailResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebaseChangePasswordParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String newPassword = null;
  String email = null;
  String oldPassword = null;

  _FirebaseChangePasswordParams() : super(kVersions.last.size);

  static _FirebaseChangePasswordParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseChangePasswordParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseChangePasswordParams result = new _FirebaseChangePasswordParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.newPassword = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.email = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.oldPassword = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(newPassword, 8, false);
    
    encoder0.encodeString(email, 16, false);
    
    encoder0.encodeString(oldPassword, 24, false);
  }

  String toString() {
    return "_FirebaseChangePasswordParams("
           "newPassword: $newPassword" ", "
           "email: $email" ", "
           "oldPassword: $oldPassword" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["newPassword"] = newPassword;
    map["email"] = email;
    map["oldPassword"] = oldPassword;
    return map;
  }
}


class FirebaseChangePasswordResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseChangePasswordResponseParams() : super(kVersions.last.size);

  static FirebaseChangePasswordResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseChangePasswordResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseChangePasswordResponseParams result = new FirebaseChangePasswordResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseChangePasswordResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebaseRemoveUserParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String email = null;
  String password = null;

  _FirebaseRemoveUserParams() : super(kVersions.last.size);

  static _FirebaseRemoveUserParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseRemoveUserParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseRemoveUserParams result = new _FirebaseRemoveUserParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.email = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.password = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(email, 8, false);
    
    encoder0.encodeString(password, 16, false);
  }

  String toString() {
    return "_FirebaseRemoveUserParams("
           "email: $email" ", "
           "password: $password" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}


class FirebaseRemoveUserResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseRemoveUserResponseParams() : super(kVersions.last.size);

  static FirebaseRemoveUserResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseRemoveUserResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseRemoveUserResponseParams result = new FirebaseRemoveUserResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseRemoveUserResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}


class _FirebaseResetPasswordParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String email = null;

  _FirebaseResetPasswordParams() : super(kVersions.last.size);

  static _FirebaseResetPasswordParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _FirebaseResetPasswordParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _FirebaseResetPasswordParams result = new _FirebaseResetPasswordParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.email = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(email, 8, false);
  }

  String toString() {
    return "_FirebaseResetPasswordParams("
           "email: $email" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["email"] = email;
    return map;
  }
}


class FirebaseResetPasswordResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error error = null;

  FirebaseResetPasswordResponseParams() : super(kVersions.last.size);

  static FirebaseResetPasswordResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static FirebaseResetPasswordResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FirebaseResetPasswordResponseParams result = new FirebaseResetPasswordResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.error = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(error, 8, true);
  }

  String toString() {
    return "FirebaseResetPasswordResponseParams("
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["error"] = error;
    return map;
  }
}

const int _ValueEventListener_onCancelledName = 0;
const int _ValueEventListener_onDataChangeName = 1;

abstract class ValueEventListener {
  static const String serviceName = null;
  void onCancelled(Error error);
  void onDataChange(DataSnapshot snapshot);
}


class _ValueEventListenerProxyImpl extends bindings.Proxy {
  _ValueEventListenerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ValueEventListenerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _ValueEventListenerProxyImpl.unbound() : super.unbound();

  static _ValueEventListenerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _ValueEventListenerProxyImpl"));
    return new _ValueEventListenerProxyImpl.fromEndpoint(endpoint);
  }

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_ValueEventListenerProxyImpl($superString)";
  }
}


class _ValueEventListenerProxyCalls implements ValueEventListener {
  _ValueEventListenerProxyImpl _proxyImpl;

  _ValueEventListenerProxyCalls(this._proxyImpl);
    void onCancelled(Error error) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ValueEventListenerOnCancelledParams();
      params.error = error;
      _proxyImpl.sendMessage(params, _ValueEventListener_onCancelledName);
    }
    void onDataChange(DataSnapshot snapshot) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ValueEventListenerOnDataChangeParams();
      params.snapshot = snapshot;
      _proxyImpl.sendMessage(params, _ValueEventListener_onDataChangeName);
    }
}


class ValueEventListenerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ValueEventListener ptr;

  ValueEventListenerProxy(_ValueEventListenerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ValueEventListenerProxyCalls(proxyImpl);

  ValueEventListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _ValueEventListenerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ValueEventListenerProxyCalls(impl);
  }

  ValueEventListenerProxy.fromHandle(core.MojoHandle handle) :
      impl = new _ValueEventListenerProxyImpl.fromHandle(handle) {
    ptr = new _ValueEventListenerProxyCalls(impl);
  }

  ValueEventListenerProxy.unbound() :
      impl = new _ValueEventListenerProxyImpl.unbound() {
    ptr = new _ValueEventListenerProxyCalls(impl);
  }

  factory ValueEventListenerProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ValueEventListenerProxy p = new ValueEventListenerProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static ValueEventListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ValueEventListenerProxy"));
    return new ValueEventListenerProxy.fromEndpoint(endpoint);
  }

  String get serviceName => ValueEventListener.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "ValueEventListenerProxy($impl)";
  }
}


class ValueEventListenerStub extends bindings.Stub {
  ValueEventListener _impl = null;

  ValueEventListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ValueEventListenerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ValueEventListenerStub.unbound() : super.unbound();

  static ValueEventListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ValueEventListenerStub"));
    return new ValueEventListenerStub.fromEndpoint(endpoint);
  }



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _ValueEventListener_onCancelledName:
        var params = _ValueEventListenerOnCancelledParams.deserialize(
            message.payload);
        _impl.onCancelled(params.error);
        break;
      case _ValueEventListener_onDataChangeName:
        var params = _ValueEventListenerOnDataChangeParams.deserialize(
            message.payload);
        _impl.onDataChange(params.snapshot);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ValueEventListener get impl => _impl;
  set impl(ValueEventListener d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ValueEventListenerStub($superString)";
  }

  int get version => 0;
}

const int _ChildEventListener_onCancelledName = 0;
const int _ChildEventListener_onChildAddedName = 1;
const int _ChildEventListener_onChildChangedName = 2;
const int _ChildEventListener_onChildMovedName = 3;
const int _ChildEventListener_onChildRemovedName = 4;

abstract class ChildEventListener {
  static const String serviceName = null;
  void onCancelled(Error error);
  void onChildAdded(DataSnapshot snapshot, String previousChildName);
  void onChildChanged(DataSnapshot snapshot, String previousChildName);
  void onChildMoved(DataSnapshot snapshot, String previousChildName);
  void onChildRemoved(DataSnapshot snapshot);
}


class _ChildEventListenerProxyImpl extends bindings.Proxy {
  _ChildEventListenerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ChildEventListenerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _ChildEventListenerProxyImpl.unbound() : super.unbound();

  static _ChildEventListenerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _ChildEventListenerProxyImpl"));
    return new _ChildEventListenerProxyImpl.fromEndpoint(endpoint);
  }

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_ChildEventListenerProxyImpl($superString)";
  }
}


class _ChildEventListenerProxyCalls implements ChildEventListener {
  _ChildEventListenerProxyImpl _proxyImpl;

  _ChildEventListenerProxyCalls(this._proxyImpl);
    void onCancelled(Error error) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ChildEventListenerOnCancelledParams();
      params.error = error;
      _proxyImpl.sendMessage(params, _ChildEventListener_onCancelledName);
    }
    void onChildAdded(DataSnapshot snapshot, String previousChildName) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ChildEventListenerOnChildAddedParams();
      params.snapshot = snapshot;
      params.previousChildName = previousChildName;
      _proxyImpl.sendMessage(params, _ChildEventListener_onChildAddedName);
    }
    void onChildChanged(DataSnapshot snapshot, String previousChildName) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ChildEventListenerOnChildChangedParams();
      params.snapshot = snapshot;
      params.previousChildName = previousChildName;
      _proxyImpl.sendMessage(params, _ChildEventListener_onChildChangedName);
    }
    void onChildMoved(DataSnapshot snapshot, String previousChildName) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ChildEventListenerOnChildMovedParams();
      params.snapshot = snapshot;
      params.previousChildName = previousChildName;
      _proxyImpl.sendMessage(params, _ChildEventListener_onChildMovedName);
    }
    void onChildRemoved(DataSnapshot snapshot) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ChildEventListenerOnChildRemovedParams();
      params.snapshot = snapshot;
      _proxyImpl.sendMessage(params, _ChildEventListener_onChildRemovedName);
    }
}


class ChildEventListenerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ChildEventListener ptr;

  ChildEventListenerProxy(_ChildEventListenerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ChildEventListenerProxyCalls(proxyImpl);

  ChildEventListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _ChildEventListenerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ChildEventListenerProxyCalls(impl);
  }

  ChildEventListenerProxy.fromHandle(core.MojoHandle handle) :
      impl = new _ChildEventListenerProxyImpl.fromHandle(handle) {
    ptr = new _ChildEventListenerProxyCalls(impl);
  }

  ChildEventListenerProxy.unbound() :
      impl = new _ChildEventListenerProxyImpl.unbound() {
    ptr = new _ChildEventListenerProxyCalls(impl);
  }

  factory ChildEventListenerProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ChildEventListenerProxy p = new ChildEventListenerProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static ChildEventListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ChildEventListenerProxy"));
    return new ChildEventListenerProxy.fromEndpoint(endpoint);
  }

  String get serviceName => ChildEventListener.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "ChildEventListenerProxy($impl)";
  }
}


class ChildEventListenerStub extends bindings.Stub {
  ChildEventListener _impl = null;

  ChildEventListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ChildEventListenerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ChildEventListenerStub.unbound() : super.unbound();

  static ChildEventListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ChildEventListenerStub"));
    return new ChildEventListenerStub.fromEndpoint(endpoint);
  }



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _ChildEventListener_onCancelledName:
        var params = _ChildEventListenerOnCancelledParams.deserialize(
            message.payload);
        _impl.onCancelled(params.error);
        break;
      case _ChildEventListener_onChildAddedName:
        var params = _ChildEventListenerOnChildAddedParams.deserialize(
            message.payload);
        _impl.onChildAdded(params.snapshot, params.previousChildName);
        break;
      case _ChildEventListener_onChildChangedName:
        var params = _ChildEventListenerOnChildChangedParams.deserialize(
            message.payload);
        _impl.onChildChanged(params.snapshot, params.previousChildName);
        break;
      case _ChildEventListener_onChildMovedName:
        var params = _ChildEventListenerOnChildMovedParams.deserialize(
            message.payload);
        _impl.onChildMoved(params.snapshot, params.previousChildName);
        break;
      case _ChildEventListener_onChildRemovedName:
        var params = _ChildEventListenerOnChildRemovedParams.deserialize(
            message.payload);
        _impl.onChildRemoved(params.snapshot);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ChildEventListener get impl => _impl;
  set impl(ChildEventListener d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ChildEventListenerStub($superString)";
  }

  int get version => 0;
}

const int _Firebase_initWithUrlName = 0;
const int _Firebase_addValueEventListenerName = 1;
const int _Firebase_addChildEventListenerName = 2;
const int _Firebase_observeSingleEventOfTypeName = 3;
const int _Firebase_authWithCustomTokenName = 4;
const int _Firebase_authAnonymouslyName = 5;
const int _Firebase_authWithOAuthTokenName = 6;
const int _Firebase_authWithPasswordName = 7;
const int _Firebase_unauthName = 8;
const int _Firebase_getChildName = 9;
const int _Firebase_getParentName = 10;
const int _Firebase_getRootName = 11;
const int _Firebase_setValueName = 12;
const int _Firebase_removeValueName = 13;
const int _Firebase_pushName = 14;
const int _Firebase_setPriorityName = 15;
const int _Firebase_createUserName = 16;
const int _Firebase_changeEmailName = 17;
const int _Firebase_changePasswordName = 18;
const int _Firebase_removeUserName = 19;
const int _Firebase_resetPasswordName = 20;

abstract class Firebase {
  static const String serviceName = "firebase::Firebase";
  void initWithUrl(String url);
  void addValueEventListener(Object listener);
  void addChildEventListener(Object listener);
  dynamic observeSingleEventOfType(EventType eventType,[Function responseFactory = null]);
  dynamic authWithCustomToken(String token,[Function responseFactory = null]);
  dynamic authAnonymously([Function responseFactory = null]);
  dynamic authWithOAuthToken(String provider,String credentials,[Function responseFactory = null]);
  dynamic authWithPassword(String email,String password,[Function responseFactory = null]);
  dynamic unauth([Function responseFactory = null]);
  void getChild(String path, Object child);
  void getParent(Object parent);
  void getRoot(Object root);
  dynamic setValue(String jsonValue,int priority,bool hasPriority,[Function responseFactory = null]);
  dynamic removeValue([Function responseFactory = null]);
  dynamic push(Object child,[Function responseFactory = null]);
  dynamic setPriority(int priority,[Function responseFactory = null]);
  dynamic createUser(String email,String password,[Function responseFactory = null]);
  dynamic changeEmail(String oldEmail,String password,String newEmail,[Function responseFactory = null]);
  dynamic changePassword(String newPassword,String email,String oldPassword,[Function responseFactory = null]);
  dynamic removeUser(String email,String password,[Function responseFactory = null]);
  dynamic resetPassword(String email,[Function responseFactory = null]);
}


class _FirebaseProxyImpl extends bindings.Proxy {
  _FirebaseProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _FirebaseProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _FirebaseProxyImpl.unbound() : super.unbound();

  static _FirebaseProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _FirebaseProxyImpl"));
    return new _FirebaseProxyImpl.fromEndpoint(endpoint);
  }

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _Firebase_observeSingleEventOfTypeName:
        var r = FirebaseObserveSingleEventOfTypeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_authWithCustomTokenName:
        var r = FirebaseAuthWithCustomTokenResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_authAnonymouslyName:
        var r = FirebaseAuthAnonymouslyResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_authWithOAuthTokenName:
        var r = FirebaseAuthWithOAuthTokenResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_authWithPasswordName:
        var r = FirebaseAuthWithPasswordResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_unauthName:
        var r = FirebaseUnauthResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_setValueName:
        var r = FirebaseSetValueResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_removeValueName:
        var r = FirebaseRemoveValueResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_pushName:
        var r = FirebasePushResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_setPriorityName:
        var r = FirebaseSetPriorityResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_createUserName:
        var r = FirebaseCreateUserResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_changeEmailName:
        var r = FirebaseChangeEmailResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_changePasswordName:
        var r = FirebaseChangePasswordResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_removeUserName:
        var r = FirebaseRemoveUserResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Firebase_resetPasswordName:
        var r = FirebaseResetPasswordResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_FirebaseProxyImpl($superString)";
  }
}


class _FirebaseProxyCalls implements Firebase {
  _FirebaseProxyImpl _proxyImpl;

  _FirebaseProxyCalls(this._proxyImpl);
    void initWithUrl(String url) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _FirebaseInitWithUrlParams();
      params.url = url;
      _proxyImpl.sendMessage(params, _Firebase_initWithUrlName);
    }
    void addValueEventListener(Object listener) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _FirebaseAddValueEventListenerParams();
      params.listener = listener;
      _proxyImpl.sendMessage(params, _Firebase_addValueEventListenerName);
    }
    void addChildEventListener(Object listener) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _FirebaseAddChildEventListenerParams();
      params.listener = listener;
      _proxyImpl.sendMessage(params, _Firebase_addChildEventListenerName);
    }
    dynamic observeSingleEventOfType(EventType eventType,[Function responseFactory = null]) {
      var params = new _FirebaseObserveSingleEventOfTypeParams();
      params.eventType = eventType;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_observeSingleEventOfTypeName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic authWithCustomToken(String token,[Function responseFactory = null]) {
      var params = new _FirebaseAuthWithCustomTokenParams();
      params.token = token;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_authWithCustomTokenName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic authAnonymously([Function responseFactory = null]) {
      var params = new _FirebaseAuthAnonymouslyParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_authAnonymouslyName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic authWithOAuthToken(String provider,String credentials,[Function responseFactory = null]) {
      var params = new _FirebaseAuthWithOAuthTokenParams();
      params.provider = provider;
      params.credentials = credentials;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_authWithOAuthTokenName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic authWithPassword(String email,String password,[Function responseFactory = null]) {
      var params = new _FirebaseAuthWithPasswordParams();
      params.email = email;
      params.password = password;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_authWithPasswordName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic unauth([Function responseFactory = null]) {
      var params = new _FirebaseUnauthParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_unauthName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void getChild(String path, Object child) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _FirebaseGetChildParams();
      params.path = path;
      params.child = child;
      _proxyImpl.sendMessage(params, _Firebase_getChildName);
    }
    void getParent(Object parent) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _FirebaseGetParentParams();
      params.parent = parent;
      _proxyImpl.sendMessage(params, _Firebase_getParentName);
    }
    void getRoot(Object root) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _FirebaseGetRootParams();
      params.root = root;
      _proxyImpl.sendMessage(params, _Firebase_getRootName);
    }
    dynamic setValue(String jsonValue,int priority,bool hasPriority,[Function responseFactory = null]) {
      var params = new _FirebaseSetValueParams();
      params.jsonValue = jsonValue;
      params.priority = priority;
      params.hasPriority = hasPriority;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_setValueName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic removeValue([Function responseFactory = null]) {
      var params = new _FirebaseRemoveValueParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_removeValueName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic push(Object child,[Function responseFactory = null]) {
      var params = new _FirebasePushParams();
      params.child = child;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_pushName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic setPriority(int priority,[Function responseFactory = null]) {
      var params = new _FirebaseSetPriorityParams();
      params.priority = priority;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_setPriorityName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic createUser(String email,String password,[Function responseFactory = null]) {
      var params = new _FirebaseCreateUserParams();
      params.email = email;
      params.password = password;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_createUserName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic changeEmail(String oldEmail,String password,String newEmail,[Function responseFactory = null]) {
      var params = new _FirebaseChangeEmailParams();
      params.oldEmail = oldEmail;
      params.password = password;
      params.newEmail = newEmail;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_changeEmailName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic changePassword(String newPassword,String email,String oldPassword,[Function responseFactory = null]) {
      var params = new _FirebaseChangePasswordParams();
      params.newPassword = newPassword;
      params.email = email;
      params.oldPassword = oldPassword;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_changePasswordName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic removeUser(String email,String password,[Function responseFactory = null]) {
      var params = new _FirebaseRemoveUserParams();
      params.email = email;
      params.password = password;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_removeUserName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic resetPassword(String email,[Function responseFactory = null]) {
      var params = new _FirebaseResetPasswordParams();
      params.email = email;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Firebase_resetPasswordName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class FirebaseProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Firebase ptr;

  FirebaseProxy(_FirebaseProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _FirebaseProxyCalls(proxyImpl);

  FirebaseProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _FirebaseProxyImpl.fromEndpoint(endpoint) {
    ptr = new _FirebaseProxyCalls(impl);
  }

  FirebaseProxy.fromHandle(core.MojoHandle handle) :
      impl = new _FirebaseProxyImpl.fromHandle(handle) {
    ptr = new _FirebaseProxyCalls(impl);
  }

  FirebaseProxy.unbound() :
      impl = new _FirebaseProxyImpl.unbound() {
    ptr = new _FirebaseProxyCalls(impl);
  }

  factory FirebaseProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    FirebaseProxy p = new FirebaseProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static FirebaseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FirebaseProxy"));
    return new FirebaseProxy.fromEndpoint(endpoint);
  }

  String get serviceName => Firebase.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "FirebaseProxy($impl)";
  }
}


class FirebaseStub extends bindings.Stub {
  Firebase _impl = null;

  FirebaseStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  FirebaseStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  FirebaseStub.unbound() : super.unbound();

  static FirebaseStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FirebaseStub"));
    return new FirebaseStub.fromEndpoint(endpoint);
  }


  FirebaseObserveSingleEventOfTypeResponseParams _FirebaseObserveSingleEventOfTypeResponseParamsFactory(DataSnapshot snapshot) {
    var mojo_factory_result = new FirebaseObserveSingleEventOfTypeResponseParams();
    mojo_factory_result.snapshot = snapshot;
    return mojo_factory_result;
  }
  FirebaseAuthWithCustomTokenResponseParams _FirebaseAuthWithCustomTokenResponseParamsFactory(Error error, AuthData authData) {
    var mojo_factory_result = new FirebaseAuthWithCustomTokenResponseParams();
    mojo_factory_result.error = error;
    mojo_factory_result.authData = authData;
    return mojo_factory_result;
  }
  FirebaseAuthAnonymouslyResponseParams _FirebaseAuthAnonymouslyResponseParamsFactory(Error error, AuthData authData) {
    var mojo_factory_result = new FirebaseAuthAnonymouslyResponseParams();
    mojo_factory_result.error = error;
    mojo_factory_result.authData = authData;
    return mojo_factory_result;
  }
  FirebaseAuthWithOAuthTokenResponseParams _FirebaseAuthWithOAuthTokenResponseParamsFactory(Error error, AuthData authData) {
    var mojo_factory_result = new FirebaseAuthWithOAuthTokenResponseParams();
    mojo_factory_result.error = error;
    mojo_factory_result.authData = authData;
    return mojo_factory_result;
  }
  FirebaseAuthWithPasswordResponseParams _FirebaseAuthWithPasswordResponseParamsFactory(Error error, AuthData authData) {
    var mojo_factory_result = new FirebaseAuthWithPasswordResponseParams();
    mojo_factory_result.error = error;
    mojo_factory_result.authData = authData;
    return mojo_factory_result;
  }
  FirebaseUnauthResponseParams _FirebaseUnauthResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseUnauthResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebaseSetValueResponseParams _FirebaseSetValueResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseSetValueResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebaseRemoveValueResponseParams _FirebaseRemoveValueResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseRemoveValueResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebasePushResponseParams _FirebasePushResponseParamsFactory(String key) {
    var mojo_factory_result = new FirebasePushResponseParams();
    mojo_factory_result.key = key;
    return mojo_factory_result;
  }
  FirebaseSetPriorityResponseParams _FirebaseSetPriorityResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseSetPriorityResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebaseCreateUserResponseParams _FirebaseCreateUserResponseParamsFactory(Error error, String jsonValue) {
    var mojo_factory_result = new FirebaseCreateUserResponseParams();
    mojo_factory_result.error = error;
    mojo_factory_result.jsonValue = jsonValue;
    return mojo_factory_result;
  }
  FirebaseChangeEmailResponseParams _FirebaseChangeEmailResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseChangeEmailResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebaseChangePasswordResponseParams _FirebaseChangePasswordResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseChangePasswordResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebaseRemoveUserResponseParams _FirebaseRemoveUserResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseRemoveUserResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }
  FirebaseResetPasswordResponseParams _FirebaseResetPasswordResponseParamsFactory(Error error) {
    var mojo_factory_result = new FirebaseResetPasswordResponseParams();
    mojo_factory_result.error = error;
    return mojo_factory_result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _Firebase_initWithUrlName:
        var params = _FirebaseInitWithUrlParams.deserialize(
            message.payload);
        _impl.initWithUrl(params.url);
        break;
      case _Firebase_addValueEventListenerName:
        var params = _FirebaseAddValueEventListenerParams.deserialize(
            message.payload);
        _impl.addValueEventListener(params.listener);
        break;
      case _Firebase_addChildEventListenerName:
        var params = _FirebaseAddChildEventListenerParams.deserialize(
            message.payload);
        _impl.addChildEventListener(params.listener);
        break;
      case _Firebase_observeSingleEventOfTypeName:
        var params = _FirebaseObserveSingleEventOfTypeParams.deserialize(
            message.payload);
        var response = _impl.observeSingleEventOfType(params.eventType,_FirebaseObserveSingleEventOfTypeResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_observeSingleEventOfTypeName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_observeSingleEventOfTypeName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_authWithCustomTokenName:
        var params = _FirebaseAuthWithCustomTokenParams.deserialize(
            message.payload);
        var response = _impl.authWithCustomToken(params.token,_FirebaseAuthWithCustomTokenResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_authWithCustomTokenName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_authWithCustomTokenName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_authAnonymouslyName:
        var params = _FirebaseAuthAnonymouslyParams.deserialize(
            message.payload);
        var response = _impl.authAnonymously(_FirebaseAuthAnonymouslyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_authAnonymouslyName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_authAnonymouslyName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_authWithOAuthTokenName:
        var params = _FirebaseAuthWithOAuthTokenParams.deserialize(
            message.payload);
        var response = _impl.authWithOAuthToken(params.provider,params.credentials,_FirebaseAuthWithOAuthTokenResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_authWithOAuthTokenName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_authWithOAuthTokenName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_authWithPasswordName:
        var params = _FirebaseAuthWithPasswordParams.deserialize(
            message.payload);
        var response = _impl.authWithPassword(params.email,params.password,_FirebaseAuthWithPasswordResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_authWithPasswordName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_authWithPasswordName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_unauthName:
        var params = _FirebaseUnauthParams.deserialize(
            message.payload);
        var response = _impl.unauth(_FirebaseUnauthResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_unauthName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_unauthName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_getChildName:
        var params = _FirebaseGetChildParams.deserialize(
            message.payload);
        _impl.getChild(params.path, params.child);
        break;
      case _Firebase_getParentName:
        var params = _FirebaseGetParentParams.deserialize(
            message.payload);
        _impl.getParent(params.parent);
        break;
      case _Firebase_getRootName:
        var params = _FirebaseGetRootParams.deserialize(
            message.payload);
        _impl.getRoot(params.root);
        break;
      case _Firebase_setValueName:
        var params = _FirebaseSetValueParams.deserialize(
            message.payload);
        var response = _impl.setValue(params.jsonValue,params.priority,params.hasPriority,_FirebaseSetValueResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_setValueName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_setValueName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_removeValueName:
        var params = _FirebaseRemoveValueParams.deserialize(
            message.payload);
        var response = _impl.removeValue(_FirebaseRemoveValueResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_removeValueName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_removeValueName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_pushName:
        var params = _FirebasePushParams.deserialize(
            message.payload);
        var response = _impl.push(params.child,_FirebasePushResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_pushName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_pushName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_setPriorityName:
        var params = _FirebaseSetPriorityParams.deserialize(
            message.payload);
        var response = _impl.setPriority(params.priority,_FirebaseSetPriorityResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_setPriorityName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_setPriorityName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_createUserName:
        var params = _FirebaseCreateUserParams.deserialize(
            message.payload);
        var response = _impl.createUser(params.email,params.password,_FirebaseCreateUserResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_createUserName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_createUserName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_changeEmailName:
        var params = _FirebaseChangeEmailParams.deserialize(
            message.payload);
        var response = _impl.changeEmail(params.oldEmail,params.password,params.newEmail,_FirebaseChangeEmailResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_changeEmailName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_changeEmailName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_changePasswordName:
        var params = _FirebaseChangePasswordParams.deserialize(
            message.payload);
        var response = _impl.changePassword(params.newPassword,params.email,params.oldPassword,_FirebaseChangePasswordResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_changePasswordName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_changePasswordName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_removeUserName:
        var params = _FirebaseRemoveUserParams.deserialize(
            message.payload);
        var response = _impl.removeUser(params.email,params.password,_FirebaseRemoveUserResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_removeUserName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_removeUserName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Firebase_resetPasswordName:
        var params = _FirebaseResetPasswordParams.deserialize(
            message.payload);
        var response = _impl.resetPassword(params.email,_FirebaseResetPasswordResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Firebase_resetPasswordName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Firebase_resetPasswordName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Firebase get impl => _impl;
  set impl(Firebase d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "FirebaseStub($superString)";
  }

  int get version => 0;
}


