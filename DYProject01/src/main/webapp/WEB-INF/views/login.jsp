<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title>Document</title>
        <link href="css/loginstyle.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="login-page">
        <div class="form">
          <form class="login-form" action="loginPro" method="post">
            <input type="text" placeholder="username" name="uid"/>
            <input type="password" placeholder="password" name="upwd"/>
            <button onclick="submit">login</button>
            <p class="message">Not registered?<a href="GoRegi">Create an account</a></p>
            <p class="message">Forgot your id or password? <a href="/">Click Here!</a></p>
          </form>
        </div>
      </div>
</body>
</html>