///|
type LCG Ref[UInt64]

///|
pub fn LCG::new(seed : UInt64) -> LCG {
  { val: seed & 0xFFFFFFFFFFFFFFFF }
}

///|
pub impl @random.Source for LCG with next(self) {
  let mut state = self.val
  state = (state * 6364136223846793005 + 1) & 0xFFFFFFFFFFFFFFFF
  self.val = state
  return state
}

///|
pub fn next_platform(random : @random.Rand, furthestX : Int) -> Platform {
  let gap = random.int(limit=160) + 40
  let width = random.int(limit=80) + 20
  { x: furthestX + gap, width }
}
