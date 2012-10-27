module deimos.cef1.geolocation;

// Copyright (c) 2012 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

// #ifndef CEF_INCLUDE_CAPI_CEF_GEOLOCATION_CAPI_H_
// #pragma once

// #ifdef __cplusplus
extern(C) {
// #endif

import deimos.cef1.base;


///
// Request a one-time geolocation update. This function bypasses any user
// permission checks so should only be used by code that is allowed to access
// location information.
///
int cef_get_geolocation(cef_get_geolocation_callback_t* callback);

///
// Implement this structure to receive geolocation updates. The functions of
// this structure will be called on the browser process UI thread.
///
struct cef_get_geolocation_callback_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called with the 'best available' location information or, if the location
  // update failed, with error information.
  ///
  extern(System) void function(cef_get_geolocation_callback_t* self, const(cef_geoposition_t)* position) on_location_update;
}


// #ifdef __cplusplus
}
// #endif

// #endif CEF_INCLUDE_CAPI_CEF_GEOLOCATION_CAPI_H_
