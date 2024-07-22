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
fn body_color(grid : GridType) -> String {
  match grid {
    Body => "#ffb900"
    Food => "#2753f1"
    Default => "#dcdcdc"
  }
}

let queue : @queue.Queue[Position] = @queue.new()

let border_color = "#00263f"

fn draw(canvas : @canvas.Canvas2D, snake : GameState) -> Unit {
  while queue.is_empty().not() {
    let position = queue.pop_exn()
    match snake.grid[position.y * grid_col_count + position.x] {
      Body | Food as a => {
        canvas.set_fill_style(Color(body_color(a)))
        canvas.fill_rect(
          position.x.to_double(),
          position.y.to_double(),
          1.0,
          1.0,
        )
        canvas.set_stroke_style(Color(border_color))
        canvas.set_line_width(0.1)
        canvas.stroke_rect(
          position.x.to_double() + 0.05,
          position.y.to_double() + 0.05,
          0.9,
          0.9,
        )
      }
      Default => {
        canvas.set_fill_style(Color(body_color(Default)))
        canvas.fill_rect(
          position.x.to_double(),
          position.y.to_double(),
          1.0,
          1.0,
        )
      }
    }
  }
}
