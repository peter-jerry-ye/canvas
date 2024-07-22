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

let last : Ref[Int64] = { val: 0L }

let cumul : Ref[Int64] = { val: 0L }

let pause : Ref[Bool] = { val: false }

pub fn entry(canvas : @lib.Canvas2D) -> Unit {
  @lib.set_on_key_down(
    fn(event) {
      match event.code() {
        "Space" => pause.val = pause.val.not()
        "Enter" => {
          pause.val = false
          last.val = 0L
          cumul.val = 0L
        }
        _ => ()
      }
    },
  )
  fn update(time : Int64) {
    if pause.val.not() {
      if last.val > 0L {
        cumul.val += time - last.val
        canvas.set_font("20px Arial")
        canvas.clear_rect(0.0, 0.0, 500.0, 500.0)
        canvas.fill_text(
          ((cumul.val / 100L).to_double() / 10.0 |> Double::to_string()) + "ms",
          100.0,
          100.0,
        )
      }
    }
    last.val = time
    @lib.request_animation_frame(update) |> ignore
  }

  @lib.request_animation_frame(update) |> ignore
}
