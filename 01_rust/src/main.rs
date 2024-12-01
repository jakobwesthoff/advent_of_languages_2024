/*
   /\
  /  \
  /  \
 /  o \
 /    \
/ u    \
--------
   ||
   ||
*/

fn print_tree_group(n: usize, len: usize) {
    print!("{:>width$}", "", width = len - n);
    println!("/{:>width$}\\", "", width = n * 2);
    print!("{:>width$}", "", width = len - n - 1);
    println!("/{:>width$}\\", "", width = (n + 1) * 2);
}

fn print_trunk(spacing: usize) {
     println!("{:>width$}||", "", width=spacing);
     println!("{:>width$}||", "", width=spacing);
}

fn main() {
    let groups = 3;
    for n in 0..groups {
        print_tree_group(n, groups);
    }

    println!("{:->width$}", "", width = groups * 2 + 2);

    print_trunk(groups);
}
