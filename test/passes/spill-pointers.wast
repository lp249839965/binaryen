(module
  (import "env" "STACKTOP" (global $STACKTOP$asm2wasm$import i32))
  (global $stack_ptr (mut i32) (get_global $STACKTOP$asm2wasm$import))
  (func $nothing
  )
  (func $not-alive
    (local $x i32)
    (set_local $x (i32.const 1))
    (call $nothing)
  )
  (func $spill
    (local $x i32)
    (call $nothing)
    (drop (get_local $x))
  )
  (func $ignore-non-pointers
    (local $x i32)
    (local $y i64)
    (local $z f32)
    (local $w f64)
    (set_local $x (i32.const 1))
    (set_local $y (i64.const 1))
    (set_local $z (f32.const 1))
    (set_local $w (f64.const 1))
    (call $nothing)
    (drop (get_local $x))
    (drop (get_local $y))
    (drop (get_local $z))
    (drop (get_local $w))
  )
  (func $spill4
    (local $x i32)
    (local $y i32)
    (local $z i32)
    (local $w i32)
    (set_local $x (i32.const 1))
    (set_local $y (i32.const 1))
    (set_local $z (i32.const 1))
    (set_local $w (i32.const 1))
    (call $nothing)
    (drop (get_local $x))
    (drop (get_local $y))
    (drop (get_local $z))
    (drop (get_local $w))
  )
  (func $spill5
    (local $x i32)
    (local $y i32)
    (local $z i32)
    (local $w i32)
    (local $a i32)
    (set_local $x (i32.const 1))
    (set_local $y (i32.const 1))
    (set_local $z (i32.const 1))
    (set_local $w (i32.const 1))
    (set_local $a (i32.const 1))
    (call $nothing)
    (drop (get_local $x))
    (drop (get_local $y))
    (drop (get_local $z))
    (drop (get_local $w))
    (drop (get_local $a))
  )
  (func $some-alive
    (local $x i32)
    (local $y i32)
    (call $nothing)
    (drop (get_local $x))
  )
  (func $spill-args (param $p i32) (param $q i32)
    (local $x i32)
    (call $spill-args (i32.const 1) (i32.const 2))
    (drop (get_local $x))
  )
  (func $spill-ret (result i32)
    (local $x i32)
    (call $nothing)
    (drop (get_local $x))
    (if (i32.const 1)
      (return (i32.const 2))
      (return (i32.const 3))
    )
    (i32.const 4)
  )
  (func $spill-unreachable (result i32)
    (local $x i32)
    (call $nothing)
    (drop (get_local $x))
    (unreachable)
  )
  (func $spill-call-call0 (param $p i32) (result i32)
    (unreachable)
  )
  (func $spill-call-call1 (param $p i32) (result i32)
    (local $x i32)
    (drop
      (call $spill-call-call0
        (call $spill-call-call1
          (i32.const 1)
        )
      )
    )
    (get_local $x)
  )
  (func $spill-call-ret (param $p i32) (result i32)
    (local $x i32)
    (drop
      (call $spill-call-call0
        (return
          (i32.const 1)
        )
      )
    )
    (get_local $x)
  )
)

