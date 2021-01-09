require 'socket'                # 获取socket标准库

server = TCPServer.open(8800)   # Socket 监听端口为 8800

loop {                          # 永久运行服务
  Thread.start(server.accept) do |client|
    client.puts(Time.now.ctime) # 发送时间到客户
    client.puts "hello,client"
    client.puts "are you ok?"
    client.puts "Closing the connection. Bye!"
    client.close                # 关闭客户端连接
  end
}
