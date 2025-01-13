local M = {}

-- Define the color palette
M.colors = {
  bg = "#000000",          -- Pure black background
  fg = "#ebdbb2",          -- Main foreground
  black = "#000000",
  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",
  gray = "#928374",
  dim_gray = "#504945",    -- Dimmed background elements
  bright_gray = "#a89984", -- Brighter gray elements
  dim_black = "#3c3836",   -- For UI elements needing slight contrast from bg
}

-- Define all the highlight groups
local function get_groups(colors)
  return {
    -- Base groups
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    Comment = { fg = colors.gray, italic = true },
    CursorLine = { bg = colors.black },
    CursorLineNr = { fg = colors.yellow },
    LineNr = { fg = colors.gray },
    SignColumn = { bg = colors.bg },
    VertSplit = { fg = colors.bg },
    WinSeparator = { guifg = colors.bg },
    StatusLine = { fg = colors.fg, bg = colors.black },
    StatusLineNC = { fg = colors.gray, bg = colors.black },
    Visual = { bg = colors.dim_gray },
    IncSearch = { fg = colors.black, bg = colors.orange },
    Search = { fg = colors.black, bg = colors.yellow },
    MatchParen = { bg = colors.dim_gray, bold = true },
    Question = { fg = colors.orange, bold = true },
    ModeMsg = { fg = colors.fg, bold = true },
    NonText = { fg = colors.dim_gray },
    
    -- Popup menus
    Pmenu = { fg = colors.fg, bg = colors.dim_black },
    PmenuSel = { fg = colors.dim_black, bg = colors.blue, bold = true },
    PmenuSbar = { bg = colors.dim_black },
    PmenuThumb = { bg = colors.dim_gray },
    WildMenu = { fg = colors.blue, bg = colors.dim_black, bold = true },

    -- Base syntax
    Identifier = { fg = colors.blue },
    Function = { fg = colors.green, bold = true },
    Statement = { fg = colors.red },
    Constant = { fg = colors.purple },
    String = { fg = colors.green },
    Special = { fg = colors.orange },
    PreProc = { fg = colors.aqua },
    Type = { fg = colors.yellow },
    Directory = { fg = colors.green, bold = true },
    Title = { fg = colors.green, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.aqua },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.aqua },

    -- LSP
    LspReferenceText = { bg = colors.dim_black },
    LspReferenceRead = { bg = colors.dim_black },
    LspReferenceWrite = { bg = colors.dim_black },
    LspSignatureActiveParameter = { link = "Search" },

    -- Git Signs
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    -- Diffs
    DiffAdd = { bg = colors.green, fg = colors.black },
    DiffChange = { bg = colors.yellow, fg = colors.black },
    DiffDelete = { bg = colors.red, fg = colors.black },
    DiffText = { bg = colors.blue, fg = colors.black },

    -- Treesitter groups
    -- Misc
    ["@comment"] = { fg = colors.gray, italic = true },
    ["@error"] = { fg = colors.red },
    ["@preproc"] = { fg = colors.aqua },
    ["@define"] = { fg = colors.aqua },
    ["@operator"] = { fg = colors.purple },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.blue },

    -- Literals
    ["@string"] = { fg = colors.green, italic = true },
    ["@string.regex"] = { fg = colors.orange },
    ["@string.escape"] = { fg = colors.orange },
    ["@string.special"] = { fg = colors.orange },
    ["@character"] = { fg = colors.purple },
    ["@character.special"] = { fg = colors.purple },
    ["@boolean"] = { fg = colors.purple },
    ["@number"] = { fg = colors.purple },
    ["@float"] = { fg = colors.purple },

    -- Functions
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.aqua },
    ["@function.call"] = { fg = colors.blue },
    ["@function.macro"] = { fg = colors.blue, italic = true },
    ["@method"] = { fg = colors.blue },
    ["@method.call"] = { fg = colors.blue },
    ["@constructor"] = { fg = colors.yellow },
    ["@parameter"] = { fg = colors.fg, italic = true },

    -- Keywords
    ["@keyword"] = { fg = colors.purple },
    ["@keyword.function"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.purple },
    ["@keyword.return"] = { fg = colors.purple },
    ["@conditional"] = { fg = colors.purple },
    ["@repeat"] = { fg = colors.purple },
    ["@debug"] = { fg = colors.purple },
    ["@label"] = { fg = colors.purple },
    ["@include"] = { fg = colors.purple },
    ["@exception"] = { fg = colors.purple },

    -- Types
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.orange },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@type.definition"] = { fg = colors.yellow },
    ["@storageclass"] = { fg = colors.orange },
    ["@attribute"] = { fg = colors.aqua },
    ["@field"] = { fg = colors.aqua },
    ["@property"] = { fg = colors.aqua },

    -- Variables
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.orange },
    ["@constant"] = { fg = colors.purple },
    ["@constant.builtin"] = { fg = colors.purple },
    ["@constant.macro"] = { fg = colors.purple },
    ["@namespace"] = { fg = colors.yellow },
    ["@symbol"] = { fg = colors.purple },

    -- Text
    ["@text"] = { fg = colors.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.title"] = { fg = colors.green, bold = true },
    ["@text.literal"] = { fg = colors.green },
    ["@text.uri"] = { fg = colors.blue, underline = true },
    ["@text.math"] = { fg = colors.blue },
    ["@text.environment"] = { fg = colors.purple },
    ["@text.environment.name"] = { fg = colors.yellow },
    ["@text.reference"] = { fg = colors.orange },
    ["@text.todo"] = { fg = colors.bg, bg = colors.yellow },
    ["@text.note"] = { fg = colors.bg, bg = colors.blue },
    ["@text.warning"] = { fg = colors.bg, bg = colors.yellow },
    ["@text.danger"] = { fg = colors.bg, bg = colors.red },

    -- Tags
    ["@tag"] = { fg = colors.purple },
    ["@tag.attribute"] = { fg = colors.aqua },
    ["@tag.delimiter"] = { fg = colors.gray },

    -- Language specific
    -- HTML
    ["@tag.html"] = { fg = colors.aqua, bold = true },
    ["@tag.delimiter.html"] = { fg = colors.aqua, bold = true },
    htmlTag = { fg = colors.aqua, bold = true },
    htmlEndTag = { fg = colors.aqua, bold = true },
    htmlTagName = { fg = colors.blue },
    htmlArg = { fg = colors.orange },
    htmlTagN = { fg = colors.fg },
    htmlSpecialTagName = { fg = colors.blue },
    htmlLink = { fg = colors.bright_gray, underline = true },
    htmlSpecialChar = { fg = colors.red },
    htmlBold = { fg = colors.fg, bg = colors.bg, bold = true },
    htmlBoldUnderline = { fg = colors.fg, bg = colors.bg, bold = true, underline = true },
    htmlBoldItalic = { fg = colors.fg, bg = colors.bg, bold = true, italic = true },
    htmlItalic = { fg = colors.fg, bg = colors.bg, italic = true },

    -- CSS
    cssBraces = { fg = colors.blue },
    cssFunctionName = { fg = colors.yellow },
    cssIdentifier = { fg = colors.orange },
    cssClassName = { fg = colors.green },
    cssColor = { fg = colors.blue },
    cssSelectorOp = { fg = colors.blue },
    cssSelectorOp2 = { fg = colors.blue },
    cssImportant = { fg = colors.green },
    cssVendor = { fg = colors.fg },
    cssTextProp = { fg = colors.aqua },
    cssAnimationProp = { fg = colors.aqua },
    cssUIProp = { fg = colors.yellow },
    cssTransformProp = { fg = colors.aqua },
    cssTransitionProp = { fg = colors.aqua },
    cssPrintProp = { fg = colors.aqua },
    cssPositioningProp = { fg = colors.yellow },
    cssBoxProp = { fg = colors.aqua },
    cssFontDescriptorProp = { fg = colors.aqua },
    cssFlexibleBoxProp = { fg = colors.aqua },
    cssBorderOutlineProp = { fg = colors.aqua },
    cssBackgroundProp = { fg = colors.aqua },
    cssMarginProp = { fg = colors.aqua },
    cssListProp = { fg = colors.aqua },
    cssTableProp = { fg = colors.aqua },
    cssFontProp = { fg = colors.aqua },
    cssPaddingProp = { fg = colors.aqua },
    cssDimensionProp = { fg = colors.aqua },
    cssRenderProp = { fg = colors.aqua },
    cssColorProp = { fg = colors.aqua },
    cssGeneratedContentProp = { fg = colors.aqua },

    -- JavaScript
    javaScript = { fg = colors.fg },
    javaScriptBraces = { fg = colors.aqua },
    javaScriptNumber = { fg = colors.purple },
    javaScriptNull = { fg = colors.purple },
    javaScriptFunction = { fg = colors.aqua },
    javaScriptIdentifier = { fg = colors.red },
    javaScriptMember = { fg = colors.blue },
    javaScriptParens = { fg = colors.bright_gray },

    -- TypeScript
    typescriptReserved = { fg = colors.aqua },
    typescriptLabel = { fg = colors.aqua },
    typescriptFuncKeyword = { fg = colors.aqua },
    typescriptIdentifier = { fg = colors.orange },
    typescriptBraces = { fg = colors.aqua },
    typescriptEndColons = { fg = colors.fg },
    typescriptDOMObjects = { fg = colors.fg },
    typescriptAjaxMethods = { fg = colors.fg },
    typescriptLogicSymbols = { fg = colors.fg },
    typescriptGlobalObjects = { fg = colors.fg },
    typescriptParens = { fg = colors.bright_gray },
    typescriptOpSymbols = { fg = colors.bright_gray },
    typescriptHtmlElemProperties = { fg = colors.fg },
    typescriptNull = { fg = colors.purple },
    typescriptInterpolationDelimiter = { fg = colors.aqua },

    -- Python
    pythonBuiltin = { fg = colors.orange },
    pythonBuiltinObj = { fg = colors.orange },
    pythonBuiltinFunc = { fg = colors.orange },
    pythonFunction = { fg = colors.aqua },
    pythonDecorator = { fg = colors.red },
    pythonInclude = { fg = colors.blue },
    pythonImport = { fg = colors.blue },
    pythonRun = { fg = colors.blue },
    pythonCoding = { fg = colors.blue },
    pythonOperator = { fg = colors.red },
    pythonException = { fg = colors.red },
    pythonExceptions = { fg = colors.purple },
    pythonBoolean = { fg = colors.purple },
    pythonDot = { fg = colors.bright_gray },
    pythonConditional = { fg = colors.red },
    pythonRepeat = { fg = colors.red },
    pythonDottedName = { fg = colors.green, bold = true },

    -- Markdown
    markdownItalic = { fg = colors.bright_gray, italic = true },
    markdownBold = { fg = colors.bright_gray, bold = true },
    markdownBoldItalic = { fg = colors.bright_gray, bold = true, italic = true },
    markdownH1 = { fg = colors.green, bold = true },
    markdownH2 = { fg = colors.green, bold = true },
    markdownH3 = { fg = colors.yellow, bold = true },
    markdownH4 = { fg = colors.yellow, bold = true },
    markdownH5 = { fg = colors.yellow },
    markdownH6 = { fg = colors.yellow },
    markdownCode = { fg = colors.aqua },
    markdownCodeBlock = { fg = colors.aqua },
    markdownCodeDelimiter = { fg = colors.aqua },
    markdownBlockquote = { fg = colors.gray },
    markdownListMarker = { fg = colors.gray },
    markdownOrderedListMarker = { fg = colors.gray },
    markdownRule = { fg = colors.gray },
    markdownHeadingRule = { fg = colors.gray },
    markdownUrlDelimiter = { fg = colors.bright_gray },
    markdownLinkDelimiter = { fg = colors.bright_gray },
    markdownLinkTextDelimiter = { fg = colors.bright_gray },
    markdownHeadingDelimiter = { fg = colors.orange },
    markdownUrl = { fg = colors.purple },
    markdownUrlTitleDelimiter = { fg = colors.green },
    markdownLinkText = { fg = colors.gray, underline = true },
    markdownIdDeclaration = { link = "markdownLinkText" },

    -- Telescope
    TelescopeNormal = { fg = colors.fg },
    TelescopeSelection = { fg = colors.orange, bold = true },
    TelescopeSelectionCaret = { fg = colors.red },
    TelescopeMultiSelection = { fg = colors.gray },
    TelescopeBorder = { fg = colors.fg },
    TelescopePromptBorder = { fg = colors.fg },
    TelescopeResultsBorder = { fg = colors.fg },
    TelescopePreviewBorder = { fg = colors.fg },
    TelescopeMatching = { fg = colors.blue },
    TelescopePromptPrefix = { fg = colors.red },
    TelescopePrompt = { fg = colors.fg },

    -- NvimTree
    NvimTreeSymlink = { fg = colors.aqua },
    NvimTreeRootFolder = { fg = colors.purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.blue, bold = true },
    NvimTreeFileIcon = { fg = colors.fg },
    NvimTreeExecFile = { fg = colors.green, bold = true },
    NvimTreeOpenedFile = { fg = colors.red, bold = true },
    NvimTreeSpecialFile = { fg = colors.yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.purple },
    NvimTreeIndentMarker = { fg = colors.dim_gray },
    NvimTreeGitDirty = { fg = colors.yellow },
    NvimTreeGitStaged = { fg = colors.yellow },
    NvimTreeGitMerge = { fg = colors.purple },
    NvimTreeGitRenamed = { fg = colors.purple },
    NvimTreeGitNew = { fg = colors.yellow },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeWindowPicker = { bg = colors.aqua },

    -- Netrw
    netrwDir = { fg = colors.aqua },
    netrwClassify = { fg = colors.aqua },
    netrwLink = { fg = colors.gray },
    netrwSymLink = { fg = colors.fg },
    netrwExe = { fg = colors.yellow },
    netrwComment = { fg = colors.gray },
    netrwList = { fg = colors.blue },
    netrwHelpCmd = { fg = colors.aqua },
    netrwCmdSep = { fg = colors.bright_gray },
    netrwVersion = { fg = colors.green },

    -- cmp
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrDeprecated = { fg = colors.fg },
    CmpItemAbbrMatch = { fg = colors.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue, underline = true },
    CmpItemMenu = { fg = colors.gray },
    CmpItemKindText = { fg = colors.orange },
    CmpItemKindMethod = { fg = colors.blue },
    CmpItemKindFunction = { fg = colors.blue },
    CmpItemKindConstructor = { fg = colors.yellow },
    CmpItemKindField = { fg = colors.blue },
    CmpItemKindVariable = { fg = colors.orange },
    CmpItemKindClass = { fg = colors.yellow },
    CmpItemKindInterface = { fg = colors.yellow },
    CmpItemKindModule = { fg = colors.blue },
    CmpItemKindProperty = { fg = colors.blue },
    CmpItemKindUnit = { fg = colors.blue },
    CmpItemKindValue = { fg = colors.orange },
    CmpItemKindEnum = { fg = colors.yellow },
    CmpItemKindKeyword = { fg = colors.purple },
    CmpItemKindSnippet = { fg = colors.green },
    CmpItemKindColor = { fg = colors.purple },
    CmpItemKindFile = { fg = colors.blue },
    CmpItemKindReference = { fg = colors.purple },
    CmpItemKindFolder = { fg = colors.blue },
    CmpItemKindEnumMember = { fg = colors.aqua },
    CmpItemKindConstant = { fg = colors.orange },
    CmpItemKindStruct = { fg = colors.yellow },
    CmpItemKindEvent = { fg = colors.yellow },
    CmpItemKindOperator = { fg = colors.yellow },
    CmpItemKindTypeParameter = { fg = colors.yellow },
  }
end

-- Load the colorscheme
function M.load()
  -- Clear existing highlights
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
  vim.g.terminal_color_8 = M.colors.dim_gray
  vim.g.terminal_color_9 = M.colors.red
  vim.g.terminal_color_10 = M.colors.green
  vim.g.terminal_color_11 = M.colors.yellow
  vim.g.terminal_color_12 = M.colors.blue
  vim.g.terminal_color_13 = M.colors.purple
  vim.g.terminal_color_14 = M.colors.aqua
  vim.g.terminal_color_15 = M.colors.bright_gray
end

return M
