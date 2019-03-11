#!/bin/bash

cd $1;

case $2 in
    swoole)
        echo "This is the git used at work.";
        git config user.name ""
        git config user.email ""
        ;;
    github)
        echo "This is the git used at github.";
        git config user.name ""
        git config user.email ""
        ;;
    unset-all)
        # 删除全局
        git config --global --unset user.name
        git config --global --unset user.email
        ;;
    unset)
        # 删除指定目录下
        git config --unset user.name
        git config --unset user.email
        ;;
    *)
        echo "Usage: $0 yourpath {swoole|github|unset-all|unset}"
        exit;
        ;;
esac

echo "Done!"
