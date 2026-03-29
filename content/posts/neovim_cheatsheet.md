+++
title = "Neovim Cheatsheet"
description = "This is my Neovim config cheatsheet."
date = 2026-03-29
# updated = 2026-03-29
draft = false
[taxonomies]
tags = []
+++

My config is basically the 0.12 configuration version of the [MiniMax](https://github.com/nvim-mini/MiniMax) repository with LSP and formatters configured.

## Navigation

| Shortcut | Action |
|---|---|
| `h` / `j` / `k` / `l` | Move left / down / up / right |
| `w` / `b` | Next / previous word |
| `gg` / `G` | Top / bottom of file |
| `<C-d>` / `<C-u>` | Scroll down / up half page |
| `<C-h/j/k/l>` | Navigate between windows |
| `[b` / `]b` | Previous / next buffer |
| `[d` / `]d` | Previous / next diagnostic |
| `[i` / `]i` | Previous / next indent scope |

## Buffers

| Shortcut | Action |
|---|---|
| `Space + ba` | Alternate buffer |
| `Space + bd` | Delete buffer |
| `Space + bD` | Force delete buffer |
| `Space + bs` | New scratch buffer |
| `Space + bw` | Wipeout buffer |
| `Space + bW` | Force wipeout buffer |

## Explore / Edit

| Shortcut | Action |
|---|---|
| `Space + ed` | Open file explorer (cwd) |
| `Space + ef` | Open file explorer (current file) |
| `Space + ei` | Edit init.lua |
| `Space + en` | Show notifications history |
| `Space + eq` | Toggle quickfix list |
| `Space + eQ` | Toggle location list |

## Find

| Shortcut | Action |
|---|---|
| `Space + ff` | Find files |
| `Space + fg` | Live grep |
| `Space + fG` | Grep current word |
| `Space + fb` | Find buffers |
| `Space + fh` | Find help tags |
| `Space + fd` | Workspace diagnostics |
| `Space + fD` | Buffer diagnostics |
| `Space + fr` | Resume last picker |
| `Space + fR` | LSP references |
| `Space + fs` | LSP workspace symbols |
| `Space + fS` | LSP document symbols |
| `Space + fc` | Git commits (all) |
| `Space + fC` | Git commits (buffer) |

## Git

| Shortcut | Action |
|---|---|
| `Space + gs` | Show info at cursor |
| `Space + go` | Toggle diff overlay |
| `Space + gd` | Diff unstaged |
| `Space + gD` | Diff buffer |
| `Space + gc` | Commit |
| `Space + gC` | Commit amend |
| `Space + gl` | Git log |
| `Space + gL` | Git log (buffer) |

## Language / LSP

| Shortcut | Action |
|---|---|
| `Space + la` | Code actions |
| `Space + ld` | Diagnostic popup |
| `Space + lf` | Format file |
| `Space + lh` | Hover documentation |
| `Space + li` | Go to implementation |
| `Space + lr` | Rename symbol |
| `Space + lR` | References |
| `Space + ls` | Go to definition |
| `Space + lt` | Go to type definition |

## Map

| Shortcut | Action |
|---|---|
| `Space + mt` | Toggle minimap |
| `Space + mf` | Focus minimap |
| `Space + ms` | Toggle minimap side |
| `Space + mr` | Refresh minimap |

## Sessions

| Shortcut | Action |
|---|---|
| `Space + sn` | New session |
| `Space + sr` | Read session |
| `Space + sd` | Delete session |
| `Space + sw` | Write current session |

## Terminal

| Shortcut | Action |
|---|---|
| `Space + tt` | Terminal (vertical) |
| `Space + tT` | Terminal (horizontal) |

## Editing

| Shortcut | Action |
|---|---|
| `i` / `a` | Insert before / after cursor |
| `o` / `O` | New line below / above |
| `gcc` | Toggle comment (line) |
| `gc` | Toggle comment (selection) |
| `dd` | Delete line |
| `yy` | Yank line |
| `p` / `P` | Paste after / before |
| `u` / `<C-r>` | Undo / redo |
| `<M-j>` / `<M-k>` | Move line down / up |
| `<M-h>` / `<M-l>` | Decrease / increase indent |

## Text Objects

| Shortcut | Action |
|---|---|
| `ci)` | Change inside parenthesis |
| `di(` | Delete inside padded parenthesis |
| `yaq` | Yank around quote |
| `vif` | Select inside function call |
| `cii` | Change inside indent scope |
| `iF` / `aF` | Inside / around function (treesitter) |
| `iB` / `aB` | Inside / around buffer |

## Other

| Shortcut | Action |
|---|---|
| `Space + oz` | Zoom toggle |
| `Space + ot` | Trim trailing whitespace |
| `Space + or` | Resize window to default width |

## Misc

| Shortcut | Action |
|---|---|
| `<Esc>` | Clear search highlights |
| `\h` | Toggle search highlighting |
| `gy` / `gp` | Copy / paste system clipboard |
| `go` / `gO` | Insert empty line below / above |
| `<C-s>` | Save and go to Normal mode |
| `[p` / `]p` | Paste above / below current line |
