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

Blog:[【GitHub Desktop】MacOS和Win下配置及简单的使用](http://www.cnblogs.com/SeekHit/p/6257451.html)

参考[tips](https://github.com/git-tips/tips)项目,和廖雪峰老师的[git网站](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)。

## Tips
### 添加暂存区
```sh
#把工作时的所有变化提交到暂存区，包括文件内容修改(modified)以及新文件(new)，但不包括被删除的文件。
$ git add .   

#仅监控已经被add的文件,不会提交新文件（untracked file）
$ git add -u

#是上面两个功能的合集（git add --all的缩写）
$ git add -A
```

### 本地仓库
```sh
$ git commit -m "描述"
```

### 提交远程仓库
```sh
$ git push
```

### 从远程仓库拉取
```sh
$ git pull
```

### 显示文件树形结构
```sh
$ tree /f		#指定tree使用字符而不是图形字符显示链接子目录的行
$ tree /a		#显示每个目录中的文件名
```

### 显示修改的文件
```sh
$ git log --name-only
```

### 撤销commit
先git log查看log信息
```sh
$ git log
```
在使用reset撤销
```sh
$ git reset --hard commitID
```

### 查看修改的内容
```sh
$ git diff
```

## 分支管理
### 创建+切换分支
创建`dev`分支，然后切换到`dev`分支
```sh
$ git checkout -b dev
```
等价于以下2条命令，创建并切换分支
```sh
$ git branch dev
$ git checkout dev
```
### 切换分支
切换到`master`分支
```sh
$ git checkout master
```
### 查看当前分支
`git branch`列出所有分支，当前分支用`*`标记
```sh
$ git branch
* dev
  master
```
### 合并某分支到当前分支
在master分支下，将dev分支合并过来
```sh
$ git merge dev
```

### 删除分支
合并完之后，可以选择删除分支
```sh
$ git branch -d dev
```
