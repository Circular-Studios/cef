module deimos.cef3.internal.string;

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

// The CEF interface is built with one string type as the default. Comment out
// all but one of the CEF_STRING_TYPE_* defines below to specify the default.
// If you change the default you MUST recompile all of CEF.

// Build with the UTF8 string type as default.
// #define CEF_STRING_TYPE_UTF8 1

// Build with the UTF16 string type as default.
version = CEF_STRING_TYPE_UTF16;

// Build with the wide string type as default.
// #define CEF_STRING_TYPE_WIDE 1


import deimos.cef3.internal.string_types;

version(CEF_STRING_TYPE_UTF8) {
    alias char cef_char_t;
    alias cef_string_utf8_t cef_string_t;
    alias cef_string_userfree_utf8_t cef_string_userfree_t;
    alias cef_string_utf8_set cef_string_set;
    alias cef_string_utf8_copy cef_string_copy;
    alias cef_string_utf8_clear cef_string_clear;
    alias cef_string_userfree_utf8_alloc cef_string_userfree_alloc;
    alias cef_string_userfree_utf8_free cef_string_userfree_free;
    alias cef_string_utf8_copy cef_string_from_ascii;
    alias cef_string_utf8_copy cef_string_to_utf8;
    alias cef_string_utf8_copy cef_string_from_utf8;
    alias cef_string_utf8_to_utf16 cef_string_to_utf16;
    alias cef_string_utf16_to_utf8 cef_string_from_utf16;
    alias cef_string_utf8_to_wide cef_string_to_wide;
    alias cef_string_wide_to_utf8 cef_string_from_wide;
} else version(CEF_STRING_TYPE_UTF16) {
    alias char16 cef_char_t;
    alias cef_string_userfree_utf16_t cef_string_userfree_t;
    alias cef_string_utf16_t cef_string_t;
    alias cef_string_utf16_set cef_string_set;
    alias cef_string_utf16_copy cef_string_copy;
    alias cef_string_utf16_clear cef_string_clear;
    alias cef_string_userfree_utf16_alloc cef_string_userfree_alloc;
    alias cef_string_userfree_utf16_free cef_string_userfree_free;
    alias cef_string_ascii_to_utf16 cef_string_from_ascii;
    alias cef_string_utf16_to_utf8 cef_string_to_utf8;
    alias cef_string_utf8_to_utf16 cef_string_from_utf8;
    alias cef_string_utf16_copy cef_string_to_utf16;
    alias cef_string_utf16_copy cef_string_from_utf16;
    alias cef_string_utf16_to_wide cef_string_to_wide;
    alias cef_string_wide_to_utf16 cef_string_from_wide;
} else version(CEF_STRING_TYPE_WIDE) {
    alias wchar_t cef_char_t;
    alias cef_string_wide_t cef_string_t;
    alias cef_string_userfree_wide_t cef_string_userfree_t;
    alias cef_string_wide_set cef_string_set;
    alias cef_string_wide_copy cef_string_copy;
    alias cef_string_wide_clear cef_string_clear;
    alias cef_string_userfree_wide_alloc cef_string_userfree_alloc;
    alias cef_string_userfree_wide_free cef_string_userfree_free;
    alias cef_string_ascii_to_wide cef_string_from_ascii;
    alias cef_string_wide_to_utf8 cef_string_to_utf8;
    alias cef_string_utf8_to_wide cef_string_from_utf8;
    alias cef_string_wide_to_utf16 cef_string_to_utf16;
    alias cef_string_utf16_to_wide cef_string_from_utf16;
    alias cef_string_wide_copy cef_string_to_wide;
    alias cef_string_wide_copy cef_string_from_wide;
} else {
    static assert(false, "Please choose a string type.");
}
