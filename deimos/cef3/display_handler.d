module deimos.cef3.display_handler;

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

import deimos.cef3.base;


///
// Implement this structure to handle events related to browser display state.
// The functions of this structure will be called on the UI thread.
///
struct cef_display_handler_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called when the loading state has changed.
  ///
  extern(System) void function(cef_display_handler_t* self, cef_browser_t* browser, int isLoading, int canGoBack, int canGoForward) on_loading_state_change;

  ///
  // Called when a frame's address has changed.
  ///
  extern(System) void function(cef_display_handler_t* self, cef_browser_t* browser, cef_frame_t* frame, const(cef_string_t)* url) on_address_change;

  ///
  // Called when the page title changes.
  ///
  extern(System) void function(cef_display_handler_t* self, cef_browser_t* browser, const(cef_string_t)* title) on_title_change;

  ///
  // Called when the browser is about to display a tooltip. |text| contains the
  // text that will be displayed in the tooltip. To handle the display of the
  // tooltip yourself return true (1). Otherwise, you can optionally modify
  // |text| and then return false (0) to allow the browser to display the
  // tooltip.
  ///
  extern(System) int function(cef_display_handler_t* self, cef_browser_t* browser, cef_string_t* text) on_tooltip;

  ///
  // Called when the browser receives a status message. |text| contains the text
  // that will be displayed in the status message and |type| indicates the
  // status message type.
  ///
  extern(System) void function(cef_display_handler_t* self, cef_browser_t* browser, const(cef_string_t)* value) on_status_message;

  ///
  // Called to display a console message. Return true (1) to stop the message
  // from being output to the console.
  ///
  extern(System) int function(cef_display_handler_t* self, cef_browser_t* browser, const(cef_string_t)* message, const(cef_string_t)* source, int line) on_console_message;
}


}