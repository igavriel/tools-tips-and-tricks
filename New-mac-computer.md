# Installing new Mac

This procedure describe how to install a new Mac laptop and configure it for python development

CLI Tools
=========

Brew
----
URL: https://brew.sh/

Paste that in a macOS Terminal or Linux shell prompt

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

oh-my-zsh
---------
URL: https://ohmyz.sh/#install

Paste that in a macOS Terminal or Linux shell prompt
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### plugins
URL: [Oh my ZSH with zsh-autosuggestions zsh-syntax-highlighting zsh-fast-syntax-highlighting and zsh-autocomplete.md](https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df)

Install zsh plugins from brew
```bash
# Install tools
brew install zsh-autosuggestions zsh-syntax-highlighting
#UBUNTU# sudo apt install zsh-autosuggestions zsh-syntax-highlighting
```

install plugins in zsh:

```bash
# Install plugins
## zsh-autosuggestions plugin
git clone --depth 1  https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

## zsh-syntax-highlighting plugin
git clone --depth 1  https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

## zsh-fast-syntax-highlighting plugin
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting

## zsh-autocomplete plugin
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
```

Enable plugins by adding them to .zshrc
```bash
vi ~/.zshrc
```

Find the line which says plugins=(git) and replace that line with

```bash
plugins=(git colored-man-pages colorize pip python brew kubectl docker zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)
```

run .zshrc

```bash
source ~/.zshrc
```

### Powerlevel10k

URL: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
Clone the repository:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Enable theme by adding them to .zshrc
vi ~/.zshrc
```

Find the line which says ZSH_THEME= and replace that line with
```bash
set ZSH_THEME="powerlevel10k/powerlevel10k"
```

Run configuration again
```bash
p10k configure
```

Other CLI tools
---------------

|__Tool__| Description |
|-|-|
|__mc__| Midnight commander |
|__vifm__| vi file manager |
|__tmux__| Terminal multiplexer |
|__ranger__| Visual file manager |
|__highlight__| A universal source code to formatted |text converter - good for ranger |
|__multitail__| Browse through several files at once |
|__colortail__| Log colorizer that makes log |checking easier|
|__htop__| Interactive process viewer |
|__nmon__| Benchmark tool |
|__bat__| batcat - source code formatted cat replacement |
|__fzf__| A command-line fuzzy finder - interactive find |
|__ripgrep__| rg - recursively search the current directory for lines matching a pattern |
|__tldr__| Simplified and community-driven man pages - man replacement |
|__exa__| A modern replacement for ls (ubuntu/debian, not on mac) |
|__lsd__| The next generation `ls` command, written in Rust. (mac) |
|__ncdu__| NCurses Disk Usage |
|__duf__| Disk Usage/Free Utility |
|__neofetch__| Display information about your operating system, software and hardware |
|__tig__| A text-mode interface for Git |

* Best ncurses linux console programs https://www.etcwiki.org/wiki/Best_ncurses_linux_console_programs
* Command line tools https://hackingcpp.com/dev/command_line_tools.html


links:

https://github.com/BubuAnabelas/awesome-markdown#readme


 ![Mac OS X][macosx] ![Linux][linux] ![Windows][windows]



https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/README.md
https://github.com/ekalinin/github-markdown-toc/blob/master/README.md