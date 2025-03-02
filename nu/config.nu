# config.nu
#
# Installed by:
# version = "0.102.0"
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

source ./fnm.nu

$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
$env.config.table.mode = 'light'

$env.PROMPT_COMMAND = { ||
    let cwd = $"(ansi blue)($env.PWD | path basename)"
    let branch = do { git branch --show-current } | complete
    let git = if $branch.exit_code == 0 and ($branch.stdout | is-not-empty) {
        $"(ansi white)\(\u{eafe} ($branch.stdout | str trim)\)(ansi reset)"
    } else {
        ""
    }
    [ $cwd $git (char nl) ] | filter {|x| $x | is-not-empty } | str join " "
}

$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
