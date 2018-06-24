# name: nonissue
# BASED ON KRISLEECH
# Functions taken from bobthefish

function __nonissue_colors -S -a color_scheme -d 'Define colors used by nonissue'
  switch "$color_scheme"
    case 'user'
      __nonissue_user_color_scheme_deprecated
      return

    case 'nonissue_colors1'
      set -l colorfg white
      [ "$color_scheme" = 'terminal-dark-white' ]; and set colorfg white
      set -x color_initial_segment_exit     white red --bold
      set -x color_initial_segment_su       white green --bold
      set -x color_initial_segment_jobs     white blue --bold

      set -x color_path                     white white
      set -x color_path_basename            white white --bold
      set -x color_path_nowrite             black $colorfg
      set -x color_path_nowrite_basename    magenta $colorfg --bold

      set -x color_repo                     green $colorfg
      set -x color_repo_work_tree           black $colorfg --bold
      set -x color_repo_dirty               brred $colorfg
      set -x color_repo_staged              yellow $colorfg

      set -x color_vi_mode_default          brblue $colorfg --bold
      set -x color_vi_mode_insert           brgreen $colorfg --bold
      set -x color_vi_mode_visual           bryellow $colorfg --bold

      set -x color_vagrant                  brcyan $colorfg
      set -x color_k8s                      magenta white --bold
      set -x color_username                 white black --bold
      set -x color_hostname                 white black
      set -x color_rvm                      brmagenta $colorfg --bold
      set -x color_virtualfish              brblue $colorfg --bold
      set -x color_virtualgo                brblue $colorfg --bold
      set -x color_desk                     brblue $colorfg --bold
    case 'nonissue_colors' # default dark theme
      #               light  medium dark
      #               ------ ------ ------
      set -l red      cc9999 ce000f 660000
      set -l green    addc10 189303 0c4801
      set -l blue     48b4fb 005faf 255e87
      set -l orange   f6b117 unused 3a2a03
      set -l brown    bf5e00 803f00 4d2600
      set -l grey     cccccc 999999 333333
      set -l white    ffffff
      set -l black    000000
      set -l ruby_red af0000
      set -l go_blue  00d7d7 --bold

      # set -x color_initial_segment_exit     $white $red[2] --bold
      set -x color_initial_segment_su       $white $green[2] --bold
      set -x color_initial_segment_jobs     $white $blue[3] --bold

      set -x color_path                     $grey[3] $grey[2]
      # set -x color_path_basename            $grey[3] $white --bold
      set -x color_path_nowrite             $red[3] $red[1]
      set -x color_path_nowrite_basename    $red[3] $red[1] --bold

      set -x color_repo                     $green[1] $green[3]
      set -x color_repo_work_tree           $grey[3] $white --bold
      set -x color_repo_dirty               $red[2] $white
      set -x color_repo_staged              $orange[1] $orange[3]

      set -x color_vi_mode_default          $grey[2] $grey[3] --bold
      set -x color_vi_mode_insert           $green[2] $grey[3] --bold
      set -x color_vi_mode_visual           $orange[1] $orange[3] --bold

      set -x color_vagrant                  $blue[1] $white --bold
      set -x color_k8s                      $green[2] $white --bold
      set -x color_username                 $grey[1] $blue[3] --bold
      set -x color_hostname                 $grey[1] $blue[3]
      set -x color_rvm                      $ruby_red $grey[1] --bold
      set -x color_virtualfish              $blue[2] $grey[1] --bold
      set -x color_virtualgo                $go_blue $black --bold
      set -x color_desk                     $blue[2] $grey[1] --bold
  end
end

