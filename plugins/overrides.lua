local M = {}

M.flutterTools = {
    config = function()
        require("flutter-tools").setup {
            ui = {
                border = "rounded",
                notification_style = "native"
            },
            decorations = {
                statusline = {
                    app_version = false,
                    device = true
                }
            },
            widget_guides = {
                enabled = true
            },
            closing_tags = {
                highlight = "ErrorMsg",
                prefix = "//",
                enabled = true
            },
            lsp = {
                color = {
                    enabled = false,
                    background = false,
                    foreground = false,
                    virtual_text = true,
                    virtual_text_str = "■"
                },
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    enableSnippets = true
                }
            },
            debugger = {
                enabled = true,
                run_via_dap = false
            }
            -- dev_log = {
            --   enabled = true,
            --   open_cmd = "tabedit", -- command to use to open the log buffer
            -- },
        }
    end
}

M.code_runner = {
    config = function()
        require("code_runner").setup {
            focus = false,
            filetype = {
                -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
                -- python = "python3 -u",
                -- typescript = "deno run",
                -- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
                dart = "dart $dir/$fileName",
                excluded_buftypes = {"message"}
            }
        }
    end
}

M.alpha = {
    after = "base46",
    disable = true,
    config = function()
        require "plugins.configs.alpha"
    end
}

M.wilder = {
    config = function()
        local wilder = require "wilder"
        wilder.setup {
            next_key = "<C-j>",
            accept_key = "<C-l>",
            reject_key = "<C-h>",
            previous_key = "<C-k>",
            modes = {":", "/", "?"}
        }
        wilder.set_option("renderer", wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme {
                pumblend = 20,
                border = "solid",
                highlights = {
                    border = "Normal"
                },
                highlighter = wilder.basic_highlighter(),
                left = {" ", wilder.popupmenu_devicons()}
            }))
    end
}

M.dap = {
    config = function()
        local dap = require "dap"

        dap.adapters.dart = {
            type = "executable",
            command = "dart",
            args = {"debug_adapter"}
        }
        dap.configurations.dart = {{
            type = "dart",
            request = "launch",
            name = "Launch Dart Program",
            program = "${file}",
            cwd = "${workspaceFolder}"
        }}
    end
}

M.focus = {
    config = function()
        require("focus").setup()
    end
}

M.null_ls = {
    config = function()
        local present, null_ls = pcall(require, "null-ls")

        if not present then
            return
        end

        local b = null_ls.builtins

        local sources = { -- webdev stuff
        b.formatting.deno_fmt, b.formatting.prettier, -- Lua
        b.formatting.stylua, -- Shell
        b.formatting.shfmt, b.diagnostics.shellcheck.with {
            diagnostics_format = "#{m} [#{c}]"
        }}

        null_ls.setup {
            debug = true,
            sources = sources
        }
    end
}

M.telescope = {
    cmd = "Telescope",
    config = function()
        require "plugins.configs.telescope"
        require("telescope").load_extension "ui-select"
        require("telescope").load_extension "file_browser"
        require("telescope").load_extension "luasnip"
    end,
    setup = function()
        require("core.utils").load_mappings "telescope"
    end
}

--[[ M.luasnip = {
  wants = "friendly-snippets",
  after = "nvim-cmp",
  config = function()
    require("plugins.configs.others").luasnip()
    require("luasnip.loaders.from_snipmate").load({ path = {"custom.snippets"}})
  end,
} ]]

return M
