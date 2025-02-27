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

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/buttons
pub fn MouseEvent::buttons(self : MouseEvent) -> Int = "peter-jerry-ye:canvas/MouseEvent" "buttons"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
pub fn MouseEvent::prevent_default(self : MouseEvent) = "peter-jerry-ye:canvas/MouseEvent" "preventDefault"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/altKey
pub fn MouseEvent::alt_key(self : MouseEvent) -> Bool = "peter-jerry-ye:canvas/MouseEvent" "altKey"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/ctrlKey
pub fn MouseEvent::ctrl_key(self : MouseEvent) -> Bool = "peter-jerry-ye:canvas/MouseEvent" "ctrlKey"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/shiftKey
pub fn MouseEvent::shift_key(self : MouseEvent) -> Bool = "peter-jerry-ye:canvas/MouseEvent" "shiftKey"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/offsetX
pub fn MouseEvent::offset_x(self : MouseEvent) -> Double = "peter-jerry-ye:canvas/MouseEvent" "offsetX"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/offsetY
pub fn MouseEvent::offset_y(self : MouseEvent) -> Double = "peter-jerry-ye:canvas/MouseEvent" "offsetY"
