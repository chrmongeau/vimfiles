# Vim Configuration

Configuration files for the [most awesome text editor](http://www.vim.org/).

## Plugin management

Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).
After adding a plugin to `vimrc`, run `:PlugInstall`. See the vim-plug
documentation for other commands (`:PlugUpdate`, `:PlugClean`, etc.).

### Installed plugins

- **vim-dotenv** — load environment variables from `.env` files
- **vim-fugitive** — Git integration (`:Git`, branch in statusline)
- **vim-gitgutter** — show added/changed/deleted lines in the sign column
- **vim-slime** — send code from a buffer to a Vim terminal
- **vim-dadbod** / **vim-dadbod-ui** / **vim-dadbod-completion** — database client and UI

## Colorscheme

**nokto** (`colors/nokto.vim`) — a dark colorscheme with high-contrast colors
on a black background. Defines highlight groups for syntax, diffs, popups,
statusline, folds, tabs, gitgutter signs, and more.

## Key mappings

| Mapping          | Mode   | Action                              |
|------------------|--------|-------------------------------------|
| `<Leader>n`      | Normal | Toggle line numbers on/off          |
| `<Space>`        | Normal | Page down                           |
| `jj`             | Insert | Escape to normal mode               |
| `<F9>`           | Normal | Toggle search highlighting          |
| `<Leader>cc`     | Normal | Select Conda env and open terminal (Python files) |
| `:DBPick`        | Command| Switch active database for dadbod   |

## Custom filetype: `.no` (notes)

A lightweight personal note-taking format with its own syntax highlighting,
indentation rules, and link navigation:

- **Syntax** (`after/syntax/no.vim`) — headings (indent-based levels),
  emphasis (`*bold*`, `_underline_`), tags (`|tag|`), links (`{url}`,
  `[[local file]]`)
- **Ftplugin** (`after/ftplugin/no.vim`) — indent-based folding, automatic
  list formatting, `<CR>` opens links/files under cursor, `<Backspace>`
  jumps back, `<Leader>d` inserts a timestamp
- **Autoload** (`autoload/no.vim`) — link-opening logic, file creation for
  `[[wiki-style]]` links, indent level manipulation

Custom filetype detection is in `filetype.vim`.

## Filetype-specific settings

- **CSS** (`after/ftplugin/css.vim`) — `<Leader>r` looks up the CSS property
  under the cursor on MDN
- **HTML** (`after/ftplugin/html.vim`) — insert-mode shortcuts for `<a>`,
  `<span>`, and `<abbr>` tags with interactive prompts

## Codetags

Common attention keywords are highlighted in comments across all filetypes:
`BUG`, `NOTE`, `HACK`, `FIXME`, `CHANGED`, `OPTIMIZE`, `WARNING`,
`IMPORTANT`, `REVIEW`, `NB`, `ATT`, `XXX` (in addition to the built-in
`TODO`).

## Directory layout

```
vimrc                  Main configuration
colors/                Colorscheme (nokto)
after/ftplugin/        Filetype-specific settings and mappings
after/syntax/          Syntax additions (.no files)
autoload/              Autoloaded functions (no.vim)
filetype.vim           Custom filetype detection
private/               Credentials and env vars (gitignored)
plugged/               Plugin installs managed by vim-plug (gitignored)
```

## Private configuration

Database URLs and other secrets are loaded from `~/vimfiles/private/env.vim`
(gitignored). This file is expected to set `$DB_MAIN_URL` and `$DB_ALT_URL`
for vim-dadbod.
