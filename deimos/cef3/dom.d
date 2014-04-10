module deimos.cef3.dom;

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
// Structure to implement for visiting the DOM. The functions of this structure
// will be called on the render process main thread.
///
struct cef_domvisitor_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Method executed for visiting the DOM. The document object passed to this
    // function represents a snapshot of the DOM at the time this function is
    // executed. DOM objects are only valid for the scope of this function. Do not
    // keep references to or attempt to access any DOM objects outside the scope
    // of this function.
    ///
    extern(System) void function(cef_domvisitor_t* self, cef_domdocument_t* document) visit;
}


///
// Structure used to represent a DOM document. The functions of this structure
// should only be called on the render process main thread thread.
///
struct cef_domdocument_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Returns the document type.
    ///
    extern(System)  cef_dom_document_type_t function(cef_domdocument_t* self) get_type;

    ///
    // Returns the root document node.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self) get_document;

    ///
    // Returns the BODY node of an HTML document.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self) get_body;

    ///
    // Returns the HEAD node of an HTML document.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self) get_head;

    ///
    // Returns the title of an HTML document.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domdocument_t* self) get_title;

    ///
    // Returns the document element with the specified ID value.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self,
                        const(cef_string_t)* id) get_element_by_id;

    ///
    // Returns the node that currently has keyboard focus.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self) get_focused_node;

    ///
    // Returns true (1) if a portion of the document is selected.
    ///
    extern(System) int function(cef_domdocument_t* self) has_selection;

    ///
    // Returns the selection start node.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self) get_selection_start_node;

    ///
    // Returns the selection offset within the start node.
    ///
    extern(System) int function(cef_domdocument_t* self) get_selection_start_offset;

    ///
    // Returns the selection end node.
    ///
    extern(System) cef_domnode_t* function(cef_domdocument_t* self) get_selection_end_node;

    ///
    // Returns the selection offset within the end node.
    ///
    extern(System) int function(cef_domdocument_t* self) get_selection_end_offset;

    ///
    // Returns the contents of this selection as markup.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domdocument_t* self) get_selection_as_markup;

    ///
    // Returns the contents of this selection as text.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domdocument_t* self) get_selection_as_text;

    ///
    // Returns the base URL for the document.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domdocument_t* self) get_base_url;

    ///
    // Returns a complete URL based on the document base URL and the specified
    // partial URL.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domdocument_t* self,
                        const(cef_string_t)* partialURL) get_complete_url;
}


