##############################################################################
# BASH CHEATSHEET (中文速查表)  -  by skywind (created on 2018/02/14)
# Version: 6, Last Modified: 2018/02/24 18:37
# https://github.com/skywind3000/awesome-cheatsheets
##############################################################################



##############################################################################
# 常用快捷键
##############################################################################

CTRL+A              # 移动到行首，同 <Home>
CTRL+B              # 向后移动，同 <Left>
CTRL+C              # 结束当前命令
CTRL+D              # 删除光标前的字符，同 <Delete> ，或者没有内容时，退出会话
CTRL+E              # 移动到行末，同 <End>
CTRL+F              # 向前移动，同 <Right>
CTRL+G              # 退出当前编辑（比如正在 CTRL+R 搜索历史时）
CTRL+H              # 删除光标左边的字符，同 <Backspace>
CTRL+K              # 删除光标位置到行末的内容
CTRL+L              # 清屏并重新显示
CTRL+N              # 移动到命令历史的下一行，同 <Down>
CTRL+O              # 类似回车，但是会显示下一行历史
CTRL+P              # 移动到命令历史的上一行，同 <Up>
CTRL+R              # 历史命令反向搜索，使用 CTRL+G 退出搜索
CTRL+S              # 历史命令正向搜索，使用 CTRL+G 退出搜索
CTRL+T              # 交换前后两个字符
CTRL+U              # 删除字符到行首
CTRL+V              # 输入字符字面量，先按 CTRL+V 再按任意键
CTRL+W              # 删除光标左边的一个单词
CTRL+X              # 列出可能的补全
CTRL+Y              # 粘贴前面 CTRL+u/k/w 删除过的内容
CTRL+Z              # 暂停前台进程返回 bash，需要时可用 fg 将其切换回前台
CTRL+_              # 撤销（undo），有的终端将 CTRL+_ 映射为 CTRL+/ 或 CTRL+7

ALT+b               # 向后（左边）移动一个单词
ALT+d               # 删除光标后（右边）一个单词
ALT+f               # 向前（右边）移动一个单词
ALT+t               # 交换字符
ALT+BACKSPACE       # 删除光标前面一个单词，类似 CTRL+W，但不影响剪贴板

CTRL+X CTRL+X       # 连续按两次 CTRL+X，光标在当前位置和行首来回跳转 
CTRL+X CTRL+E       # 用你指定的编辑器，编辑当前命令


##############################################################################
# BASH 基本操作
##############################################################################

exit                # 退出当前登陆
env                 # 显示环境变量
echo $SHELL         # 显示你在使用什么 SHELL

bash                # 使用 bash，用 exit 返回
whereis bash        # 查找 bash 在哪里
which bash          # 查找哪个程序对应命令 bash

clear               # 清初屏幕内容
reset               # 重置终端（当你不小心 cat 了一个二进制，终端状态乱掉时使用）


##############################################################################
# 目录操作
##############################################################################

cd                  # 返回自己 $HOME 目录
cd {dirname}        # 进入目录
pwd                 # 显示当前所在目录
mkdir {dirname}     # 创建目录
mkdir -p {dirname}  # 递归创建目录
pushd {dirname}     # 目录压栈并进入新目录
popd                # 弹出并进入栈顶的目录
dirs -v             # 列出当前目录栈
cd -{N}             # 切换到目录栈中的第 N个目录，比如 cd -2 将切换到第二个


##############################################################################
# 文件操作
##############################################################################

ls                  # 显示当前目录内容，后面可接目录名：ls {dir} 显示指定目录
ls -l               # 列表方式显示目录内容，包括文件日期，大小，权限等信息
ls -a               # 显示所有文件和目录，包括隐藏文件（.开头的文件/目录名）
ln -s {fn} {link}   # 给指定文件创建一个软链接
cp {src} {dest}     # 拷贝文件，cp -r dir1 dir2 可以递归拷贝（目录）
rm {fn}             # 删除文件，rm -r 递归删除目录，rm -f 强制删除
mv {src} {dest}     # 移动文件，如果 dest 是目录，则移动，是文件名则覆盖
touch {fn}          # 创建或者更新一下制定文件
cat {fn}            # 输出文件原始内容
any_cmd > {fn}      # 执行任意命令并将标准输出重定向到指定文件
more {fn}           # 逐屏显示某文件内容，空格翻页，q 退出
less {fn}           # 更高级点的 more，更多操作，q 退出
head {fn}           # 显示文件头部数行，可用 head -3 abc.txt 显示头三行
tail {fn}           # 显示文件尾部数行，可用 tail -3 abc.txt 显示尾部三行
tail -f {fn}        # 持续显示文件尾部数据，可用于监控日志
nano {fn}           # 使用 nano 编辑器编辑文件
vim {fn}            # 使用 vim 编辑文件
diff {f1} {f2}      # 比较两个文件的内容
wc {fn}             # 统计文件有多少行，多少个单词
chmod 644 {fn}      # 修改文件权限为 644，可以接 -R 对目录循环改权限
chown user1 {fn}    # 修改文件所有人为 user1, chown user1:group1 fn 可以修改组
grep {pat} {fn}     # 在文件中查找出现过 pat 的内容
grep -r {pat} .     # 在当前目录下递归查找所有出现过 pat 的文件内容


##############################################################################
# 用户管理
##############################################################################

whoami              # 显示我的用户名
passwd              # 修改密码，passwd {user} 可以用于 root 修改别人密码
finger {user}       # 显示某用户信息，包括 id, 名字, 登陆状态等
adduser {user}      # 添加用户
deluser {user}      # 删除用户
last {user}         # 显示登陆记录
w                   # 查看谁在线
su                  # 切换到 root 用户
su -                # 切换到 root 用户并登陆（执行登陆脚本）
su {user}           # 切换到某用户
su -{user}          # 切换到某用户并登陆（执行登陆脚本）
write {user}        # 向某用户发送一句消息


