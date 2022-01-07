# 引用 ovoenv 
FROM rhwong/ovoenv:1.2
WORKDIR /workspace
# 添加环境
ENV BOTQQ 123456
ENV MASTER 100000
# 安装OlivOS框架及运行环境
RUN git clone https://github.com/OlivOS-Team/OlivOS.git
RUN pip install -r /workspace/OlivOS/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/
# 安装基础插件
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceCore/releases/latest/download/OlivaDiceCore.opk
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceJoy/releases/latest/download/OlivaDiceJoy.opk
RUN wget -P /workspace/OlivOS/plugin/app/ https://github.com/OlivOS-Team/OlivaDiceLogger/releases/latest/download/OlivaDiceLogger.opk
# 安装go-cqhttp
RUN wget https://github.com/Mrs4s/go-cqhttp/releases/latest/download/go-cqhttp_linux_amd64.tar.gz
RUN tar -zxvf go-cqhttp_linux_amd64.tar.gz
# 下载运行脚本及配置文件
RUN wget https://www.aobacore.com/Git/ovo/start.sh -O start.sh -N
RUN wget -P /workspace/gocqfile https://www.aobacore.com/Git/ovo/config.yml -N
RUN wget -P /workspace/OlivOS/conf https://www.aobacore.com/Git/ovo/account.json -N
RUN wget -P /workspace/OlivOS/plugin/data/OlivaDice/unity/console https://www.aobacore.com/Git/ovo/switch.json -N
# 给予权限
RUN chmod -R 766 /workspace
# 启动
CMD /workspace/start.sh && bash