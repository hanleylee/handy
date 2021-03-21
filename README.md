# Handy

An extremely light weight zsh prompt.

![himg](https://a.hanleylee.com/HKMS/2021-03-21102157.png?x-oss-process=style/WaMa)

## Install

1. [`zinit`](https://github.com/zdharma/zinit)

    Add following to your `$HOME/.zshrc`

    ```bash
    zinit light HanleyLee/Handy
    ```

2. [`oh-my-zsh`](https://github.com/ohmyzsh/ohmyzsh)

    Firstly, download repo to your local `$ZSH_CUSTOM` dir

    ```
    git clone https://github.com/HanleyLee/Handy ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/Handy
    ```

    Declare `$ZSH_THEME` inside your `$HOME/.zshrc`

    ```bash
    # $HOME/.zshrc
    ZSH_THEME="Handy" # 使用自定义主题
    ```

    Done!
