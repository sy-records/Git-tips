![](http://oo8jzybo8.bkt.clouddn.com/hello-github.jpg)

## GitHub介绍
GitHub 是为开发者提供 Git 仓库的托管服务。这是一个让开发者与朋友、同事、同学及陌生人共享代码的完美场所。总结一下，GitHub 最大的特征是“面向人”

Git是一个“**分布式版本管理工具**”，简单的理解版本管理工具：大家在写东西的时候都用过“回撤”这个功能，但是回撤只能回撤几步，假如想要找回我三天之前的修改，光用“回撤”是找不回来的。而“**版本管理工具**”能记录每次的修改，只要提交到版本仓库，你就可以找到之前任何时刻的状态（文本状态）。

* **统一概念**

    * 工作区：改动（增删文件和内容）
    * 暂存区：输入命令：`git add 改动的文件名`，此次改动就放到了‘暂存区’
    * 本地仓库(简称：本地)：输入命令：`git commit 此次修改的描述`，此次改动就放到了’本地仓库’，每个commit，我叫它为一个‘版本’。
    * 远程仓库(简称：远程)：输入命令：`git push 远程仓库`，此次改动就放到了‘远程仓库’（GitHub等)
    * 分支：Git鼓励你使用`branch`完成某个任务，合并后再删掉分支，过程更安全。
    * commit-id：输出命令：`git log`，最上面那行`commit xxxxxx`，后面的字符串就是commit-id


参考[tips](https://github.com/git-tips/tips)项目，和廖雪峰老师的[git网站](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)。

## 生成SSH秘钥
### 配置
```sh
$ git config –global user.name ‘username’  #你的昵称
$ git config –global user.email ‘username@domain.com’  #你的邮箱
```
### 生成秘钥
```sh
$ ssh-keygen -t rsa -C ‘username@domain.com'  #上面的邮箱
```

## 展示帮助信息
```sh
$ git help -g
```

## 添加暂存区
```sh
#把工作时的所有变化提交到暂存区，包括文件内容修改(modified)以及新文件(new)，但不包括被删除的文件。
$ git add .   

#仅监控已经被add的文件,不会提交新文件（untracked file）
$ git add -u

#是上面两个功能的合集（git add --all的缩写）
$ git add -A
```

## 提交本地仓库
```sh
$ git commit -m "描述"
```

## 提交远程仓库
```sh
$ git push
```

## 从远程仓库拉取
```sh
$ git pull
```

## 显示修改的文件
```sh
$ git log --name-only
```

## 撤销commit
```sh
#先git log查看log信息
$ git log

#在使用reset撤销
$ git reset --hard commitID
```

## 重设第一个commit
```sh
#也就是把所有的改动都重新放回工作区，并清空所有的commit，这样就可以重新提交第一个commit了
$ git update-ref -d HEAD
```

## 回到某一个commit的状态，并重新增加一个commit
```sh
$ git revert <commit-id>
```

## 回到某个commit的状态，并删除后面的commit
和revert的区别：reset命令会抹去某个commit id之后的所有commit
```sh
$ git reset <commit-id>  #默认就是-mixed参数。

$ git reset –mixed HEAD^  #回退至上个版本，它将重置HEAD到另外一个commit,并且重置暂存区以便和HEAD相匹配，但是也到此为止。工作区不会被更改。

$ git reset –soft HEAD~3  #回退至三个版本之前，只回退了commit的信息，暂存区和工作区与回退之前保持一致。如果还要提交，直接commit即可   

$ git reset –hard <commit-id>  #彻底回退到指定commit-id的状态，暂存区和工作区也会变为指定commit-id版本的内容
```

## 修改上一个commit的描述
```sh
$ git commit --amend
```

## 查看commit历史
```sh
$ git log
```