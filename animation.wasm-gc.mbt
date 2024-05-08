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

fn request_animation_frame_ffi(callback : (Double) -> Unit) -> Double = "peter-jerry-ye:canvas/window" "requestAnimationFrame"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame
pub fn request_animation_frame(callback : (Int64) -> Unit) -> Int64 {
  request_animation_frame_ffi(fn(d) { callback(d.to_int64()) }).to_int64()
}

fn cancel_animation_frame_ffi(requestID : Double) = "peter-jerry-ye:canvas/window" "cancelAnimationFrame"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Window/cancelAnimationFrame
pub fn cancel_animation_frame(requestID : Int64) -> Unit {
  cancel_animation_frame_ffi(requestID.to_double())
}
