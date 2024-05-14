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
let grid_row_count = 20

let grid_col_count = 20

enum Direction {
  Up
  Down
  Left
  Right
  Default
} derive(Eq)

enum GridType {
  Body
  Food
  Default
} derive(Eq)

fn dir_posi(self : Direction) -> Position {
  match self {
    Up => { x: 0, y: -1 }
    Down => { x: 0, y: 1 }
    Left => { x: -1, y: 0 }
    Right => { x: 1, y: 0 }
    Default => { x: 0, y: 0 }
  }
}

struct Position {
  x : Int
  y : Int
}

struct GameState {
  grid : Array[GridType]
  body : @devec.Devec[Position]
  mut dir : Direction
}

fn initialize(self : GameState) -> Unit {
  for i = 0; i < grid_row_count; i = i + 1 {
    for j = 0; j < grid_col_count; j = j + 1 {
      self.grid[i * grid_col_count + j] = Default
      queue.push({ x: i, y: j })
    }
  }
  self.dir = Up
  self.body.clear()
  self.body.push_back({ x: grid_col_count / 2, y: grid_col_count / 2 })
  self.grid[grid_col_count / 2 * grid_col_count + grid_col_count / 2] = Body
  self.generate_Food()
}

fn setGridType(self : GameState, p : Position, t : GridType) -> Unit {
  self.grid[p.y * grid_col_count + p.x] = t
}

let random : Ref[Int64] = { val: 314159265L }

fn generate_Food(self : GameState) -> Unit {
  while true {
    let (i, seed) = random_lcg(random.val)
    let (j, seed) = random_lcg(seed)
    random.val = seed
    let i = i.mod_u(20)
    let j = j.mod_u(20)
    if self.grid[j * grid_col_count + i] == Default {
      self.setGridType({ x: i, y: j }, Food)
      queue.push({ x: i, y: j })
      return
    }
  }
}

fn go_step(self : GameState) -> Unit {
  let head : Position = self.body.front().unwrap()
  let offset = dir_posi(self.dir)
  let newHead : Position = {
    x: (head.x + offset.x + grid_col_count) % grid_col_count,
    y: (head.y + offset.y + grid_row_count) % grid_row_count,
  }
  match self.grid[newHead.y * grid_col_count + newHead.x] {
    Body => initialize(self)
    Food => {
      self.setGridType(newHead, Body)
      self.body.push_front(newHead)
      queue.push(newHead)
      generate_Food(self)
    }
    Default => {
      self.setGridType(newHead, Body)
      self.body.push_front(newHead)
      queue.push(newHead)
      self.setGridType(self.body.back().unwrap(), Default)
      queue.push(self.body.pop_back().unwrap())
    }
  }
}

fn step(self : GameState, action : Direction) -> Unit {
  match (action, self.dir) {
    (Up, Down) | (Left, Right) | (Right, Left) | (Down, Up) =>
      if self.body.length() == 1 {
        self.dir = action
        self.go_step()
      }
    _ => {
      if action != Default {
        self.dir = action
      }
      self.go_step()
    }
  }
}
