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

/// Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaX
pub fn WheelEvent::delta_x(self : WheelEvent) -> Double = "peter-jerry-ye:canvas/WheelEvent" "deltaX"

/// Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaY
pub fn WheelEvent::delta_y(self : WheelEvent) -> Double = "peter-jerry-ye:canvas/WheelEvent" "deltaY"

/// Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaZ
pub fn WheelEvent::delta_z(self : WheelEvent) -> Double = "peter-jerry-ye:canvas/WheelEvent" "deltaZ"

/// Reference: https://developer.mozilla.org/zh-CN/docs/Web/API/WheelEvent/deltaMode
pub fn WheelEvent::delta_mode(self : WheelEvent) -> Int = "peter-jerry-ye:canvas/WheelEvent" "deltaMode"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
pub fn WheelEvent::prevent_default(self : WheelEvent) = "peter-jerry-ye:canvas/WheelEvent" "preventDefault"
