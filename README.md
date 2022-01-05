## V-NET
[![](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- [x] 支持 vmess 和 vless 两种协议
- [x] 支持自定义 WebSocket 路径
- [x] 伪装首页
- [x] HTML5 测速

请求`/`，显示伪装主页

请求`/speedtest/`，html5-speedtest 测速页面

请求`/test/`，文件下载速度测试

请求`/yuanzheng`（可配置）V-NET WebSocket 路径

### 环境变量说明

|  名称 | 值  | 说明  |
| ------------ | ------------ | ------------ |
|  PROTOCOL |  vmess<br>vless（可选） |  协议：nginx+vmess+ws+tls 或是 nginx+vless+ws+tls |
|  UUID |  UUID 值 | 用户主 ID  |
|  WS_PATH | 默认为`/yuanzheng` |  路径，请勿使用`/speedtest`，`/`，`/test` 等已经被占用的请求路径 |