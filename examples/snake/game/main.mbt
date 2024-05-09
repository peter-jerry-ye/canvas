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
let state : GameState = {
  grid: Array::make(grid_row_count * grid_col_count, Default),
  body: @deque.Deque::[],
  dir: Up,
}

let game_interval = 500L

pub fn entry(context : @canvas.Canvas2D, seed : Int) -> Unit {
  random.val = seed.to_int64()
  state.initialize()
  let last_frame : Ref[Int64] = { val: 0L }
  fn update(time : Int64) -> Unit {
    if time - last_frame.val > game_interval {
      step(state, Direction::Default)
      draw(context, state)
      last_frame.val = time
    } else {
      draw(context, state)
    }
    @canvas.request_animation_frame(update) |> ignore
  }

  @canvas.set_on_key_down(
    fn(event) {
      if last_frame.val <= 0L { // not started yet
        return
      }
      match event.key() {
        "ArrowLeft" => {
          step(state, Direction::Left)
          draw(context, state)
        }
        "ArrowRight" => {
          step(state, Direction::Right)
          draw(context, state)
        }
        "ArrowDown" => {
          step(state, Direction::Down)
          draw(context, state)
        }
        "ArrowUp" => {
          step(state, Direction::Up)
          draw(context, state)
        }
        _ => ()
      }
    },
  )
  @canvas.request_animation_frame(update) |> ignore
}