##############################################################################
# 进程管理
##############################################################################

ps                        # 查看当前会话进程
ps ax                     # 查看所有进程，类似 ps -e
ps aux                    # 查看所有进程详细信息，类似 ps -ef
ps auxww                  # 查看所有进程，并且显示进程的完整启动命令
ps -u {user}              # 查看某用户进程
ps axjf                   # 列出进程树
ps -eo pid,user,command   # 按用户指定的格式查看进程
ps aux | grep httpd       # 查看名为 httpd 的所有进程
ps --ppid {pid}           # 查看父进程为 pid 的所有进程

kill {pid}                # 结束进程
kill -9 {pid}             # 强制结束进程，9/SIGKILL 是强制不可捕获结束信号
kill -KILL {pid}          # 强制执行进程，kill -9 的另外一种写法
kill -l                   # 查看所有信号
kill -l TERM              # 查看 TERM 信号的编号
killall {procname}        # 按名称结束进程

top                       # 查看最活跃的进程
top -u {user}             # 查看某用户最活跃的进程

any_command &             # 在后台运行某命令，也可用 CTRL+Z 将当前进程挂到后台
jobs                      # 查看所有后台进程（jobs）
bg                        # 查看后台进程，并切换过去
fg                        # 切换后台进程到前台
fg {job}                  # 切换特定后台进程到前台

trap cmd sig1 sig2        # 在脚本中设置信号处理命令
trap "" sig1 sig2         # 在脚本中屏蔽某信号
trap - sig1 sig2          # 恢复默认信号处理行为

disown {PID|JID}          # 将进程从后台任务列表（jobs）移除

wait                      # 等待所有后台进程任务结束


##############################################################################
# 常用命令：SSH / 系统信息 / 网络
##############################################################################

ssh user@host             # 以用户 user 登陆到远程主机 host
ssh -p {port} user@host   # 指定端口登陆主机
ssh-copy-id user@host     # 拷贝你的 ssh key 到远程主机，避免重复输入密码
scp {fn} user@host:path   # 拷贝文件到远程主机
scp user@host:path dest   # 从远程主机拷贝文件回来
scp -P {port} ...         # 指定端口远程拷贝文件

uname -a                  # 查看内核版本等信息
man {help}                # 查看帮助
info {help}               # 查看帮助，info pages，比 man 更强的帮助系统
uptime                    # 查看系统启动时间
date                      # 显示日期
cal                       # 显示日历
vmstat                    # 显示内存和 CPU 使用情况
vmstat 10                 # 每 10 秒打印一行内存和 CPU情况，CTRL+C 退出
df                        # 显示磁盘使用情况
du                        # 显示当前目录占用，du . --max-depth=2 可以指定深度
showkey -a                # 查看终端发送的按键编码

ping {host}               # ping 远程主机并显示结果，CTRL+C 退出
ping -c N {host}          # ping 远程主机 N 次
traceroute {host}         # 侦测路由连通情况
mtr {host}                # 高级版本 traceroute
whois {domain}            # 取得域名 whois 信息
dig {domain}              # 取得域名 dns 信息

wget {url}                # 下载文件，可加 --no-check-certificate 忽略 ssl 验证
wget -qO- {url}           # 下载文件并输出到标准输出（不保存）
curl -sL {url}            # 同 wget -qO- {url} 没有 wget 的时候使用

sz {file}                 # 发送文件到终端，zmodem 协议
rz                        # 接收终端发送过来的文件


##############################################################################
# 变量操作
##############################################################################

varname=value             # 定义变量
varname=value command     # 定义子进程变量并执行子进程
echo $varname             # 查看变量内容
echo $$                   # 查看当前 shell 的进程号
echo $!                   # 查看最近调用的后台任务进程号
echo $?                   # 查看最近一条命令的返回码
export VARNAME=value      # 设置环境变量（将会影响到子进程）

array[0]=valA             # 定义数组
array[1]=valB
array[2]=valC
array=([0]=valA [1]=valB [2]=valC)   # 另一种方式
array=(valA valB valC)               # 另一种方式

${array[i]}               # 取得数组中的元素
${#array[@]}              # 取得数组的长度
${#array[i]}              # 取得数组中某个变量的长度

declare -a                # 查看所有数组
declare -f                # 查看所有函数
declare -F                # 查看所有函数，仅显示函数名
declare -i                # 查看所有整数
declare -r                # 查看所有只读变量
declare -x                # 查看所有被导出成环境变量的东西

${varname:-word}          # 如果变量不为空则返回变量，否则返回 word
${varname:=word}          # 如果变量不为空则返回变量，否则赋值成 word 并返回
${varname:?message}       # 如果变量不为空则返回变量，否则打印错误信息并退出
${varname:+word}          # 如果变量不为空则返回 word，否则返回 null
${varname:offset:len}     # 取得字符串的子字符串

${variable#pattern}       # 如果变量头部匹配 pattern，则删除最小匹配部分返回剩下的
${variable##pattern}      # 如果变量头部匹配 pattern，则删除最大匹配部分返回剩下的
${variable%pattern}       # 如果变量尾部匹配 pattern，则删除最小匹配部分返回剩下的
${variable%%pattern}      # 如果变量尾部匹配 pattern，则删除最大匹配部分返回剩下的
${variable/pattern/str}   # 将变量中第一个匹配 pattern 的替换成 str，并返回
${variable//pattern/str}  # 将变量中所有匹配 pattern 的地方替换成 str 并返回

${#varname}               # 返回字符串长度


##############################################################################
# References
##############################################################################

https://ss64.com/bash/syntax-keyboard.html



