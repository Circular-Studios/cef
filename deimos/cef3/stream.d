module deimos.cef3.stream;

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
// Structure the client can implement to provide a custom stream reader. The
// functions of this structure may be called on any thread.
///
struct cef_read_handler_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Read raw binary data.
    ///
    extern(System) size_t function(cef_read_handler_t* self, void* ptr, size_t size, size_t n) read;

    ///
    // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
    // SEEK_END or SEEK_SET. Return zero on success and non-zero on failure.
    ///
    extern(System) int function(cef_read_handler_t* self, int64 offset, int whence) seek;

    ///
    // Return the current offset position.
    ///
    extern(System) int64 function(cef_read_handler_t* self) tell;

    ///
    // Return non-zero if at end of file.
    ///
    extern(System) int function(cef_read_handler_t* self) eof;

    ///
    // Return true (1) if this handler performs work like accessing the file
    // system which may block. Used as a hint for determining the thread to access
    // the handler from.
    ///
    extern(System) int function(cef_read_handler_t* self) may_block;
}


///
// Structure used to read data from a stream. The functions of this structure
// may be called on any thread.
///
struct cef_stream_reader_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Read raw binary data.
    ///
    extern(System) size_t function(cef_stream_reader_t* self, void* ptr, size_t size, size_t n) read;

    ///
    // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
    // SEEK_END or SEEK_SET. Returns zero on success and non-zero on failure.
    ///
    extern(System) int function(cef_stream_reader_t* self, int64 offset, int whence) seek;

    ///
    // Return the current offset position.
    ///
    extern(System) int64 function(cef_stream_reader_t* self) tell;

    ///
    // Return non-zero if at end of file.
    ///
    extern(System) int function(cef_stream_reader_t* self) eof;

    ///
    // Returns true (1) if this reader performs work like accessing the file
    // system which may block. Used as a hint for determining the thread to access
    // the reader from.
    ///
    extern(System) int function(cef_stream_reader_t* self) may_block;
}


///
// Create a new cef_stream_reader_t object from a file.
///
cef_stream_reader_t* cef_stream_reader_create_for_file(const(cef_string_t)* fileName);

///
// Create a new cef_stream_reader_t object from data.
///
cef_stream_reader_t* cef_stream_reader_create_for_data(void* data, size_t size);

///
// Create a new cef_stream_reader_t object from a custom handler.
///
cef_stream_reader_t* cef_stream_reader_create_for_handler(cef_read_handler_t* handler);


///
// Structure the client can implement to provide a custom stream writer. The
// functions of this structure may be called on any thread.
///
struct cef_write_handler_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Write raw binary data.
    ///
    extern(System) size_t function(cef_write_handler_t* self, const(void)* ptr, size_t size, size_t n) write;

    ///
    // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
    // SEEK_END or SEEK_SET. Return zero on success and non-zero on failure.
    ///
    extern(System) int function(cef_write_handler_t* self, int64 offset, int whence) seek;

    ///
    // Return the current offset position.
    ///
    extern(System) int64 function(cef_write_handler_t* self) tell;

    ///
    // Flush the stream.
    ///
    extern(System) int function(cef_write_handler_t* self) flush;

    ///
    // Return true (1) if this handler performs work like accessing the file
    // system which may block. Used as a hint for determining the thread to access
    // the handler from.
    ///
    extern(System) int function(cef_write_handler_t* self) may_block;
}


///
// Structure used to write data to a stream. The functions of this structure may
// be called on any thread.
///
struct cef_stream_writer_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Write raw binary data.
    ///
    extern(System) size_t function(cef_stream_writer_t* self, const(void)* ptr, size_t size, size_t n) write;

    ///
    // Seek to the specified offset position. |whence| may be any one of SEEK_CUR,
    // SEEK_END or SEEK_SET. Returns zero on success and non-zero on failure.
    ///
    extern(System) int function(cef_stream_writer_t* self, int64 offset, int whence) seek;

    ///
    // Return the current offset position.
    ///
    extern(System) int64 function(cef_stream_writer_t* self) tell;

    ///
    // Flush the stream.
    ///
    extern(System) int function(cef_stream_writer_t* self) flush;

    ///
    // Returns true (1) if this writer performs work like accessing the file
    // system which may block. Used as a hint for determining the thread to access
    // the writer from.
    ///
    extern(System) int function(cef_stream_writer_t* self) may_block;
}


///
// Create a new cef_stream_writer_t object for a file.
///
cef_stream_writer_t* cef_stream_writer_create_for_file(const(cef_string_t)* fileName);

///
// Create a new cef_stream_writer_t object for a custom handler.
///
cef_stream_writer_t* cef_stream_writer_create_for_handler(cef_write_handler_t* handler);


}