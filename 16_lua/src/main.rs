use mlua::prelude::*;

fn main() -> mlua::Result<()>{
    let lua = Lua::new();

    let tree: mlua::Table = lua.load(include_str!("../hello_xmas.lua")).eval()?;

    for pair in tree.pairs::<i32, String>() {
        let (_, line) = pair?;
        println!("{}", line);
    }

    Ok(())
}
