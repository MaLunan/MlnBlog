#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e


push_addr=https://github.com/MaLunan/malunan.github.io.git # git提交地址，也可以手动设置，比如：push_addr=git@github.com:xugaoyi/vuepress-theme-vdoing.git
commit_info=`git describe --all --always --long`
dist_path=docs/.vuepress/dist # 打包生成的文件夹路径
push_branch=master # 推送的分支

# 生成静态文件
npm run build

# 进入生成的文件夹
cd $dist_path

echo 'www.zmln1021.cn' > CNAME
git init
git add -A
git commit -m "deploy, $commit_info"
git push -f $push_addr HEAD:$push_branch

cd -
rm -rf $dist_path
