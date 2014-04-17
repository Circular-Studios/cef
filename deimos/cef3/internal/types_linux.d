module deimos.cef3.internal.types_linux;

// Copyright (c) 2010 Marshall A. Greenblatt. All rights reserved.
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


import deimos.cfe3.internal.build;

version(Linux) {
    //#include <gtk/gtk.h>
    import deimos.cfe3.internal.string;

    extern(C) {
        // Handle types.
        //#define cef_cursor_handle_t GdkCursor*
        //#define cef_event_handle_t GdkEvent*
        //#define cef_window_handle_t GtkWidget*
        alias void* cef_cursor_handle_t;
        alias void* cef_event_handle_t;
        alias void* cef_window_handle_t;
        alias void* cef_text_input_context_t;

        ///
        // Structure representing CefExecuteProcess arguments.
        ///
        struct cef_main_args_t {
            int argc;
            char** argv;
        }

        ///
        // Class representing window information.
        ///
        struct cef_window_info_t {
            ///
            // Pointer for the parent widget.
            ///
            cef_window_handle_t parent_widget;

            ///
            // Set to true (1) to create the browser using windowless (off-screen)
            // rendering. No widget will be created for the browser and all rendering will
            // occur via the CefRenderHandler interface. The |parent_widget| value will be
            // used to identify monitor info and to act as the parent widget for dialogs,
            // context menus, etc. If |parent_widget| is not provided then the main screen
            // monitor will be used and some functionality that requires a parent widget
            // may not function correctly. In order to create windowless browsers the
            // CefSettings.windowless_rendering_enabled value must be set to true.
            ///
            int windowless_rendering_enabled;

            ///
            // Set to true (1) to enable transparent painting in combination with
            // windowless rendering. When this value is true a transparent background
            // color will be used (RGBA=0x00000000). When this value is false the
            // background will be white and opaque.
            ///
            int transparent_painting_enabled;

            ///
            // Pointer for the new browser widget. Only used with windowed rendering.
            ///
            cef_window_handle_t widget;
        }
    }
}