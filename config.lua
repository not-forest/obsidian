lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

lvim.plugins = {
    {
        "loctvl842/monokai-pro.nvim"
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    --[[ {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting=false,
                },
                ident = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }
            })
        end
    }, ]]
}

--Requires
--require("monokai-pro").setup {}

lvim.lsp.automatic_configuration.skipped_servers = { "vhdl_ls" }
require('lvim.lsp.manager').setup('vhdl_ls', {
    cmd = { "vhdl_ls" },
    settings = {
        vhdl_ls = {
            library_paths = {
                '/home/notforest/intelFPGA_lite/20.1/quartus/eda/sim_lib'
            }
        }
    }
})

--Color scheme
--lvim.colorscheme = "monokai-pro-default"
lvim.colorscheme = "vim"
lvim.transparent_window = true

-- Custom key binds
lvim.keys.normal_mode["<A-Up>"] = ":m .-2<CR>=="
lvim.keys.normal_mode["<A-Down>"] = ":m .+1<CR>=="
lvim.keys.visual_mode["<A-Down>"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["<A-Up>"] = ":m '<-2<CR>gv=gv"

lvim.keys.normal_mode["<A-Backspace>"] = "db"
lvim.keys.visual_mode["<A-Backspace>"] = "db"

lvim.builtin.treesitter.highlight.enabled = true

--Customs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.spell = true
vim.opt.guicursor = "n:block,i:block"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
vim.cmd("autocmd VimEnter * highlight Pmenu guibg=#4B0082")
vim.cmd("autocmd FileType vhdl setlocal keywordprg=:")
