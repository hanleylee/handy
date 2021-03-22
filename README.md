# Handy

An extremely light weight zsh prompt.

![himg](img/example.png)

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

## License

All codes in this warehouse are distributed and used based on [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0). For the full text of the agreement, see [LICENSE](https://github.com/HanleyLee/Handy/blob/main/LICENSE) file.

Copyright 2021 HanleyLee

---

Welcome, if you have any bugs, I hope to raise issues. If it is useful to you, please mark a star ⭐️
