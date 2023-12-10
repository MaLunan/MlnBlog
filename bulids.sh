#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# github
echo 'www.zmln1021.cn' > CNAME
git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/MaLunan/malunan.github.io.git HEAD:master # 发布到github

# coding
git push -f https://e.coding.net/g-galf6717/blog/malunan.coding.me.git HEAD:master # 发布到coding

cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist
