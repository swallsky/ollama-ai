#!/bin/bash

cd env

# 编译镜像
build(){
  docker compose build
}

# 启动基础服务
start(){
	docker compose up -d
}

# 查看容器状态
ps(){
  docker compose ps
}

# 查看日志
logs(){
  docker compose logs -f
}

# 关闭容器
down(){
  docker compose down
}

# 运行ollama命令，显示下载的大模型列表
ollama_list(){
  docker compose exec ollama /usr/bin/ollama list
}

# 下载并运行gemma2(9B)大模型
gemma2_9B(){
  # docker compose exec ollama /usr/bin/ollama pull gemma2
  docker compose exec ollama /usr/bin/ollama run gemma2
}

# 下载并运行gemma2(27B)大模型
gemma2_27B(){
  # docker compose exec ollama /usr/bin/ollama pull gemma2:27b
  docker compose exec ollama /usr/bin/ollama run gemma2:27b
}

# 使用说明
help(){
cat << EOF
使用说明
    格式 ./cmd.sh command param
    编译镜像 build
    启动基础服务 start
    查看容器状态 ps
    显示大模型列表 ollama_list
    下载并运行gemma2(9B)大模型 gemma2_9B
    下载并运行gemma2(27B)大模型 gemma2_27B
    查看日志 logs
    关闭容器 down
EOF
}

# 根据参数执行对应的方法
if [ "" = "$1" ]; then
    help
else
    eval "$1"
fi