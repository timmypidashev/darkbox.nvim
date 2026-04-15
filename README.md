![Darkbox Theme Preview](.github/darkbox.png)
# 🎨 Darkbox.nvim

A pure-black refresh of the retro-groove aesthetic for modern displays. Darkbox brings the classic groove style into the modern era with a focus on OLED-friendly pure blacks and carefully selected contrasts.

## ✨ Features

- Pure black (#000000) background optimized for OLED displays
- Retro-groove inspired color palette with modern refinements
- Built-in support for tree-sitter

## 📸 Screenshots

### Classic
![Screenshot](.github/screenshot_classic.png)

### Retro 
![Screenshot](.github/screenshot_retro.png)

### Dim
![Screenshot](.github/screenshot_dim.png)

## 🚀 Installation

### Using vim.pack (Neovim 0.12+)

The built-in package manager. Recommended.

```lua
vim.pack.add({
  { src = "https://github.com/timmypidashev/darkbox.nvim" },
})

require("darkbox").setup({
  contrast = "retro",
})
vim.cmd.colorscheme("darkbox")
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
  "timmypidashev/darkbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("darkbox").setup({
      contrast = "retro",
    })
    vim.cmd.colorscheme("darkbox")
  end,
}
```

> The examples below use the `vim.pack` pattern. If you use lazy.nvim, place the `setup()` and `colorscheme` calls inside the `config` function instead.

## ✏️ Configuration

All available options with their defaults:

```lua
vim.pack.add({
  { src = "https://github.com/timmypidashev/darkbox.nvim" },
})

require("darkbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "retro", "dim" or empty string for classic
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd.colorscheme("darkbox")
```

**VERY IMPORTANT**: Call `setup()` **BEFORE** the colorscheme command to apply custom configs.

## 🔧 Overrides

### Palette

Specify your own palette colors:

```lua
vim.pack.add({
  { src = "https://github.com/timmypidashev/darkbox.nvim" },
})

require("darkbox").setup({
  palette_overrides = {
    base_red = "#991900",
  },
})
vim.cmd.colorscheme("darkbox")
```

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. Report issues
2. Suggest improvements
3. Create pull requests
4. Share your configurations

## 📝 License

MIT License - See [LICENSE](LICENSE) for details

---
View the [project page](https://timmypidashev.dev/projects/darkbox) for darkbox on my website for more info :D

Made with ♥️ by [timmypidashev](https://github.com/timmypidashev)
