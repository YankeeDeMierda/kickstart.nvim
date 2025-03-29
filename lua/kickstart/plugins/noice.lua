return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
      lsp = {
        progress = {
          enabled = false,
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          --- @type NoiceFormat|string
          format = 'lsp_progress',
          --- @type NoiceFormat|string
          format_done = 'lsp_progress_done',
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = 'mini',
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- override the lsp markdown formatter with Noice
          ['vim.lsp.util.stylize_markdown'] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = false,
          silent = false, -- set to true to not show a message if hover is not available
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {}, -- merged with defaults from documentation
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = true,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = 'hover', -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {
            -- border = {
            --   style = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            -- },
            anchor = 'SE',
            relative = 'cursor',
            position = { row = 1, col = 0 },
            size = {
              width = 'auto',
              height = 'auto',
              max_height = 20,
              max_width = 120,
            },
            size = {
              width = '80%',
              height = 0.6,
            },
            focusable = false,
            win_options = {
              wrap = true,
              linebreak = true,
            },
          }, -- merged with defaults from documentation
        },
        message = {
          -- Messages shown by lsp servers
          enabled = false,
          view = 'notify',
          opts = {},
        },
        -- defaults for hover and signature help
        documentation = {
          view = 'hover',
          ---@type NoiceViewOptions
          opts = {
            lang = 'markdown',
            replace = true,
            render = 'plain',
            format = { '{message}' },
            win_options = { concealcursor = 'n', conceallevel = 3 },
          },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
}
