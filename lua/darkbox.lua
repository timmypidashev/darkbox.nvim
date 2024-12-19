local M = {}

-- Define the color palette
M.colors = {
  bg = "#060606",
  fg = "#ebdbb2",
  black = "#060606",
  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",
  gray = "#928374",
  bright_black = "#3c3836",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_gray = "#ebdbb2",
}

-- Define all the highlight groups
local function get_groups(colors)
  return {
    -- Base groups
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    Comment = { fg = colors.gray, italic = true },
    CursorLine = { bg = colors.black },
    CursorLineNr = { fg = colors.bright_yellow },
    LineNr = { fg = colors.gray },
    Visual = { bg = colors.gray },
    StatusLine = { fg = colors.fg, bg = colors.black },
    StatusLineNC = { fg = colors.gray, bg = colors.black },

    -- Syntax
    String = { fg = colors.green },
    Function = { fg = colors.blue },
    Keyword = { fg = colors.purple },
    Identifier = { fg = colors.orange },
    Constant = { fg = colors.yellow },
    Statement = { fg = colors.red },
    Type = { fg = colors.aqua },
    Special = { fg = colors.blue },

    -- Diagnostic
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.aqua },

    -- LSP
    LspReferenceText = { bg = colors.bright_black },
    LspReferenceRead = { bg = colors.bright_black },
    LspReferenceWrite = { bg = colors.bright_black },

    -- Git
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    -- Treesitter
    TSFunction = { fg = colors.blue },
    TSKeyword = { fg = colors.purple },
    TSString = { fg = colors.green },
    TSVariable = { fg = colors.fg },
    TSComment = { fg = colors.gray, italic = true },
  }
end

-- Load the colorscheme
function M.load()
  -- Clear existing highlights and set syntax
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set colorscheme name
  vim.o.termguicolors = true
  vim.g.colors_name = "darkbox"

  -- Apply highlight groups
  local groups = get_groups(M.colors)
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Set terminal colors
  vim.g.terminal_color_0 = M.colors.black
  vim.g.terminal_color_1 = M.colors.red
  vim.g.terminal_color_2 = M.colors.green
  vim.g.terminal_color_3 = M.colors.yellow
  vim.g.terminal_color_4 = M.colors.blue
  vim.g.terminal_color_5 = M.colors.purple
  vim.g.terminal_color_6 = M.colors.aqua
  vim.g.terminal_color_7 = M.colors.gray
  vim.g.terminal_color_8 = M.colors.bright_black
  vim.g.terminal_color_9 = M.colors.bright_red
  vim.g.terminal_color_10 = M.colors.bright_green
  vim.g.terminal_color_11 = M.colors.bright_yellow
  vim.g.terminal_color_12 = M.colors.bright_blue
  vim.g.terminal_color_13 = M.colors.bright_purple
  vim.g.terminal_color_14 = M.colors.bright_aqua
  vim.g.terminal_color_15 = M.colors.bright_gray
end

return M
