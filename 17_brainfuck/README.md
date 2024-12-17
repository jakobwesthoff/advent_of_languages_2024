Day17 Brainfuck
===============

Our Brainfuck xmas tree generator, should work with any brainfuck interpreter out there.

The `no_comment` version is identical to the normal version, but all non brainfuck program characters have been removed and the result wrapped at 40 columns using the following command:

```
cat hello.brainfuck | sed -e 's@[^].<>+[-]@@g'|sed -z 's/\n//g'|fold -w40
```

Therefore if you want to impress somebody just use the `no_comment` version ;).

The rust_brain interpreter that was created live on youtube as well can be used as one of the many interpreters out there to execute the christmas tree program:

https://github.com/jakobwesthoff/rust_brain


