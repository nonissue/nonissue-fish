function fish_prompt_alt -d 'nonissue, a mod of several existing themes'
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
