module deimos.cef1.request_handler;

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

// #ifndef CEF_INCLUDE_CAPI_CEF_REQUEST_HANDLER_CAPI_H_
// #pragma once

// #ifdef __cplusplus
extern(C) {
// #endif

import deimos.cef1.base;


///
// Implement this structure to handle events related to browser requests. The
// functions of this structure will be called on the thread indicated.
///
struct cef_request_handler_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called on the UI thread before browser navigation. Return true (1) to
  // cancel the navigation or false (0) to allow the navigation to proceed.
  ///
  extern(System) int function(cef_request_handler_t* self, cef_browser_t* browser, cef_frame_t* frame, cef_request_t* request, cef_handler_navtype_t navType, int isRedirect) on_before_browse;

  ///
  // Called on the IO thread before a resource is loaded.  To allow the resource
  // to load normally return false (0). To redirect the resource to a new url
  // populate the |redirectUrl| value and return false (0).  To specify data for
  // the resource return a CefStream object in |resourceStream|, use the
  // |response| object to set mime type, HTTP status code and optional header
  // values, and return false (0). To cancel loading of the resource return true
  // (1). Any modifications to |request| will be observed.  If the URL in
  // |request| is changed and |redirectUrl| is also set, the URL in |request|
  // will be used.
  ///
  extern(System) int function(cef_request_handler_t* self, cef_browser_t* browser, cef_request_t* request, cef_string_t* redirectUrl, cef_stream_reader_t** resourceStream, cef_response_t* response, int loadFlags) on_before_resource_load;

  ///
  // Called on the IO thread when a resource load is redirected. The |old_url|
  // parameter will contain the old URL. The |new_url| parameter will contain
  // the new URL and can be changed if desired.
  ///
  extern(System) void function(cef_request_handler_t* self, cef_browser_t* browser, const(cef_string_t)* old_url, cef_string_t* new_url) on_resource_redirect;

  ///
  // Called on the UI thread after a response to the resource request is
  // received. Set |filter| if response content needs to be monitored and/or
  // modified as it arrives.
  ///
  extern(System) void function(cef_request_handler_t* self, cef_browser_t* browser, const(cef_string_t)* url, cef_response_t* response, cef_content_filter_t** filter) on_resource_response;

  ///
  // Called on the IO thread to handle requests for URLs with an unknown
  // protocol component. Return true (1) to indicate that the request should
  // succeed because it was handled externally. Set |allowOSExecution| to true
  // (1) and return false (0) to attempt execution via the registered OS
  // protocol handler, if any. If false (0) is returned and either
  // |allow_os_execution| is false (0) or OS protocol handler execution fails
  // then the request will fail with an error condition. SECURITY WARNING: YOU
  // SHOULD USE THIS METHOD TO ENFORCE RESTRICTIONS BASED ON SCHEME, HOST OR
  // OTHER URL ANALYSIS BEFORE ALLOWING OS EXECUTION.
  ///
  extern(System) int function(cef_request_handler_t* self, cef_browser_t* browser, const(cef_string_t)* url, int* allowOSExecution) on_protocol_execution;

  ///
  // Called on the UI thread when a server indicates via the 'Content-
  // Disposition' header that a response represents a file to download.
  // |mimeType| is the mime type for the download, |fileName| is the suggested
  // target file name and |contentLength| is either the value of the 'Content-
  // Size' header or -1 if no size was provided. Set |handler| to the
  // cef_download_handler_t instance that will recieve the file contents. Return
  // true (1) to download the file or false (0) to cancel the file download.
  ///
  extern(System) int function(cef_request_handler_t* self, cef_browser_t* browser, const(cef_string_t)* mimeType, const(cef_string_t)* fileName, int64 contentLength, cef_download_handler_t** handler) get_download_handler;

  ///
  // Called on the IO thread when the browser needs credentials from the user.
  // |isProxy| indicates whether the host is a proxy server. |host| contains the
  // hostname and port number. Set |username| and |password| and return true (1)
  // to handle the request. Return false (0) to cancel the request.
  ///
  extern(System) int function(cef_request_handler_t* self, cef_browser_t* browser, int isProxy, const(cef_string_t)* host, int port, const(cef_string_t)* realm, const(cef_string_t)* scheme, cef_string_t* username, cef_string_t* password) get_auth_credentials;

  ///
  // Called on the IO thread to retrieve the cookie manager. |main_url| is the
  // URL of the top-level frame. Cookies managers can be unique per browser or
  // shared across multiple browsers. The global cookie manager will be used if
  // this function returns NULL.
  ///
  extern(System) cef_cookie_manager_t* function(cef_request_handler_t* self, cef_browser_t* browser, const(cef_string_t)* main_url) get_cookie_manager;
}


// #ifdef __cplusplus
}
// #endif

// #endif CEF_INCLUDE_CAPI_CEF_REQUEST_HANDLER_CAPI_H_
