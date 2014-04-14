module deimos.cef3.request_handler;

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

extern(C) {

import deimos.cef3.auth_callback;
import deimos.cef3.base;
import deimos.cef3.browser;
import deimos.cef3.frame;
import deimos.cef3.request;
import deimos.cef3.resource_handler;
import deimos.cef3.response;
import deimos.cef3.web_plugin;


///
// Callback structure used for asynchronous continuation of quota requests.
///
struct cef_quota_callback_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Continue the quota request. If |allow| is true (1) the request will be
    // allowed. Otherwise, the request will be denied.
    ///
    extern(System) void function(   cef_quota_callback_t* self,
                                    int allow) cont;

    ///
    // Cancel the quota request.
    ///
    extern(System) void function(   cef_quota_callback_t* self) cancel;
}


///
// Callback structure used for asynchronous continuation of url requests when
// invalid SSL certificates are encountered.
///
struct cef_allow_certificate_error_callback_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Continue the url request. If |allow| is true (1) the request will be
    // continued. Otherwise, the request will be canceled.
    ///
    extern(System) void function(   cef_allow_certificate_error_callback_t *self,
                                    int allow) cont;
}


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
    // cancel the navigation or false (0) to allow the navigation to proceed. The
    // |request| object cannot be modified in this callback.
    // cef_load_handler_t::OnLoadingStateChange will be called twice in all cases.
    // If the navigation is allowed cef_load_handler_t::OnLoadStart and
    // cef_load_handler_t::OnLoadEnd will be called. If the navigation is canceled
    // cef_load_handler_t::OnLoadError will be called with an |errorCode| value of
    // ERR_ABORTED.
    ///
    extern(System) int function(    cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_frame_t* frame,
                                    cef_request_t* request,
                                    int is_redirect) on_before_browse;

    ///
    // Called on the IO thread before a resource request is loaded. The |request|
    // object may be modified. To cancel the request return true (1) otherwise
    // return false (0).
    ///
    extern(System) int function(    cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_frame_t* frame,
                                    cef_request_t* request) on_before_resource_load;

    ///
    // Called on the IO thread before a resource is loaded. To allow the resource
    // to load normally return NULL. To specify a handler for the resource return
    // a cef_resource_handler_t object. The |request| object should not be
    // modified in this callback.
    ///
    extern(System) cef_resource_handler_t* function(cef_request_handler_t* self,
                                                    cef_browser_t* browser,
                                                    cef_frame_t* frame,
                                                    cef_request_t* request) get_resource_handler;

    ///
    // Called on the IO thread when a resource load is redirected. The |old_url|
    // parameter will contain the old URL. The |new_url| parameter will contain
    // the new URL and can be changed if desired.
    ///
    extern(System) void function(   cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_frame_t* frame,
                                    const(cef_string_t)* old_url,
                                    cef_string_t* new_url) on_resource_redirect;

    ///
    // Called on the IO thread when the browser needs credentials from the user.
    // |isProxy| indicates whether the host is a proxy server. |host| contains the
    // hostname and |port| contains the port number. Return true (1) to continue
    // the request and call cef_auth_callback_t::Complete() when the
    // authentication information is available. Return false (0) to cancel the
    // request.
    ///
    extern(System) int function(    cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_frame_t* frame,
                                    int isProxy,
                                    const(cef_string_t)* host,
                                    int port,
                                    const(cef_string_t)* realm,
                                    const(cef_string_t)* scheme,
                                    cef_auth_callback_t* callback) get_auth_credentials;

    ///
    // Called on the IO thread when JavaScript requests a specific storage quota
    // size via the webkitStorageInfo.requestQuota function. |origin_url| is the
    // origin of the page making the request. |new_size| is the requested quota
    // size in bytes. Return true (1) and call cef_quota_callback_t::cont() either
    // in this function or at a later time to grant or deny the request. Return
    // false (0) to cancel the request.
    ///
    extern(System) int function(    cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    const(cef_string_t)* origin_url,
                                    int64 new_size,
                                    cef_quota_callback_t* callback) on_quota_request;

    ///
    // Called on the UI thread to handle requests for URLs with an unknown
    // protocol component. Set |allow_os_execution| to true (1) to attempt
    // execution via the registered OS protocol handler, if any. SECURITY WARNING:
    // YOU SHOULD USE THIS METHOD TO ENFORCE RESTRICTIONS BASED ON SCHEME, HOST OR
    // OTHER URL ANALYSIS BEFORE ALLOWING OS EXECUTION.
    ///
    extern(System) void function(   cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    const(cef_string_t)* url,
                                    int* allow_os_execution) on_protocol_execution;

    ///
    // Called on the UI thread to handle requests for URLs with an invalid SSL
    // certificate. Return true (1) and call
    // cef_allow_certificate_error_callback_t:: cont() either in this function or
    // at a later time to continue or cancel the request. Return false (0) to
    // cancel the request immediately. If |callback| is NULL the error cannot be
    // recovered from and the request will be canceled automatically. If
    // CefSettings.ignore_certificate_errors is set all invalid certificates will
    // be accepted without calling this function.
    ///
    extern(System) int function(    cef_request_handler_t* self,
                                    cef_errorcode_t cert_error,
                                    const(cef_string_t)* request_url,
                                    cef_allow_certificate_error_callback_t* callback) on_certificate_error;
    
    ///
    // Called on the browser process IO thread before a plugin is loaded. Return
    // true (1) to block loading of the plugin.
    ///
    extern(System) int function(    cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    const(cef_string_t)* url,
                                    const(cef_string_t)* policy_url,
                                    cef_web_plugin_info_t* info) on_before_plugin_load;

    ///
    // Called on the browser process UI thread when a plugin has crashed.
    // |plugin_path| is the path of the plugin that crashed.
    ///
    extern(System) void function(   cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    const(cef_string_t)* plugin_path) on_plugin_crashed;

    ///
    // Called on the browser process UI thread when the render process terminates
    // unexpectedly. |status| indicates how the process terminated.
    ///
    extern(System) void function(   cef_request_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_termination_status_t status) on_render_process_terminated;

}


}