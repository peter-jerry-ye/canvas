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

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/keydown_event
pub fn set_on_key_down(callback : (KeyboardEvent) -> Unit) = "peter-jerry-ye:canvas/event" "set_onkeydown"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/keyup_event
pub fn set_on_key_up(callback : (KeyboardEvent) -> Unit) = "peter-jerry-ye:canvas/event" "set_onkeyup"
