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

下面的内容就是列举了一些常用的Git命令和小技巧，参考[tips](https://github.com/git-tips/tips)项目，和廖雪峰老师的[git网站](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)。

[TOC]



## 生成SSH秘钥

### 配置
```sh
$ git config –global user.name "username"  #你的昵称

$ git config –global user.email "email@address.com"  #你的邮箱
```

### 生成秘钥
```sh
$ ssh-keygen -t rsa -C "email@address.com"  #上面的邮箱
```

## 删除全局设置
```sh
$ git config --global --unset <entry-name>
```

## 展示帮助信息
```sh
$ git help -g
```

## clone项目
```sh
$ git clone https://github.com/user/repo.git  # Use HTTPS
$ git clone git@github.com:user/repo.git  # Use SSH
```

## clone下来指定的单一分支
```sh
$ git clone -b <branch-name> --single-branch https://github.com/user/repo.git
```

## 添加暂存区
```sh
#把工作时的所有变化提交到暂存区
$ git add .   

#更新已经提交到暂存区的文件（git add --update的缩写）
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
$ git log
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
和revert的区别是：reset命令会抹去某个commit id之后的所有commit
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

## commit历史中显示Branch1有的，但是Branch2没有commit
```sh
$ git log Branch1 ^Branch2
```

## 在commit log中显示GPG签名
```sh
$ git log --show-signature
```

## 展示简化的commit历史
```sh
$ git log --pretty=oneline --graph --decorate --all
```

## 查看commit历史
```sh
$ git log
```

## 在commit log中查找相关内容
```sh
#通过grep查找，given-text：所需要查找的字段
$ git log --all --grep='<given-text>'
```

## 快速切换分支
```sh
$ git checkout - #分支名
```

## 删除已经合并到master的分支
```sh
$ git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d
```

## 展示本地分支关联远程仓库的情况
```sh
$ git branch -vv
```

## 关联远程分支
关联远程分支之后，使用`git branch -vv`就可以展示关联的远程分支名
同时推送到远程仓库直接使用：`git push`，就不需要指定远程仓库了
```sh
$ git branch -u origin/mybranch #分支名
```

或者在push的时候加上`-u`参数
```sh
$ git push origin/mybranch -u
```

## 列出所有远程分支
```sh
$ git branch -r #-r参数相当于：--remote
```

## 列出本地和远程分支
```sh
$ git branch -a #-a参数相当于：--all
```

## 创建并切换到本地分支
```sh
$ git checkout -b <branch-name>
```

## 创建并切换到远程分支
```sh
$ git checkout -b <branch-name> origin/<branch-name>
```

## 删除本地分支
```sh
$ git branch -d <local-branchname>
```

## 删除远程分支
```sh
$ git push origin --delete <remote-branchname>
```

或者  
```sh
$ git push origin :<remote-branchname>
```

## 重命名本地分支
```sh
$ git branch -m <new-branch-name>
```

## 展示任意分支某一文件的内容
```sh
$ git show <branch-name>:<file-name>
```

## 查看标签
```sh
$ git tag #查看所有标签

#展示当前分支的最近的tag
$ git describe --tags --abbrev=0 #没有标签会提示fatal: No names found, cannot describe anything.
```

## 本地创建标签
```sh
$ git tag <version-number> #如v1.0

#默认tag是打在最近的一次commit上，如果需要指定commit打tag
$ git tag -a <version-number> -m "v1.0 发布(描述)" <commit-id> #commit-id可忽略
```

## 推送标签到远程仓库
```sh
#要保证本地创建好了标签才可以推送标签到远程仓库：
$ git push origin <local-version-number>

#一次性推送所有标签，同步到远程仓库：
$ git push origin --tags
```

## 删除本地标签
```sh
$ git tag -d <tag-name>
```

## 删除远程标签
```sh
#删除远程标签需要先删除本地标签，然后再执行下面的命令：
$ git push origin :refs/tags/<tag-name>
```

## 切回到某个标签
一般上线之前都会打tag，就是为了防止上线后出现问题，方便快速回退到上一版本
```sh
#下面的命令是回到某一标签下的状态：
$ git checkout -b <branch-name> <tag-name> #分支名 #标签名
```

## 放弃工作区的修改
```sh
$ git checkout -- <file-name>

#放弃所有的修改
$ git checkout .
```

## 放弃已经提交到暂存区的
```sh
$ git reset HEAD <file-name>
```

## 删除文件
```sh
$ rm <file-name> #只删除工作区的文件

$ git rm <file-name> #删除暂存区中的文件

$ git rm -f <file-name> #同时删除工作区和暂存区中的文件

$ git rm --cached <file-name> #删除暂存区的文件，不删除工作区的文件
```

## 查看某段代码是谁写的
```sh
$ git blame <file-name>
```

## 显示本地执行过git命令
```
$ git reflog
```

## 修改作者名
```sh
$ git commit --amend --author='Author Name <email@address.com>'
```

## 修改远程仓库的url
```sh
$ git remote set-url origin <URL>
```

## 增加远程仓库
```sh
$ git remote add origin <remote-url>
```

## 列出所有远程仓库
```sh
$ git remote
```

## 从远程仓库根据ID，拉下某一状态，到本地分支
```sh
$ git fetch origin pull/<id>/head:<branch-name>
```

## 查看两个星期内的改动
```sh
$ git whatchanged --since='2 weeks ago'
```

## 把A分支的某一个commit，放到B分支上
```sh
$ git checkout <branch-name> && git cherry-pick <commit-id>
```

## 新建并切换到新分支上，同时这个分支没有任何commit
```sh
#相当于保存修改，但是重写commit历史
$ git checkout --orphan <branch-name>
```

## 给git命令起别名
```sh
$ git config --global alias.<handle> <command>

#比如：git status 改成 git st
$ git config --global alias.st status
```

## 存储当前的修改，但不用提交commit
```sh
$ git stash
```

## 保存当前状态，包括untracked的文件
```sh
$ git stash -u
```

## 展示所有stashes
```sh
$ git stash list
```

## 回到某个stash的状态
```sh
$ git stash apply <stash@{n}>
```

## 回到最后一个stash的状态，并删除这个stash
```sh
$ git stash pop
```

## 删除所有的stash
```sh
$ git stash clear
```

## 从stash中拿出某个文件的修改
```sh
$ git checkout <stash@{n}> -- <file-path>
```

## 展示所有tracked的文件
```sh
$ git ls-files -t
```

## 展示所有untracked的文件
```sh
$ git ls-files --others
```

## 展示所有忽略的文件
```sh
$ git ls-files --others -i --exclude-standard
```

## 强制删除untracked的文件
```sh
#可以用来删除新建的文件。如果不指定文件文件名，则清空所有工作的untracked文件
$ git clean <file-name> -f
```

## 强制删除untracked的目录
```sh
#可以用来删除新建的目录，这个命令也可以用来删除untracked的文件
$ git clean <directory-name> -df
```

## 把某一个分支到导出成一个文件
```sh
$ git bundle create <file> <branch-name>
```

## 从包中导入分支
```sh
#新建一个分支，分支内容就是上面bundle create命令导出的内容
$ git clone repo.bundle <repo-dir> -b <branch-name>
```

## 执行rebase之前自动stash
```sh
$ git rebase --autostash
```

## 详细展示一行中的修改
```sh
$ git diff --word-diff
```

## 清除gitignore文件中记录的文件
```sh
$ git clean -X -f
```

## 展示所有alias和configs
```sh
#默认为当前目录的config
$ git config --local --list (当前目录)
$ git config --global --list (全局)
```

## 展示忽略的文件
```sh
$ git status --ignored
```

## 忽略某个文件的改动
```sh
#关闭 track 指定文件的改动，也就是 Git 将不会在记录这个文件的改动
$ git update-index --assume-unchanged path/to/file

#恢复 track 指定文件的改动
$ git update-index --no-assume-unchanged path/to/file
```

## 忽略文件的权限变化
```sh
#不再将文件的权限变化视作改动
$ git config core.fileMode false
```

## 以最后提交的顺序列出所有Git分支
```sh
# 最新的放在最上面   
$ git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/
```

## 把暂存区的指定文件放到工作区中
```sh
#不添加参数，默认是-mixed
$ git reset <file-name>
```

## 强制推送
```sh
$ git push -f <remote-name> <branch-name>
```

**[⬆ 返回顶部](#目录)**
