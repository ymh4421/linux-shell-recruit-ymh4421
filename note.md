
# 这是为焦糖工作室基础任务三的各个题目准备的完成过程

##task1 过程
- 用 cd workspace 进入目录
- 用 ls -la 看到 .project、project、src 三个文件夹，学会检索隐藏的文件夹
- 用 grep -r "PROJECT_ID"  找到 .project/metadata，内容是 PROJECT_ID=LSR-2026-0831，学会查找检索含有目标内容的文件
- 用 echo "LSR-2026-0831" > output/01_project_id.txt 写入编号
- 推断出 相对路径是 ../../.project/metadata，用 echo 写入 output/01_relative_path.txt
- 执行 ./check.sh 01，通过

## 学到的东西
- ls -la 看隐藏文件
- grep -r搜索特定内容
- echo "内容" > 文件 写入文件
- 相对路径：.. 是上一级目录

##task2 过程 
- 用 ls -l tools/ 查看权限，发现没有 x（执行权限）
- 用 ./tools/recruit-info 尝试运行，报错 Permission denied
- 用 chmod +x tools/recruit-info 加上执行权限
- 再次运行 ./tools/recruit-info，成功输出信息
- 用 echo $PATH 查看 PATH，发现里面没有 tools/ 目录
- 用 export PATH="$PATH:$(pwd)/tools" 把 tools/ 加到 PATH 里
- 之后直接输入 recruit-info 也能运行了

## 学到的东西
- Linux 里文件要有执行权限（x）才能运行
- chmod +x 可以加执行权限
- ./ 表示当前目录，不加 ./ 系统会去 PATH 里找
- PATH 是环境变量，告诉 Shell 去哪里找命令
- 系统命令（ls、cat 等）也都是程序，放在 /usr/bin 里
- Shell 内置命令（cd、echo 等）不需要去 PATH 找
- export 只对当前终端会话有效，关掉就失效

## Task 03 
- 先 `cd workspace/project` 进入目录
- 用 `grep -rl "TODO\|FIXME" .` 搜索，找到两个文件：
  - `./main.py`
  - `./utils/helper.py`
- 但路径格式不对，判题失败
- 回到仓库根目录重新执行：
  grep -rl "TODO\|FIXME" workspace/project/ | sort | uniq > output/03_code_search.txt

##task 04
- 过程：
- 任务1：grep -c "ERROR" logs/server.log > output/04_error_count.txt
- 任务2：grep "ERROR" logs/server.log | sed 's/.*user=\([a-z]*\).*/\1/' | sort | uniq > output/04_error_users.txt
- 任务3：grep "ERROR" logs/server.log | sed 's/.*code=\([0-9]*\).*/\1/' | sort | uniq -c | sort -rn | head -1 | awk '{print $2}' > output/04_top_code.txt

- 学到：
- grep -c 统计行数
- grep -r 递归搜索目录，和 -c 不同
- sed 正则提取字段
- sort | uniq -c 统计重复项次数
- sort -rn 按数字逆序
- head -1 取第一行
- awk '{print $2}' 打印第二列
- 管道 | 把命令串起来

##task 05

 - stdin（标准输入，文件描述符 0）
 - stdout（标准输出，文件描述符 1）
 -  stderr（标准错误，文件描述符 2）
 -   只重定向 stdout，stderr 仍然显示在屏幕上
 -   2> 重定向 stder
 -  > 文件 2> 文件 可以把两种输出分开写到不同文件
 - 2> /dev/null 把错误输出丢弃
 - tee 命令可以把输出同时送到屏幕和文件
 - 管道 | 把前一个命令的 stdout 传给后一个命令
 - 重定向 > 是把输出写到文件，管道 | 是把输出传给下一个命令

##task 06

 - 学到的东西
·- ut -d ' ' -f1 按分隔符提取指定列
·- ort 默认按字典序排序
·- ort -rn 按数字从大到小排序
·- niq -c 只能统计相邻重复行，所以必须先用 sort 让相同项挨在一起
·- 两次 sort 作用不同：第一次让相同项相邻，第二次按次数排序
·- head -1 取前 1 行，不是取第 1 行；head -2 是取前 2 行
·-  awk '{print $2}' 打印第 2 列，用来去掉次数只留 IP· 管道 | 可以把多个命令串联，不用中间文件


##task 07 
- 学到的东西

· 命令行参数：$1 是第一个参数，$# 是参数个数
· if [ 条件 ]; then ... fi 是 Bash 的条件判断语法
· -eq 判断数字相等，-f 判断是不是文件，! 取反
· $(命令) 是命令替换，把命令的输出赋值给变量
· exit 0 表示正常退出，exit 1 表示出错退出
· 脚本第一行 #!/usr/bin/env bash 是 shebang，指定用 bash 执行
· 变量和参数加引号更安全，能防止文件名含空格时出错


##task08 
学到的东西

· $var 不加引号，变量值含空格时会被 Shell 按空格拆分成多个词（word splitting）
· "$var" 加引号，变量值保持为一个整体
· $@ 不加引号会被拆分，"$@" 会保持每个参数独立，适合处理带空格的文件名
· cp 的源文件和目标目录之间必须有空格
