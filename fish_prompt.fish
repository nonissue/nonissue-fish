# name: nonissue
# BASED ON KRISLEECH & BOBTHEFISH

function __nonissue_colors -S -a color_scheme -d 'Define colors used by nonissue'

  switch "$color_scheme"
    case 'spacedust'
      # Based on spacedust terminal theme
      # Minor adjustments, not exact
      # Not all colors listed are used! I'm keeping them here 
      # as a sketch so I know what else I have to implement

      # generics
      set -x grey       cccccc 999999 333333
      set -x white      ffffff
      set -x black      111111 # i dont want actual black tbh
      set -l ruby_red af0000

      # spacedust colors
      set -x dust_blue 0E558C
      set -x dust_bright_blue 1587DF
      set -x dust_green 3D8479
      set -x dust_bright_green 52B2A3
      set -x dust_grey 839496
      set -x dust_black 07171B
      set -x dust_bright_black 6E767B
      set -x dust_bright_white E5E5E5
      set -x dust_bright_magneta FF9446
      set -x dust_bright_yellow FFD56D
      set -x dust_red EB7000
      set -x dust_redalt BC4B01
      set -x dust_bright_red EC5E01
      
      # only combos i use
      
      set -x non_repo_bg_dirty              $grey[1] $dust_red
      set -x non_repo_bg_clean              $dust_bright_blue $white --bold
      set -x non_segment_exit               $grey[3] $grey[1]

      # the rest
      set -x color_initial_segment_exit     $grey[3] $grey[1]
      set -x color_initial_segment_su       $white $green[2] --bold
      set -x color_initial_segment_jobs     $white $blue[3] --bold
      
      set -x color_path                     $grey[3] $grey[2]
      set -x color_path_basename            $grey[3] $white --bold
      set -x color_path_nowrite             $red[3] $red[1]
      set -x color_path_nowrite_basename    $red[3] $red[1] --bold

      set -x color_repo                     $green[1] $green[3]
      set -x color_repo_work_tree           $grey[3] $white --bold
      set -x color_repo_dirty               $red[2] $white
      set -x color_repo_staged              $orange[1] $orange[3]

      set -x color_vi_mode_default          $grey[2] $grey[3] --bold
      set -x color_vi_mode_insert           $green[2] $grey[3] --bold
      set -x color_vi_mode_visual           $orange[1] $orange[3] --bold

      set -x color_k8s                      $green[2] $white --bold
      set -x color_username                 $grey[1] $blue[3] --bold
      set -x color_hostname                 $grey[1] $blue[3]
      set -x color_virtualfish              $blue[2] $grey[1] --bold
  end
end

# almost entirely copied from bobthefish
# some minor adjustments
# NOTE: ONLY A FEW GLYPHS ARE CURRENTLY USED
# I plan to implement the rest soon
# I am keeping them here as a sketch of what I have to do
function __nonissue_glyphs -S -d 'Define glyphs used by nonissue'

  set -x branch_glyph            \uF418 # different branch glyph
  set -x right_black_arrow_glyph \uE0B0
  set -x right_arrow_glyph       \uE0B1
  set -x left_black_arrow_glyph  \uE0B2
  set -x left_arrow_glyph        \uE0B3

  set -x dirty_gylph             \uF055
  set -x clean_glyph             \uF058

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
  # Desk glyphs

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


# copied from bobthefish
# function to print our separator and set BG if we wish
function __nonissue_start_segment -S -d 'Start a prompt segment'
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

# copied from bobthefish
# closes our segments
# changes prompt back to default terminal background color
# as we have changed it in the process of setting our custom bgs
function __nonissue_finish_segments -S -d 'Close open prompt segments'
  if [ -n "$__noissue_current_bg" ]
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

# simple function to get git branch name
# taken from krisleech
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

# simple function to check if git repo is dirty
# taken from krisleech
function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt -d 'nonissue, a mod of several existing themes'
  echo ' '
  # Save the last status for later (do this before the `set` calls below)
  set -l last_status $status
  set -x theme_color_scheme spacedust

  __nonissue_glyphs
  __nonissue_colors spacedust

  type -q nonissue_colors
    and nonissue_colors

  set -l __nonissue_current_bg

  set -l cwd (basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info " $branch_glyph $git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty $dirty_gylph
      set git_info "$git_info $dirty"
    else if [ ~(_is_git_dirty) ]
      set -l clean $clean_glyph
      set git_info "$git_info $clean"
    end
  end

  __nonissue_start_segment $dust_redalt $white
  echo -n -s $cwd  ' '
  
  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ] 
      __nonissue_start_segment normal $dust_bright_yellow
      set -x end_sep $dust_bright_yellow
      echo -n -s $git_info
      echo -n '  '
    else if [ ~(_is_git_dirty) ]
      __nonissue_start_segment normal $dust_bright_green
      set -x end_sep $dust_bright_green
      echo -n -s $git_info
      echo -n '  '
    end
  end

  __nonissue_start_segment normal $end_sep
  set color normal
  echo -n ' '
  
  
  # set -l colors 333 666 aaa 
  # for color in $colors
  #   echo -n (set_color $color)">"
  # end
  

end