///
// Structure used to represent a DOM node. The functions of this structure
// should only be called on the render process main thread.
///
struct cef_domnode_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Returns the type for this node.
    ///
    extern(System)  cef_dom_node_type_t function(cef_domnode_t* self) get_type;

    ///
    // Returns true (1) if this is a text node.
    ///
    extern(System) int function(cef_domnode_t* self) is_text;

    ///
    // Returns true (1) if this is an element node.
    ///
    extern(System) int function(cef_domnode_t* self) is_element;

    ///
    // Returns true (1) if this is an editable node.
    ///
    extern(System) int function(cef_domnode_t* self) is_editable;

    ///
    // Returns true (1) if this is a form control element node.
    ///
    extern(System) int function(cef_domnode_t* self) is_form_control_element;

    ///
    // Returns the type of this form control element node.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self) get_form_control_element_type;

    ///
    // Returns true (1) if this object is pointing to the same handle as |that|
    // object.
    ///
    extern(System) int function(cef_domnode_t* self, cef_domnode_t* that) is_same;

    ///
    // Returns the name of this node.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self) get_name;

    ///
    // Returns the value of this node.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self) get_value;

    ///
    // Set the value of this node. Returns true (1) on success.
    ///
    extern(System) int function(cef_domnode_t* self, const(cef_string_t)* value) set_value;

    ///
    // Returns the contents of this node as markup.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self) get_as_markup;

    ///
    // Returns the document associated with this node.
    ///
    extern(System) cef_domdocument_t* function(cef_domnode_t* self) get_document;

    ///
    // Returns the parent node.
    ///
    extern(System) cef_domnode_t* function(cef_domnode_t* self) get_parent;

    ///
    // Returns the previous sibling node.
    ///
    extern(System) cef_domnode_t* function(cef_domnode_t* self) get_previous_sibling;

    ///
    // Returns the next sibling node.
    ///
    extern(System) cef_domnode_t* function(cef_domnode_t* self) get_next_sibling;

    ///
    // Returns true (1) if this node has child nodes.
    ///
    extern(System) int function(cef_domnode_t* self) has_children;

    ///
    // Return the first child node.
    ///
    extern(System) cef_domnode_t* function(cef_domnode_t* self) get_first_child;

    ///
    // Returns the last child node.
    ///
    extern(System) cef_domnode_t* function(cef_domnode_t* self) get_last_child;

    ///
    // Add an event listener to this node for the specified event type. If
    // |useCapture| is true (1) then this listener will be considered a capturing
    // listener. Capturing listeners will recieve all events of the specified type
    // before the events are dispatched to any other event targets beneath the
    // current node in the tree. Events which are bubbling upwards through the
    // tree will not trigger a capturing listener. Separate calls to this function
    // can be used to register the same listener with and without capture. See
    // WebCore/dom/EventNames.h for the list of supported event types.
    ///
    extern(System) void function(cef_domnode_t* self, const(cef_string_t)* eventType,
                        cef_domevent_listener_t* listener, int useCapture) add_event_listener;


    // The following functions are valid only for element nodes.

    ///
    // Returns the tag name of this element.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self) get_element_tag_name;

    ///
    // Returns true (1) if this element has attributes.
    ///
    extern(System) int function(cef_domnode_t* self) has_element_attributes;

    ///
    // Returns true (1) if this element has an attribute named |attrName|.
    ///
    extern(System) int function(cef_domnode_t* self, const(cef_string_t)* attrName) has_element_attribute;

    ///
    // Returns the element attribute named |attrName|.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self,
                        const(cef_string_t)* attrName) get_element_attribute;

    ///
    // Returns a map of all element attributes.
    ///
    extern(System) void function(cef_domnode_t* self, cef_string_map_t attrMap) get_element_attributes;

    ///
    // Set the value for the element attribute named |attrName|. Returns true (1)
    // on success.
    ///
    extern(System) int function(cef_domnode_t* self, const(cef_string_t)* attrName,
                        const(cef_string_t)* value) set_element_attribute;

    ///
    // Returns the inner text of the element.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domnode_t* self) get_element_inner_text;
}


///
// Structure used to represent a DOM event. The functions of this structure
// should only be called on the render process main thread.
///
struct cef_domevent_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Returns the event type.
    ///
    // The resulting string must be freed by calling cef_string_userfree_free().
    extern(System) cef_string_userfree_t function(cef_domevent_t* self) get_type;

    ///
    // Returns the event category.
    ///
    extern(System)  cef_dom_event_category_t function(cef_domevent_t* self) get_category;

    ///
    // Returns the event processing phase.
    ///
    extern(System)  cef_dom_event_phase_t function(cef_domevent_t* self) get_phase;

    ///
    // Returns true (1) if the event can bubble up the tree.
    ///
    extern(System) int function(cef_domevent_t* self) can_bubble;

    ///
    // Returns true (1) if the event can be canceled.
    ///
    extern(System) int function(cef_domevent_t* self) can_cancel;

    ///
    // Returns the document associated with this event.
    ///
    extern(System) cef_domdocument_t* function(cef_domevent_t* self) get_document;

    ///
    // Returns the target of the event.
    ///
    extern(System) cef_domnode_t* function(cef_domevent_t* self) get_target;

    ///
    // Returns the current target of the event.
    ///
    extern(System) cef_domnode_t* function(cef_domevent_t* self) get_current_target;
}


///
// Structure to implement for handling DOM events. The functions of this
// structure will be called on the render process main thread.
///
struct cef_domevent_listener_t {
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Called when an event is received. The event object passed to this function
    // contains a snapshot of the DOM at the time this function is executed. DOM
    // objects are only valid for the scope of this function. Do not keep
    // references to or attempt to access any DOM objects outside the scope of
    // this function.
    ///
    extern(System) void function(cef_domevent_listener_t* self, cef_domevent_t* event) handle_event;
}


}