# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# source ~/.config/nu/fnm.nu
use ~/.config/nu/git-aliases.nu *

$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
$env.config.table.mode = 'light'

$env.PROMPT_COMMAND = { ||
    mut cwd = $"(ansi blue)($env.PWD | path basename)"
    mut git = ""
    
    let branch = do { git branch --show-current } | complete
    if $branch.exit_code == 0 and ($branch.stdout | is-not-empty) {
        $git = $"(ansi white)\(\u{eafe} ($branch.stdout | str trim)\)(ansi reset)"
        let root = do { git rev-parse --show-toplevel } | complete
        if $root.exit_code == 0 and ($root.stdout | is-not-empty) {
            $cwd = if ($root.stdout | path expand | str trim) == $env.PWD { 
                $root.stdout | path basename | str trim
            } else {
                [
                    ($root.stdout | path basename | str trim)
                    ($env.PWD | path relative-to ($root.stdout | str trim | path expand))
                ] | path join
            }
        }
    }
    
    [ $cwd $git (char nl) ] | where {|x| $x | is-not-empty } | str join " "
}

$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
