require 'options'
require 'remapping'
require 'android'

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons';
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use {
			'editorconfig/editorconfig-vim',
			opt = true,
			event='BufEnter'
		}
    use { 
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function ()
				require'nvim-treesitter.configs'.setup {
						ensure_installed = {
							"javascript",
							"lua",
							"bash",
							"html",
							"typescript",
							"python",
							"dart",
							"css",
							"scss",
							"dockerfile",
							"rego"
						},
						auto_install = true,
						highlight = {
								enable = true,
						},
						indent = {
							 enable = true
						}
				}
			end
		}
    use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
    use 'sainnhe/sonokai'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
		use 'onsails/lspkind.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/cmp-vsnip'
		use 'hrsh7th/vim-vsnip'
		use 'hrsh7th/nvim-cmp'
		use 'mtdl9/vim-log-highlighting'
    use { 
	    'akinsho/flutter-tools.nvim',
	    branch = 'main',
	    opt = true,
	    config = function ()
				require("flutter-tools").setup{
					flutter_path='/usr/bin/flutter',
					widget_guides = {
							enabled = true,
					},
					debugger = {
						enabled = true,
						run_via_dap = true,
					},
					dev_log = {
					 open_cmd = 'tabedit'
					},
					decorations = {
						statusline = {
							-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
							-- this will show the current version of the flutter app from the pubspec.yaml file
							app_version = true,
							-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
							-- this will show the currently running device if an application was started with a specific
							-- device
							device = true,
						}
					},
					lsp = {
						settings = {
							dart = {
								enableSdkFormatter=true,
							}
						},
					},
				}
				require("telescope").load_extension("flutter")
	    end,
	    ft = 'dart'
    }
    use 'kyazdani42/nvim-tree.lua'
    use {
	    'janko/vim-test',
	    opt = true,
	    ft = 'test'
    }
    use 'folke/trouble.nvim'
    use {
			'mfussenegger/nvim-dap',
			opt = true,
			config = function()
				local dap = require('dap')

				dap.adapters.dart = {
					type = "executable",
					command = "node",
					args = {"/home/angel/Documents/Dart-Code/out/dist/debug.js", "flutter"}
				}

				dap.configurations.dart = {
					{
							type = "dart",
							request = "launch",
							name = "Launch flutter",
							dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/",
							flutterSdkPath = "/opt/flutter",
							program = "${workspaceFolder}/lib/main.dart",
							cwd = "${workspaceFolder}",
					}
				}
			end,
			ft={'dart'}
		}
    use {
	    'digitaltoad/vim-pug',
	    opt = true,
	    ft='pug'
    }
end)
local cmp = require'cmp'
local lspkind = require('lspkind')

vim.api.nvim_command("autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync(nil, 1000)")
vim.api.nvim_command("autocmd Filetype typescript setlocal ts=2 sw=2 noexpandtab")
vim.api.nvim_command("autocmd Filetype typescriptreact setlocal ts=2 sw=2 noexpandtab")
vim.api.nvim_command("syntax on")
vim.api.nvim_command("filetype plugin indent on")
vim.api.nvim_command("colorscheme sonokai")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
		},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	completion = {
    completeopt = "menu,noselect"
  },
	formatting = {
		fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	})
})

require("trouble").setup {}
require('telescope').setup{
	pickers = {
		find_files = {
			previewer = false,
		}
	},
   defaults = {
			 layout_config = {
				 prompt_position = 'top',
			 },
       sorting_strategy = 'ascending',
   },
}


require 'nvim-tree'.setup {
	actions = {
		open_file = {
			quit_on_open = true,
			resize_window = true,
		},
	},
	update_focused_file = {
		enable      = true,
	},
	git = {
		ignore = false,
	},
	diagnostics = {
    enable = true,
		show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
}

require('gitsigns').setup {
	current_line_blame = true,
	numhl = true,
}
