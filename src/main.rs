#[allow(dead_code)]
fn foo(
  _x: i32,
  _y: i32,
) -> i32 {
  1
}

#[allow(dead_code)]
fn example() -> bool {
  if false {
    let to_comp = true;
    if to_comp {
      true
    } else {
      false
    }
  } else {
    true
  }
}

fn main() {
  println!("Hello, world!");
  let eg = example;
  println!("eg() => {}", eg());
}
