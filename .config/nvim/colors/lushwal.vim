set background=dark
if exists('g:colors_name')
hi clear
if exists('syntax_on')
syntax reset
endif
endif
let g:colors_name = 'lushwal'
highlight Normal guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight! link User Normal
highlight Bold guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=bold
highlight Boolean guifg=#506855 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Character guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight ColorColumn guifg=#8E9595 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Comment guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=italic
highlight Conceal guifg=#7D8282 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight! link Whitespace Conceal
highlight Conditional guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Constant guifg=#506855 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Cursor guifg=#121A1C guibg=#B4BBBB guisp=NONE blend=NONE gui=NONE
highlight CursorColumn guifg=#8E9595 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight CursorLine guifg=#7D8282 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight CursorLineNr guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight Debug guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Define guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Delimiter guifg=#446A4B guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticError guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticHint guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticInfo guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticUnderlineError guifg=#3E6547 guibg=NONE guisp=#3E6547 blend=NONE gui=underline
highlight DiagnosticUnderlineHint guifg=#878C78 guibg=NONE guisp=#878C78 blend=NONE gui=underline
highlight DiagnosticUnderlineInfo guifg=#8D6E68 guibg=NONE guisp=#8D6E68 blend=NONE gui=underline
highlight DiagnosticUnderlineWarn guifg=#616561 guibg=NONE guisp=#616561 blend=NONE gui=underline
highlight DiagnosticWarn guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiffAdd guifg=#4B4E4E guibg=#7D8282 guisp=NONE blend=NONE gui=bold
highlight! link DiffAdded DiffAdd
highlight DiffChange guifg=#A0A7A7 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight DiffDelete guifg=#3E6547 guibg=#7D8282 guisp=NONE blend=NONE gui=bold
highlight! link DiffRemoved DiffDelete
highlight! link diffRemoved DiffDelete
highlight DiffFile guifg=#3E6547 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight DiffLine guifg=#8D6E68 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight DiffNewFile guifg=#4B4E4E guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight DiffText guifg=#8D6E68 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight Directory guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight EndOfBuffer guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight Error guifg=#3E6547 guibg=#B4BBBB guisp=NONE blend=NONE gui=NONE
highlight ErrorMsg guifg=#3E6547 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight Exception guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Float guifg=#506855 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight FoldColumn guifg=#8D6E68 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight Folded guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=italic
highlight Function guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Identifier guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight IncSearch guifg=#7D8282 guibg=#506855 guisp=NONE blend=NONE gui=NONE
highlight Include guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Italic guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=italic
highlight Keyword guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Label guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight LineNr guifg=#A0A7A7 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight Macro guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MatchParen guifg=#B4BBBB guibg=#A0A7A7 guisp=NONE blend=NONE gui=NONE
highlight MiniCompletionActiveParameter guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniCursorword guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=underline
highlight! link MiniCursorwordCurrent MiniCursorword
highlight MiniIndentscopePrefix guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=nocombine
highlight MiniIndentscopeSymbol guifg=#7D8282 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight MiniJump guifg=#8D6E68 guibg=NONE guisp=#A0A7A7 blend=NONE gui=underline
highlight MiniJump2dSpot guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=undercurl
highlight MiniStarterCurrent guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterFooter guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniStarterHeader guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniStarterInactive guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=italic
highlight MiniStarterItem guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight MiniStarterItemBullet guifg=#446A4B guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterItemPrefix guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterQuery guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterSection guifg=#446A4B guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineDevinfo guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineFileinfo guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineFilename guifg=#616561 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineInactive guifg=#8E9595 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeCommand guifg=#121A1C guibg=#878C78 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeInsert guifg=#121A1C guibg=#8D6E68 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeNormal guifg=#121A1C guibg=#4B4E4E guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeOther guifg=#121A1C guibg=#BBC0AA guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeReplace guifg=#121A1C guibg=#3E6547 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeVisual guifg=#121A1C guibg=#506855 guisp=NONE blend=NONE gui=NONE
highlight MiniSurround guifg=#7D8282 guibg=#506855 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineCurrent guifg=#A0A7A7 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineFill guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniTablineHidden guifg=#4B4E4E guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedCurrent guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedHidden guifg=#8E9595 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedVisible guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineVisible guifg=#A0A7A7 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight MiniTestEmphasis guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTestFail guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTestPass guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTrailspace guifg=#3E6547 guibg=#B4BBBB guisp=NONE blend=NONE gui=NONE
highlight ModeMsg guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MoreMsg guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight NonText guifg=#A0A7A7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Number guifg=#506855 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Operator guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PMenu guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight PMenuSel guifg=#B4BBBB guibg=#8D6E68 guisp=NONE blend=NONE gui=NONE
highlight PmenuSbar guifg=#8E9595 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PmenuThumb guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PreProc guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Question guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Repeat guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Search guifg=#A0A7A7 guibg=#616561 guisp=NONE blend=NONE gui=NONE
highlight! link MiniTablineTabpagesection Search
highlight SignColumn guifg=#8E9595 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight Special guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpecialChar guifg=#446A4B guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpecialKey guifg=#A0A7A7 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpellBad guifg=#3E6547 guibg=NONE guisp=#3E6547 blend=NONE gui=underline
highlight SpellCap guifg=#616561 guibg=NONE guisp=#616561 blend=NONE gui=underline
highlight SpellLocal guifg=#878C78 guibg=NONE guisp=#878C78 blend=NONE gui=underline
highlight SpellRare guifg=#BBC0AA guibg=NONE guisp=#BBC0AA blend=NONE gui=underline
highlight Statement guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight StatusLine guifg=#B4BBBB guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight StatusLineNC guifg=#8E9595 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight StatusLineTerm guifg=#4B4E4E guibg=#4B4E4E guisp=NONE blend=NONE gui=NONE
highlight StatusLineTermNC guifg=#616561 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight StorageClass guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight String guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Structure guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight TabLine guifg=#A0A7A7 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight TabLineFill guifg=#A0A7A7 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight TabLineSel guifg=#4B4E4E guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight Tag guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Title guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight Todo guifg=#616561 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight TooLong guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Type guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Typedef guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Underlined guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight VertSplit guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight! link WinSeparator VertSplit
highlight Visual guifg=#121A1C guibg=#8E9595 guisp=NONE blend=NONE gui=NONE
highlight VisualNOS guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight WarningMsg guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight WildMenu guifg=#B4BBBB guibg=#8D6E68 guisp=NONE blend=NONE gui=NONE
highlight WinBar guifg=#B4BBBB guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight WinBarNC guifg=#8E9595 guibg=#121A1C guisp=NONE blend=NONE gui=NONE
highlight gitCommitOverflow guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight gitCommitSummary guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight helpCommand guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight helpExample guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @attribute guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @boolean guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @character guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @character.special guifg=#446A4B guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @comment guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=italic
highlight @conditional guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant.builtin guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant.macro guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constructor guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @debug guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @define guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @exception guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @field guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @float guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function.builtin guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function.macro guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @include guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword.function guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword.operator guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @label guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @method guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @namespace guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @none guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @number guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @operator guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @parameter guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @preproc guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @property guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.bracket guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.delimiter guifg=#B4BBBB guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.special guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @repeat guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @storageclass guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.escape guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.regex guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.special guifg=#446A4B guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @symbol guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag.attribute guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag.delimiter guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.bold guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @text.danger guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.diff.add guifg=#4B4E4E guibg=#7D8282 guisp=NONE blend=NONE gui=bold
highlight @text.diff.delete guifg=#3E6547 guibg=#7D8282 guisp=NONE blend=NONE gui=bold
highlight @text.emphasis guifg=#BBC0AA guibg=NONE guisp=NONE blend=NONE gui=italic
highlight @text.environment guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.environment.name guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.literal guifg=#4B4E4E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.math guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.note guifg=#878C78 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.reference guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.strike guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=strikethrough
highlight @text.title guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @text.todo guifg=#616561 guibg=#7D8282 guisp=NONE blend=NONE gui=NONE
highlight @text.underline guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=underline
highlight @text.uri guifg=NONE guibg=#7D8282 guisp=NONE blend=NONE gui=underline
highlight @type guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @type.builtin guifg=#8D6E68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @type.definition guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @variable guifg=#616561 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @variable.builtin guifg=#3E6547 guibg=NONE guisp=NONE blend=NONE gui=NONE