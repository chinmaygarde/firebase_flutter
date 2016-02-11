// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "sky/services/dynamic/dynamic_service_dylib.h"
#include "firebase_impl.h"

void FlutterServicePerform(mojo::ScopedMessagePipeHandle client_handle,
                           const mojo::String& service_name) {
  assert(service_name == firebase::Firebase::Name_);
  new firebase::FirebaseImpl(
      mojo::MakeRequest<firebase::Firebase>(client_handle.Pass()));
}
