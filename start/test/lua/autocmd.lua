local file = require('plenary.path'):new(vim.g.boot_lua):parent():parent():parent():parent():joinpath('test.log').filename

vim.api.nvim_create_autocmd({ "BufAdd",               }, { callback = function() vim.fn.writefile({ 'BufAdd              ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufDelete",            }, { callback = function() vim.fn.writefile({ 'BufDelete           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufEnter",             }, { callback = function() vim.fn.writefile({ 'BufEnter            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufFilePost",          }, { callback = function() vim.fn.writefile({ 'BufFilePost         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufFilePre",           }, { callback = function() vim.fn.writefile({ 'BufFilePre          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufHidden",            }, { callback = function() vim.fn.writefile({ 'BufHidden           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufLeave",             }, { callback = function() vim.fn.writefile({ 'BufLeave            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufModifiedSet",       }, { callback = function() vim.fn.writefile({ 'BufModifiedSet      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufNew",               }, { callback = function() vim.fn.writefile({ 'BufNew              ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufNewFile",           }, { callback = function() vim.fn.writefile({ 'BufNewFile          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufRead",              }, { callback = function() vim.fn.writefile({ 'BufRead             ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufReadPost",          }, { callback = function() vim.fn.writefile({ 'BufReadPost         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufReadCmd",           }, { callback = function() vim.fn.writefile({ 'BufReadCmd          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufReadPre",           }, { callback = function() vim.fn.writefile({ 'BufReadPre          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufUnload",            }, { callback = function() vim.fn.writefile({ 'BufUnload           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWinEnter",          }, { callback = function() vim.fn.writefile({ 'BufWinEnter         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWinLeave",          }, { callback = function() vim.fn.writefile({ 'BufWinLeave         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWipeout",           }, { callback = function() vim.fn.writefile({ 'BufWipeout          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWrite",             }, { callback = function() vim.fn.writefile({ 'BufWrite            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWritePre",          }, { callback = function() vim.fn.writefile({ 'BufWritePre         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWriteCmd",          }, { callback = function() vim.fn.writefile({ 'BufWriteCmd         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "BufWritePost",         }, { callback = function() vim.fn.writefile({ 'BufWritePost        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ChanInfo",             }, { callback = function() vim.fn.writefile({ 'ChanInfo            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ChanOpen",             }, { callback = function() vim.fn.writefile({ 'ChanOpen            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CmdUndefined",         }, { callback = function() vim.fn.writefile({ 'CmdUndefined        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CmdlineChanged",       }, { callback = function() vim.fn.writefile({ 'CmdlineChanged      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CmdlineEnter",         }, { callback = function() vim.fn.writefile({ 'CmdlineEnter        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CmdlineLeave",         }, { callback = function() vim.fn.writefile({ 'CmdlineLeave        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CmdwinEnter",          }, { callback = function() vim.fn.writefile({ 'CmdwinEnter         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CmdwinLeave",          }, { callback = function() vim.fn.writefile({ 'CmdwinLeave         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ColorScheme",          }, { callback = function() vim.fn.writefile({ 'ColorScheme         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ColorSchemePre",       }, { callback = function() vim.fn.writefile({ 'ColorSchemePre      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CompleteChanged",      }, { callback = function() vim.fn.writefile({ 'CompleteChanged     ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CompleteDonePre",      }, { callback = function() vim.fn.writefile({ 'CompleteDonePre     ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CompleteDone",         }, { callback = function() vim.fn.writefile({ 'CompleteDone        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CursorHold",           }, { callback = function() vim.fn.writefile({ 'CursorHold          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CursorHoldI",          }, { callback = function() vim.fn.writefile({ 'CursorHoldI         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CursorMoved",          }, { callback = function() vim.fn.writefile({ 'CursorMoved         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "CursorMovedI",         }, { callback = function() vim.fn.writefile({ 'CursorMovedI        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "DiffUpdated",          }, { callback = function() vim.fn.writefile({ 'DiffUpdated         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "DirChanged",           }, { callback = function() vim.fn.writefile({ 'DirChanged          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "DirChangedPre",        }, { callback = function() vim.fn.writefile({ 'DirChangedPre       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ExitPre",              }, { callback = function() vim.fn.writefile({ 'ExitPre             ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileAppendCmd",        }, { callback = function() vim.fn.writefile({ 'FileAppendCmd       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileAppendPost",       }, { callback = function() vim.fn.writefile({ 'FileAppendPost      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileAppendPre",        }, { callback = function() vim.fn.writefile({ 'FileAppendPre       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileChangedRO",        }, { callback = function() vim.fn.writefile({ 'FileChangedRO       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileChangedShell",     }, { callback = function() vim.fn.writefile({ 'FileChangedShell    ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileChangedShellPost",},  { callback = function() vim.fn.writefile({ 'FileChangedShellPost' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileReadCmd",          }, { callback = function() vim.fn.writefile({ 'FileReadCmd         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileReadPost",         }, { callback = function() vim.fn.writefile({ 'FileReadPost        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileReadPre",          }, { callback = function() vim.fn.writefile({ 'FileReadPre         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileType",             }, { callback = function() vim.fn.writefile({ 'FileType            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileWriteCmd",         }, { callback = function() vim.fn.writefile({ 'FileWriteCmd        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileWritePost",        }, { callback = function() vim.fn.writefile({ 'FileWritePost       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FileWritePre",         }, { callback = function() vim.fn.writefile({ 'FileWritePre        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FilterReadPost",       }, { callback = function() vim.fn.writefile({ 'FilterReadPost      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FilterReadPre",        }, { callback = function() vim.fn.writefile({ 'FilterReadPre       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FilterWritePost",      }, { callback = function() vim.fn.writefile({ 'FilterWritePost     ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FilterWritePre",       }, { callback = function() vim.fn.writefile({ 'FilterWritePre      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FocusGained",          }, { callback = function() vim.fn.writefile({ 'FocusGained         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FocusLost",            }, { callback = function() vim.fn.writefile({ 'FocusLost           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "FuncUndefined",        }, { callback = function() vim.fn.writefile({ 'FuncUndefined       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "UIEnter",              }, { callback = function() vim.fn.writefile({ 'UIEnter             ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "UILeave",              }, { callback = function() vim.fn.writefile({ 'UILeave             ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "InsertChange",         }, { callback = function() vim.fn.writefile({ 'InsertChange        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "InsertCharPre",        }, { callback = function() vim.fn.writefile({ 'InsertCharPre       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "InsertEnter",          }, { callback = function() vim.fn.writefile({ 'InsertEnter         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "InsertLeavePre",       }, { callback = function() vim.fn.writefile({ 'InsertLeavePre      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "InsertLeave",          }, { callback = function() vim.fn.writefile({ 'InsertLeave         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "MenuPopup",            }, { callback = function() vim.fn.writefile({ 'MenuPopup           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ModeChanged",          }, { callback = function() vim.fn.writefile({ 'ModeChanged         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "OptionSet",            }, { callback = function() vim.fn.writefile({ 'OptionSet           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "QuickFixCmdPre",       }, { callback = function() vim.fn.writefile({ 'QuickFixCmdPre      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "QuickFixCmdPost",      }, { callback = function() vim.fn.writefile({ 'QuickFixCmdPost     ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "QuitPre",              }, { callback = function() vim.fn.writefile({ 'QuitPre             ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "RemoteReply",          }, { callback = function() vim.fn.writefile({ 'RemoteReply         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SearchWrapped",        }, { callback = function() vim.fn.writefile({ 'SearchWrapped       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "RecordingEnter",       }, { callback = function() vim.fn.writefile({ 'RecordingEnter      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "RecordingLeave",       }, { callback = function() vim.fn.writefile({ 'RecordingLeave      ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SessionLoadPost",      }, { callback = function() vim.fn.writefile({ 'SessionLoadPost     ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ShellCmdPost",         }, { callback = function() vim.fn.writefile({ 'ShellCmdPost        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "Signal",               }, { callback = function() vim.fn.writefile({ 'Signal              ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "ShellFilterPost",      }, { callback = function() vim.fn.writefile({ 'ShellFilterPost     ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SourcePre",            }, WinClosed{ callback = function() vim.fn.writefile({ 'SourcePre           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SourcePost",           }, { callback = function() vim.fn.writefile({ 'SourcePost          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SourceCmd",            }, { callback = function() vim.fn.writefile({ 'SourceCmd           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SpellFileMissing",     }, { callback = function() vim.fn.writefile({ 'SpellFileMissing    ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "StdinReadPost",        }, { callback = function() vim.fn.writefile({ 'StdinReadPost       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "StdinReadPre",         }, { callback = function() vim.fn.writefile({ 'StdinReadPre        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "SwapExists",           }, { callback = function() vim.fn.writefile({ 'SwapExists          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "Syntax",               }, { callback = function() vim.fn.writefile({ 'Syntax              ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TabEnter",             }, { callback = function() vim.fn.writefile({ 'TabEnter            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TabLeave",             }, { callback = function() vim.fn.writefile({ 'TabLeave            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TabNew",               }, { callback = function() vim.fn.writefile({ 'TabNew              ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TabNewEntered",        }, { callback = function() vim.fn.writefile({ 'TabNewEntered       ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TabClosed",            }, { callback = function() vim.fn.writefile({ 'TabClosed           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TermOpen",             }, { callback = function() vim.fn.writefile({ 'TermOpen            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TermEnter",            }, { callback = function() vim.fn.writefile({ 'TermEnter           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TermLeave",            }, { callback = function() vim.fn.writefile({ 'TermLeave           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TermClose",            }, { callback = function() vim.fn.writefile({ 'TermClose           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TermResponse",         }, { callback = function() vim.fn.writefile({ 'TermResponse        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TextChanged",          }, { callback = function() vim.fn.writefile({ 'TextChanged         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TextChangedI",         }, { callback = function() vim.fn.writefile({ 'TextChangedI        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TextChangedP",         }, { callback = function() vim.fn.writefile({ 'TextChangedP        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TextChangedT",         }, { callback = function() vim.fn.writefile({ 'TextChangedT        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "TextYankPost",         }, { callback = function() vim.fn.writefile({ 'TextYankPost        ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "VimEnter",             }, { callback = function() vim.fn.writefile({ 'VimEnter            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "VimLeave",             }, { callback = function() vim.fn.writefile({ 'VimLeave            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "VimLeavePre",          }, { callback = function() vim.fn.writefile({ 'VimLeavePre         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "VimResized",           }, { callback = function() vim.fn.writefile({ 'VimResized          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "VimResume",            }, { callback = function() vim.fn.writefile({ 'VimResume           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "VimSuspend",           }, { callback = function() vim.fn.writefile({ 'VimSuspend          ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "WinClosed",            }, { callback = function() vim.fn.writefile({ 'WinClosed           ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "WinEnter",             }, { callback = function() vim.fn.writefile({ 'WinEnter            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "WinLeave",             }, { callback = function() vim.fn.writefile({ 'WinLeave            ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "WinNew",               }, { callback = function() vim.fn.writefile({ 'WinNew              ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "WinScrolled",          }, { callback = function() vim.fn.writefile({ 'WinScrolled         ' }, file, 'a') end, })
vim.api.nvim_create_autocmd({ "WinResized",           }, { callback = function() vim.fn.writefile({ 'WinResized          ' }, file, 'a') end, })
