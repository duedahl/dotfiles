# Nushell Config File
# ==================
# Version: 0.88.0 or higher

# General Settings
# ----------------
$env.config = {
  show_banner: false                  # Hide the welcome banner
  ls: {
    use_ls_colors: true               # Use the LS_COLORS environment variable
    clickable_links: true             # Enable clickable links in terminal
  }
  rm: {
    always_trash: true                # Use system trash instead of permanently deleting
  }
  completions: {
    case_sensitive: false             # Case-insensitive completions
    quick: true                       # Show completions immediately without tab
    partial: true                     # Enable partial matching
    algorithm: "prefix"               # "prefix" or "fuzzy"
  }
  buffer_editor: "nvim"               # Set your preferred editor
  use_ansi_coloring: true
  edit_mode: emacs                    # emacs or vi
  render_right_prompt_on_last_line: false
}

# Environment Variables
# --------------------
$env.PATH = ($env.PATH | split row (char esep) | append [
  "~/.local/bin"
  "~/bin"
])

# Set preferred editor
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

# Aliases
# -------

# Common tools and shortcuts
alias vi = nvim
alias vim = nvim
alias edit = nvim
alias c = clear
alias h = history
alias ports = netstat -tulanp

# Modern replacements (if installed)
if (which exa | is-not-empty) { alias ls = exa --icons --git }
if (which bat | is-not-empty) { alias cat = bat --style=plain }
if (which fd | is-not-empty) { alias find = fd }
if (which rg | is-not-empty) { alias grep = rg }
if (which btm | is-not-empty) { alias top = btm }
if (which zoxide | is-not-empty) { 
  # Initialize zoxide (smart cd)
  zoxide init nushell | save -f ~/.zoxide.nu
}

# Helper functions
# ---------------
def extract [file: path] {
  match $file {
    $file if ($file | str ends-with '.tar.bz2') => { tar xjf $file }
    $file if ($file | str ends-with '.tar.gz') => { tar xzf $file }
    $file if ($file | str ends-with '.bz2') => { bunzip2 $file }
    $file if ($file | str ends-with '.rar') => { unrar x $file }
    $file if ($file | str ends-with '.gz') => { gunzip $file }
    $file if ($file | str ends-with '.tar') => { tar xf $file }
    $file if ($file | str ends-with '.tbz2') => { tar xjf $file }
    $file if ($file | str ends-with '.tgz') => { tar xzf $file }
    $file if ($file | str ends-with '.zip') => { unzip $file }
    $file if ($file | str ends-with '.Z') => { uncompress $file }
    $file if ($file | str ends-with '.7z') => { 7z x $file }
    _ => { echo $"Sorry, I don't know how to extract ($file)" }
  }
}


# Set Prompt
# ----------
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
