version 6.0
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <BS> v:lua.MiniPairs.bs()
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <C-W> u
inoremap <C-U> u
nnoremap  zz
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap  zz
nmap  d
nnoremap  e :Oil
nnoremap  gw :Gwrite
nnoremap  gb :Git blame
nnoremap  gd :Gdiffsplit
nnoremap  gp :Gitsigns preview_hunk
vnoremap  p "_dP
nnoremap  p "_dP
vnoremap  y "+y
nnoremap  y "+y
nnoremap  l :Lazy
nnoremap # #zz
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap * *zz
nnoremap - <Cmd>Oil
xnoremap <silent> <expr> @ mode() ==# 'V' ? ':normal! @'.getcharstr().'' : '@'
nnoremap G Gzz
vnoremap J :m '>+1gv=gv
vnoremap K :m '<-2gv=gv
nnoremap N Nzz
xnoremap <silent> <expr> Q mode() ==# 'V' ? ':normal! @=reg_recorded()' : 'Q'
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap g# g#zz
nnoremap g* g*zz
onoremap <silent> gc <Cmd>lua MiniComment.textobject()
nnoremap n nzz
onoremap s <Nop>
xnoremap s <Nop>
xnoremap <silent> sa :lua MiniSurround.add("visual")
nnoremap s <Nop>
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
nnoremap <C-U> zz
nnoremap <C-D> zz
nmap <C-W><C-D> d
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <silent> <expr>  v:lua.MiniPairs.cr()
inoremap  u
inoremap  u
inoremap <expr> " v:lua.MiniPairs.closeopen('""', "^[^\\]")
inoremap <expr> ' v:lua.MiniPairs.closeopen("''", "^[^%a\\]")
inoremap <expr> ( v:lua.MiniPairs.open("()", "^[^\\]")
inoremap <expr> ) v:lua.MiniPairs.close("()", "^[^\\]")
inoremap <expr> [ v:lua.MiniPairs.open("[]", "^[^\\]")
inoremap <expr> ] v:lua.MiniPairs.close("[]", "^[^\\]")
inoremap <expr> ` v:lua.MiniPairs.closeopen("``", "^[^\\]")
inoremap <expr> { v:lua.MiniPairs.open("{}", "^[^\\]")
inoremap <expr> } v:lua.MiniPairs.close("{}", "^[^\\]")
let &cpo=s:cpo_save
unlet s:cpo_save
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -uu\ 
set helplang=en
set nohlsearch
set noloadplugins
set packpath=/usr/share/nvim/runtime
set runtimepath=~/.config/cleanvim,~/.local/share/cleanvim/site,~/.local/share/cleanvim/lazy/lazy.nvim,~/.local/share/cleanvim/lazy/nvim,~/.local/share/cleanvim/lazy/themery.nvim,~/.local/share/cleanvim/lazy/vim-fugitive,~/.local/share/cleanvim/lazy/mini.statusline,~/.local/share/cleanvim/lazy/mini.pairs,~/.local/share/cleanvim/lazy/friendly-snippets,~/.local/share/cleanvim/lazy/blink.cmp,~/.local/share/cleanvim/lazy/gitsigns.nvim,~/.local/share/cleanvim/lazy/mini.comment,~/.local/share/cleanvim/lazy/mason.nvim,~/.local/share/cleanvim/lazy/nvim-lspconfig,~/.local/share/cleanvim/lazy/mason-lspconfig.nvim,~/.local/share/cleanvim/lazy/mini.ai,~/.local/share/cleanvim/lazy/none-ls.nvim,~/.local/share/cleanvim/lazy/mini.notify,~/.local/share/cleanvim/lazy/which-key.nvim,~/.local/share/cleanvim/lazy/mini.surround,~/.local/share/cleanvim/lazy/mini.icons,~/.local/share/cleanvim/lazy/oil.nvim,~/.local/share/cleanvim/lazy/nvim-treesitter,~/.local/share/cleanvim/lazy/telescope-fzf-native.nvim,~/.local/share/cleanvim/lazy/plenary.nvim,~/.local/share/cleanvim/lazy/telescope.nvim,/usr/share/nvim/runtime,/usr/share/nvim/runtime/pack/dist/opt/matchit,/usr/lib64/nvim,~/.local/state/cleanvim/lazy/readme,~/.local/share/cleanvim/lazy/nvim/after,~/.local/share/cleanvim/lazy/mason-lspconfig.nvim/after
set shiftwidth=4
set smartindent
set softtabstop=4
set statusline=%{%(nvim_get_current_win()==#g:actual_curwin\ ||\ &laststatus==3)\ ?\ v:lua.MiniStatusline.active()\ :\ v:lua.MiniStatusline.inactive()%}
set noswapfile
set tabstop=4
set termguicolors
set undofile
set window=41
" vim: set ft=vim :