function __nonissue_glyphs -S -d 'Define glyphs used by nonissue'
  # Powerline glyphs
  set -x branch_glyph            \uE0A0
  set -x right_black_arrow_glyph \uE0B0
  set -x right_arrow_glyph       \uE0B1
  set -x left_black_arrow_glyph  \uE0B2
  set -x left_arrow_glyph        \uE0B3

  # Additional glyphs
  set -x detached_glyph          \u27A6
  set -x tag_glyph               \u2302
  set -x nonzero_exit_glyph      '! '
  set -x superuser_glyph         '$ '
  set -x bg_job_glyph            '% '
  set -x hg_glyph                \u263F

  # Python glyphs
  set -x superscript_glyph       \u00B9 \u00B2 \u00B3
  set -x virtualenv_glyph        \u25F0
  set -x pypy_glyph              \u1D56

  set -x ruby_glyph              ''
  set -x go_glyph                ''

  # Desk glyphs
  set -x desk_glyph              \u25F2

  # Vagrant glyphs
  set -x vagrant_running_glyph   \u2191 # ↑ 'running'
  set -x vagrant_poweroff_glyph  \u2193 # ↓ 'poweroff'
  set -x vagrant_aborted_glyph   \u2715 # ✕ 'aborted'
  set -x vagrant_saved_glyph     \u21E1 # ⇡ 'saved'
  set -x vagrant_stopping_glyph  \u21E3 # ⇣ 'stopping'
  set -x vagrant_unknown_glyph   '!'    # strange cases

  # Git glyphs
  set -x git_dirty_glyph      '*'
  set -x git_staged_glyph     '~'
  set -x git_stashed_glyph    '$'
  set -x git_untracked_glyph  '…'
  set -x git_ahead_glyph      \u2191 # '↑'
  set -x git_behind_glyph     \u2193 # '↓'
  set -x git_plus_glyph       '+'
  set -x git_minus_glyph      '-'
  set -x git_plus_minus_glyph '±'

  # Disable Powerline fonts
  if [ "$theme_powerline_fonts" = "no" ]
    set branch_glyph            \u2387
    set right_black_arrow_glyph ''
    set right_arrow_glyph       ''
    set left_black_arrow_glyph  ''
    set left_arrow_glyph        ''
  end

  # Use prettier Nerd Fonts glyphs
  if [ "$theme_nerd_fonts" = "yes" ]
    set branch_glyph     \uF418
    set detached_glyph   \uF417
    set tag_glyph        \uF412

    set virtualenv_glyph \uE73C ' '
    set ruby_glyph       \uE791 ' '
    set go_glyph         \uE626 ' '

    set vagrant_running_glyph  \uF431 # ↑ 'running'
    set vagrant_poweroff_glyph \uF433 # ↓ 'poweroff'
    set vagrant_aborted_glyph  \uF468 # ✕ 'aborted'
    set vagrant_unknown_glyph  \uF421 # strange cases

    set git_dirty_glyph      \uF448 '' # nf-oct-pencil
    set git_staged_glyph     \uF0C7 '' # nf-fa-save
    set git_stashed_glyph    \uF0C6 '' # nf-fa-paperclip
    set git_untracked_glyph  \uF128 '' # nf-fa-question
    # set git_untracked_glyph  \uF141 '' # nf-fa-ellipsis_h

    set git_ahead_glyph      \uF47B # nf-oct-chevron_up
    set git_behind_glyph     \uF47C # nf-oct-chevron_down

    set git_plus_glyph       \uF0DE # fa-sort-asc
    set git_minus_glyph      \uF0DD # fa-sort-desc
    set git_plus_minus_glyph \uF0DC # fa-sort
  end

  # Avoid ambiguous glyphs
  if [ "$theme_avoid_ambiguous_glyphs" = "yes" ]
    set git_untracked_glyph '...'
  end
end

function __nonissue_start_segment -S -d 'Start a prompt segment'
  # taken from bobthefish
  set -l bg $argv[1]
  set -e argv[1]
  set -l fg $argv[1]
  set -e argv[1]

  set_color normal # clear out anything bold or underline...
  set_color -b $bg $fg $argv

  switch "$__nonissue_current_bg"
    case ''
      # If there's no background, just start one
      echo -n ' '
    case "$bg"
      # If the background is already the same color, draw a separator
      echo -ns $right_arrow_glyph ' '
    case '*'
      # otherwise, draw the end of the previous segment and the start of the next
      set_color $__nonissue_current_bg
      echo -ns $right_black_arrow_glyph ' '
      set_color $fg $argv
  end

  set __nonissue_current_bg $bg
end

function __nonissue_finish_segments -S -d 'Close open prompt segments'
  if [ -n "$__nonissue_current_bg" ]
    set_color normal
    set_color $__nonissue_current_bg
    echo -ns $right_black_arrow_glyph ' '
  end

  if [ "$theme_newline_cursor" = 'yes' ]
    echo -ens "\n"
    set_color $fish_color_autosuggestion
    if [ "$theme_powerline_fonts" = "no" ]
      echo -ns '> '
    else
      echo -ns "$right_arrow_glyph "
    end
  else if [ "$theme_newline_cursor" = 'clean' ]
    echo -ens "\n"
  end

  set_color normal
  set __nonissue_current_bg
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end


function fish_prompt -d 'nonissue, a mod of several existing themes'
  # Save the last status for later (do this before the `set` calls below)
  set -l last_status $status

  __nonissue_glyphs
  __nonissue_colors nonissue_colors
  type -q nonissue_colors
    and nonissue_colors
  
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  # set -l normal (set_color normal)
  set -l darkgray (set_color -o 444)
  set -l medgray (set_color -o 666)
  set -l white (set_color -o fff)
  set -l offwhite (set_color -o fefefe)

  set -l cwd $offwhite ( basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    # __nonissue_start_segment eee
    set git_info "$branch_glyph $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty "$go_blue ◦ "
      set git_info "$git_info$dirty$red"
    else if [ ~(_is_git_dirty) ]
      set -l clean "$normal ● "
      set git_info " $go_blue$git_info$clean$normal"
    end
  end

  __nonissue_start_segment 2a2a2a
  echo -n -s $cwd '  '
  

  __nonissue_start_segment eee
  echo -n -s $git_info
  # echo -n -s $cwd $red '|' $git_info $normal ⇒ ' ' $normal
  # set -l colors 333 666 aaa 
#  set -l colors 600 900 c00
  # echo -n ' '
  # for color in $colors
  #   echo -n (set_color $color)">"
  # end
  __nonissue_finish_segments
  echo -n ' '
end
