//  Copyright 2024 International Digital Economy Academy
// 
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
// 
//  http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key
pub fn key(self : KeyboardEvent) -> String {
  key_ffi(self).to_string()
}

fn key_ffi(self : KeyboardEvent) -> @lib.JS_String = "peter-jerry-ye:canvas/KeyboardEvent" "key"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/code
pub fn code(self : KeyboardEvent) -> String {
  code_ffi(self).to_string()
}

fn code_ffi(self : KeyboardEvent) -> @lib.JS_String = "peter-jerry-ye:canvas/KeyboardEvent" "code"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/isComposing
pub fn is_composing(self : KeyboardEvent) -> Bool = "peter-jerry-ye:canvas/KeyboardEvent" "isComposing"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
pub fn prevent_default(self : KeyboardEvent) = "peter-jerry-ye:canvas/KeyboardEvent" "preventDefault"
