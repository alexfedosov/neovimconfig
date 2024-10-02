-- Theme: lovelace

local colors = {
  bg = "#1d1f28",
  fg = "#fdfdfd",
  black = "#282a36",
  red = "#f37f97",
  green = "#5ae275",
  yellow = "#f2a272",
  blue = "#8897f4",
  magenta = "#c574dd",
  cyan = "#79e6f3",
  white = "#fdfdfd",
  brightBlack = "#414558",
  brightRed = "#ff4971",
  brightGreen = "#18e3c8",
  brightYellow = "#ff8037",
  brightBlue = "#556fff",
  brightMagenta = "#b043d1",
  brightCyan = "#3fdcee",
  brightWhite = "#bebfc1",
}

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
    b = { fg = colors.fg, bg = colors.brightBlack },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
  },
  command = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}

-- Set up the color scheme
vim.cmd("hi clear")
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "lovelace"

-- Define highlight groups
local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- General
set_hl("Normal", { fg = colors.fg, bg = colors.bg })
set_hl("NormalFloat", { fg = colors.fg, bg = colors.bg })
set_hl("Comment", { fg = colors.brightBlack, italic = true })
set_hl("Constant", { fg = colors.yellow })
set_hl("String", { fg = colors.green })
set_hl("Character", { fg = colors.green })
set_hl("Number", { fg = colors.yellow })
set_hl("Boolean", { fg = colors.yellow })
set_hl("Float", { fg = colors.yellow })
set_hl("Identifier", { fg = colors.red })
set_hl("Function", { fg = colors.blue })
set_hl("Statement", { fg = colors.magenta })
set_hl("Conditional", { fg = colors.magenta })
set_hl("Repeat", { fg = colors.magenta })
set_hl("Label", { fg = colors.magenta })
set_hl("Operator", { fg = colors.cyan })
set_hl("Keyword", { fg = colors.magenta })
set_hl("Exception", { fg = colors.magenta })
set_hl("PreProc", { fg = colors.cyan })
set_hl("Include", { fg = colors.blue })
set_hl("Define", { fg = colors.magenta })
set_hl("Macro", { fg = colors.magenta })
set_hl("PreCondit", { fg = colors.magenta })
set_hl("Type", { fg = colors.blue })
set_hl("StorageClass", { fg = colors.yellow })
set_hl("Structure", { fg = colors.yellow })
set_hl("Typedef", { fg = colors.yellow })
set_hl("Special", { fg = colors.blue })
set_hl("SpecialChar", { fg = colors.yellow })
set_hl("Tag", { fg = colors.red })
set_hl("Delimiter", { fg = colors.fg })
set_hl("SpecialComment", { fg = colors.brightBlack })
set_hl("Debug", { fg = colors.red })
set_hl("Underlined", { fg = colors.blue, underline = true })
set_hl("Ignore", { fg = colors.brightBlack })
set_hl("Error", { fg = colors.red, bold = true, underline = true })
set_hl("Todo", { fg = colors.yellow, bold = true, italic = true })

-- Editor
set_hl("Cursor", { fg = colors.bg, bg = colors.magenta })
set_hl("CursorLine", { bg = colors.brightBlack })
set_hl("LineNr", { fg = colors.brightBlack })
set_hl("CursorLineNr", { fg = colors.yellow })
set_hl("VertSplit", { fg = colors.brightBlack })
set_hl("StatusLine", { fg = colors.fg, bg = colors.brightBlack })
set_hl("StatusLineNC", { fg = colors.brightBlack, bg = colors.bg })
set_hl("MatchParen", { fg = colors.red, bold = true })
set_hl("Visual", { bg = colors.brightBlack })

-- Pmenu
set_hl("Pmenu", { fg = colors.fg, bg = colors.bg })
set_hl("PmenuSel", { fg = colors.bg, bg = colors.blue })
set_hl("PmenuSbar", { bg = colors.brightBlack })
set_hl("PmenuThumb", { bg = colors.brightWhite })

-- Search
set_hl("Search", { fg = colors.bg, bg = colors.yellow })
set_hl("IncSearch", { fg = colors.bg, bg = colors.red })

-- Diff
set_hl("DiffAdd", { fg = colors.green })
set_hl("DiffChange", { fg = colors.yellow })
set_hl("DiffDelete", { fg = colors.red })
set_hl("DiffText", { fg = colors.blue })

-- GitSigns
set_hl("GitSignsAdd", { fg = colors.green })
set_hl("GitSignsChange", { fg = colors.yellow })
set_hl("GitSignsDelete", { fg = colors.red })

-- Spelling
set_hl("SpellBad", { undercurl = true, sp = colors.red })
set_hl("SpellCap", { undercurl = true, sp = colors.yellow })
set_hl("SpellLocal", { undercurl = true, sp = colors.green })
set_hl("SpellRare", { undercurl = true, sp = colors.blue })

return {
  colors = colors,
  theme = theme,
}

