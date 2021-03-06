" A vimrc file containing what I consider to be a minamal amount of
" configuration to make vim more usable as well as my notes on what defines a
" good text editor and how vim fits the bill. I created this to step back and
" re-evaulate what I consider to be a 'good text editor' and to see how much
" configuration it takes for vim to get there.

" The Purpose Of A Text Editor:
" 1. Effective file management
" 2. Move efficiently within a file
" 3. Make quick edits

" What Makes A Great Editor:
" 1. Extensibility

" Programmers work with text much like painters work with paint and a text
" editor is our paintbrush. As programmers, our primary tasks invovle managing
" files, moving within specific files, and editing/writing code and as such
" any good text editor should have those three capabilities. If such an editor
" handles those three tasks well, it should be considered good. If it is also
" extensible then I would consider it great, or at least having the potential
" to become great because it can be molded to the task at hand.

" How Vim Stacks Up:

" File Management:
" Vanilla vim has some nice buffer managment capabilities. Splits can be used
" to view multiple files simultaneously, tabs can maintain different split
" layouts or allow us to work on different projects, and tab completion on
" existing buffers makes for quick buffer switching. So vim's file management
" is good, but I would say that vim helps little with keeping track of your
" open files, they just sort of sit there in a big lump. For a small number of
" files this is typically fine, but things get difficult when handling larger
" amounts. Doing something as simple as opening the 3rd file previously looked
" at is a pain at times. I even remember grep'ing for certain search terms
" again just to find the file I was looking for. Luckily a wonderful plugin,
" ctrlp, nicely fills this missing gap in vim's capabilities.

" Move Effectively Within A File:
" Vim's default mode is called 'Normal' mode and in that mode most key presses
" represent a different movement. This makes for quick file navigation because
" we can press single keys to move. For people accustomed to mouse based
" movement using soley the keyboard can feel restrictive, but getting used to
" it is worth it. Oftentimes a quick search gets you right where you need to
" go just as quickly as a mouse would and when you get to your desired
" location you're ready to type. Even when you miss your mark and take longer
" to get to a position than it would have taken with the mouse, that time is
" typically made up for by the fact that your hands never left the keyboard.
" Moving to an arbitrary place close to the cursor can still feel clunky
" because a full on search can feel like too much for such small movement, but
" there is another plugin called sneak.vim which fixes this minor issue.

" Make Quick Edits:
" Code has structure and programmers typically have to make some sort of
" structured change to it. Vim's core editing commands have a pattern to them
" which make quick work of such edits. That pattern is:

"     operator +  motion/text object

" An operator is something which will 'operate' on the text in some way.
" Examples are: copy, delete, change (remember vim is modal), comment
" (assuming a plugin is installed), etc... A 'motion' is any sort of motion
" you can perform (like moving by words). A 'text object' is a structured bit
" of text (like inside single quotes). So if you want to copy, 'y', everything
" inside '{' brackets, 'i{', then you type: yi{. If you instead want to
" delete, 'd', everything inside '{' then you type: di{. This editing model
" makes for quick changes to any sort of structured text.

" What Vim Is Missing:
" Plain old vanilla vim can stand on it's own (after a touch of configuring),
" but there are a couple pieces of functionality which, when added, make it
" shine a bit more:

" Essentials:
" I would consider these plugins (or something equivalent) on the essential
" side:

" 1. Manage Buffers - CtrlP
" As I said earlier, vim's buffer management leaves a bit to be desired. Two
" useful things this plugin provides is a list of buffers sorted by how
" recently they were viewed as well as a 'most recently used' file list which
" can re-open files from previous vim sessions.

" 2. Comment/Uncomment Code - commentary.vim
" Without a plugin, the most effective way to comment blocks of code is to use
" visual block mode, which is a tad clunky. commentary.vim provides an
" operator to comment code making the task quick and easy.

" 3. Package Manager - Pathogen
" You could manually put plugin files into the appropriate directories but
" this quickly gets tedious if you are frequently updating your list of
" plugins. So I consider this part of the 'essentials' list.

" Nice To Have:
" What is considered to be 'nice to have' could of course go on and on and
" on... This is what I have currently:

" 1. More text objects - targets.vim, indent text object, etc...
" More text objects means more code structures we can operate on.

" 2. More ways to move - sneak.vim, indentwise
" Getting where you need to in a file faster is always a plus.

" 3. Surround text with delimiters - surround.vim
" Damn convenient when you need it.

" 4. Align text - easy-align
" Also convenient when such a thing is needed.

" 5. Repeaing more commands with '.' - repeat.vim
" Kind of a utility plugin, it allows entire mappings to be repeated with the
" '.' command (after some configuring of course).

" 6. Colorschemes - solarized
" Colorschemes are always nice.

" Minmal Vim Config:
" What follows is my minamal vim configuration which makes vim more usable.

" Starting vim with the -u flag will start up vim instead of vi
set nocompatible
" File type detection, load file-type plugins, and load file-type indent files
filetype plugin indent on
" Turn on syntax highlighting
syntax enable
" Keep non-visible buffers loaded
set hidden
" Backspace behaves as you would expect
set backspace=indent,eol,start
" 8 spaces per tab is a bit too much in my opinion
set tabstop=4
" Highlight search matches
set hlsearch
" Highlight the search match as you type
set incsearch
" Show current file in status line
set laststatus=2
set statusline=
set statusline+=%f
" Poor man's buffer management
nnoremap gb :buffers<CR>:b<SPACE>
" Leave insert mode while keeping your hands on home row
inoremap jk <ESC>
" Recall previous commands but filter based on what you've typed so far
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
