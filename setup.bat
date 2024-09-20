@echo off

:: 创建前端应用
npx create-react-app my-static-web-app
cd my-static-web-app

:: 创建API调用文件
echo export async function fetchMessage() {> src\api.js
echo.  const response = await fetch('/api/message');>> src\api.js
echo.  const data = await response.json();>> src\api.js
echo.  return data;>> src\api.js
echo }>> src\api.js

:: 修改App.js
echo import React, { useEffect, useState } from 'react';> src\App.js
echo import { fetchMessage } from './api';>> src\App.js
echo.>> src\App.js
echo function App() {>> src\App.js
echo.  const [message, setMessage] = useState('');>> src\App.js
echo.>> src\App.js
echo.  useEffect(() => {>> src\App.js
echo.    fetchMessage().then(data => setMessage(data.message));>> src\App.js
echo.  }, []);>> src\App.js
echo.>> src\App.js
echo.  return (>> src\App.js
echo.    <div className="App">>> src\App.js
echo.      <header className="App-header">>> src\App.js
echo.        <p>{message}</p>> src\App.js
echo.      </header>> src\App.js
echo.    </div>> src\App.js
echo.  );>> src\App.js
echo }>> src\App.js
echo.>> src\App.js
echo export default App;>> src\App.js

:: 返回上级目录
cd ..

:: 创建Azure Function项目
func init my-function-app --javascript
cd my-function-app
func new --template "HTTP trigger" --name HttpTrigger1

:: 编辑Azure Function
echo module.exports = async function (context, req) {> HttpTrigger1\index.js
echo.    context.log('JavaScript HTTP trigger function processed a request.');>> HttpTrigger1\index.js
echo.>> HttpTrigger1\index.js
echo.    const name = (req.query.name || (req.body && req.body.name));>> HttpTrigger1\index.js
echo.    const responseMessage = name>> HttpTrigger1\index.js
echo.        ? \`Hello, \${name}. This HTTP triggered function executed successfully.\`>> HttpTrigger1\index.js
echo.        : "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.";>> HttpTrigger1\index.js
echo.>> HttpTrigger1\index.js
echo.    context.res = {>> HttpTrigger1\index.js
echo.        // status: 200, /* Defaults to 200 */>> HttpTrigger1\index.js
echo.        body: { message: responseMessage }>> HttpTrigger1\index.js
echo.    };>> HttpTrigger1\index.js
echo }>> HttpTrigger1\index.js