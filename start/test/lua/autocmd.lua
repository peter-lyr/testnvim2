local file = require('plenary.path'):new(vim.g.boot_lua):parent():parent():parent():parent():joinpath('test.log').filename

vim.api.nvim_create_autocmd({
  "BufAdd", "BufDelete", "BufEnter", "BufFilePost", "BufFilePre",
  "BufHidden", "BufLeave", "BufModifiedSet", "BufNew", "BufNewFile",
  "BufRead", "BufReadPost", "BufReadCmd", "BufReadPre", "BufUnload",
  "BufWinEnter", "BufWinLeave", "BufWipeout", "BufWrite", "BufWritePre",
  "BufWriteCmd", "BufWritePost", "ChanInfo", "ChanOpen", "CmdUndefined",
  "CmdlineChanged", "CmdlineEnter", "CmdlineLeave", "CmdwinEnter", "CmdwinLeave",
  "ColorScheme", "ColorSchemePre", "CompleteChanged", "CompleteDonePre", "CompleteDone",
  "CursorHold", "CursorHoldI", "CursorMoved", "CursorMovedI", "DiffUpdated",
  "DirChanged", "DirChangedPre", "ExitPre", "FileAppendCmd", "FileAppendPost",
  "FileAppendPre", "FileChangedRO", "FileChangedShell", "FileChangedShellPost", "FileReadCmd",
  "FileReadPost", "FileReadPre", "FileType", "FileWriteCmd", "FileWritePost",
  "FileWritePre", "FilterReadPost", "FilterReadPre", "FilterWritePost", "FilterWritePre",
  "FocusGained", "FocusLost", "FuncUndefined", "UIEnter", "UILeave",
  "InsertChange", "InsertCharPre", "InsertEnter", "InsertLeavePre", "InsertLeave",
  "MenuPopup", "ModeChanged", "OptionSet", "QuickFixCmdPre", "QuickFixCmdPost",
  "QuitPre", "RemoteReply", "SearchWrapped", "RecordingEnter", "RecordingLeave",
  "SessionLoadPost", "ShellCmdPost", "Signal", "ShellFilterPost", "SourcePre",
  "SourcePost", "SourceCmd", "SpellFileMissing", "StdinReadPost", "StdinReadPre",
  "SwapExists", "Syntax", "TabEnter", "TabLeave", "TabNew",
  "TabNewEntered", "TabClosed", "TermOpen", "TermEnter", "TermLeave",
  "TermClose", "TermResponse", "TextChanged", "TextChangedI", "TextChangedP",
  "TextChangedT", "TextYankPost", "VimEnter", "VimLeave", "VimLeavePre",
  "VimResized", "VimResume", "VimSuspend", "WinClosed", "WinEnter",
  "WinLeave", "WinNew", "WinScrolled", "WinResized",
}, {
  callback = function(ev)
    vim.fn.writefile({ string.format("%-4d(%-20s) - %s", ev.buf, ev.event, ev.file) }, file, 'a')
  end,
})
