# PowerYank

vim-poweryank provides powerful yank utilities.

## Copy Over SSH (OSC52)
Copy text by sending string to the terminal clipboard using the OSC 52 escape
sequence, as specified in
http://invisible-island.net/xterm/ctlseqs/ctlseqs.html section 'Operating
System Commands', Ps => 52.

It can be used to copy text over SSH.


## Usage

```vim
map <Leader>y <Plug>(operator-poweryank-osc52)
```

and type `<Leader>y{motion}` to copy {motion} text.

See [doc/poweryank.txt](doc/poweryank.txt) for more detail.

## Author
haya14busa (https://github.com/haya14busa)
