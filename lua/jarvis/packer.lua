-- This file can be loaded bpy calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- use({
    --     'folke/tokyonight.nvim',
    --     as = 'tokyonight',
    --     config = function()
    --         vim.cmd('colorscheme tokyonight-night')
    --     end
    -- })
    use {
        "mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,   -- load before other plugins
        config = function()
            require("vscode").setup({
                style = "dark",             -- or "light"
                transparent = false,
                italic_comments = true,
                italic_inlayhints = true,
                underline_links = true,
                terminal_colors = true,
            })
            vim.cmd.colorscheme("vscode")
        end,
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('prettier/vim-prettier')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'mg979/vim-visual-multi' -- Add vim-visual-multi plugin
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)
