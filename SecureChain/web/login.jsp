<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - SecureChain</title>
    <meta name="description" content="SecureChain Login - Access your secure digital evidence management platform">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            color: #374151;
            background: linear-gradient(135deg, #0d9488 0%, #15803d 50%, #0369a1 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated background particles */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%" r="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.15)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)"/><circle cx="800" cy="300" r="150" fill="url(%23a)"/><circle cx="400" cy="700" r="120" fill="url(%23a)"/><circle cx="600" cy="500" r="80" fill="url(%23a)"/></svg>');
            animation: float 20s ease-in-out infinite;
            z-index: -1;
        }

        /* Floating geometric shapes */
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><linearGradient id="b" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.1)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0.05)"/></linearGradient></defs><polygon points="100,100 200,100 150,50" fill="url(%23b)"/><polygon points="700,200 800,200 750,150" fill="url(%23b)"/><polygon points="300,600 400,600 350,550" fill="url(%23b)"/></svg>');
            animation: geometricFloat 25s ease-in-out infinite reverse;
            z-index: -1;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        @keyframes geometricFloat {
            0%, 100% { transform: translateX(0px) rotate(0deg); }
            50% { transform: translateX(10px) rotate(90deg); }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 
                0 20px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(255, 255, 255, 0.2);
            padding: 3rem;
            max-width: 450px;
            width: 100%;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.8s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: -1px;
            left: -1px;
            right: -1px;
            bottom: -1px;
            background: linear-gradient(45deg, 
                rgba(13, 148, 136, 0.3), 
                rgba(21, 128, 61, 0.3), 
                rgba(3, 105, 161, 0.3));
            border-radius: 24px;
            z-index: -1;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
            animation: slideIn 0.8s ease-out 0.2s both;
        }

        .logo {
            font-size: 2.2rem;
            font-weight: 700;
            color: #0D9488;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            position: relative;
        }

        .logo svg {
            width: 2.5rem;
            height: 2.5rem;
            filter: drop-shadow(0 4px 8px rgba(13, 148, 136, 0.3));
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .login-header h1 {
            font-size: 2.2rem;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, #1f2937 0%, #0d9488 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .login-header p {
            color: #6b7280;
            font-size: 1.1rem;
            font-weight: 400;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            animation: slideIn 0.8s ease-out 0.4s both;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .form-group label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .form-group input {
            padding: 1rem 1.2rem;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            transition: all 0.3s ease;
            background: white;
            position: relative;
        }

        .form-group input:focus {
            outline: none;
            border-color: #0D9488;
            box-shadow: 0 0 0 4px rgba(13, 148, 136, 0.1);
            transform: translateY(-2px);
        }

        .form-group input:focus + label {
            color: #0D9488;
        }

        /* Input icons */
        .form-group.username::after {
            content: '';
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-25%);
            width: 20px;
            height: 20px;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="%23d1d5db"><path d="M10 8a3 3 0 100-6 3 3 0 000 6zM3.465 14.493a1.23 1.23 0 00.41 1.412A9.957 9.957 0 0010 18c2.31 0 4.438-.784 6.131-2.1.43-.333.604-.903.408-1.41a7.002 7.002 0 00-13.074.003z"/></svg>') no-repeat center;
            opacity: 0.5;
            transition: opacity 0.3s ease;
        }

        .form-group.password::after {
            content: '';
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-25%);
            width: 20px;
            height: 20px;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="%23d1d5db"><path fill-rule="evenodd" d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z" clip-rule="evenodd"/></svg>') no-repeat center;
            opacity: 0.5;
            transition: opacity 0.3s ease;
        }

        .form-group:focus-within::after {
            opacity: 1;
        }

        /* Enhanced form validation styles */
        .form-group input:valid {
            border-color: #10b981;
        }

        .form-group input:invalid:not(:placeholder-shown) {
            border-color: #ef4444;
        }

        .submit-btn {
            width: 100%;
            padding: 1.2rem;
            background: linear-gradient(135deg, #0d9488 0%, #15803d 50%, #0369a1 100%);
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            position: relative;
            overflow: hidden;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(13, 148, 136, 0.4);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .error {
            color: #dc2626;
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            padding: 1rem 1.2rem;
            border-radius: 12px;
            border: 1px solid #fecaca;
            margin-top: 1rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            animation: shake 0.5s ease-out;
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.1);
        }

        .register-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(229, 231, 235, 0.8);
            animation: slideIn 0.8s ease-out 0.6s both;
        }

        .register-link a {
            color: #0D9488;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }

        .register-link a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(135deg, #0d9488, #15803d);
            transition: width 0.3s ease;
        }

        .register-link a:hover::after {
            width: 100%;
        }

        .register-link a:hover {
            color: #0f766e;
            transform: translateY(-1px);
        }

        .icon-style {
            width: 1.25em;
            height: 1.25em;
            display: inline-block;
            vertical-align: -0.25em;
            fill: currentColor;
            transition: transform 0.3s ease;
        }

        .submit-btn:hover .icon-style {
            transform: scale(1.1);
        }

        /* Forgot password link */
        .forgot-password {
            text-align: center;
            margin-top: 1rem;
        }

        .forgot-password a {
            color: #6b7280;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #0D9488;
        }

        /* Loading state */
        .loading {
            opacity: 0.7;
            pointer-events: none;
        }

        .loading .submit-btn {
            cursor: not-allowed;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .login-container {
                padding: 2rem;
                margin: 0.5rem;
                border-radius: 16px;
            }
            
            .login-header h1 {
                font-size: 1.8rem;
            }
            
            .logo {
                font-size: 1.8rem;
            }
            
            .logo svg {
                width: 2rem;
                height: 2rem;
            }
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 1.5rem;
            }
            
            .login-header h1 {
                font-size: 1.5rem;
            }
            
            .form-group input {
                padding: 0.8rem 1rem;
            }
        }

        /* Dark mode support */
        @media (prefers-color-scheme: dark) {
            .login-container {
                background: rgba(31, 41, 55, 0.95);
                color: #f9fafb;
            }
            
            .login-header h1 {
                color: #f9fafb;
            }
            
            .form-group label {
                color: #d1d5db;
            }
            
            .form-group input {
                background: rgba(55, 65, 81, 0.8);
                border-color: #4b5563;
                color: #f9fafb;
            }
        }

        /* Security badge */
        .security-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            color: #6b7280;
            font-size: 0.85rem;
            margin-top: 1.5rem;
            opacity: 0.8;
        }

        .security-badge svg {
            width: 16px;
            height: 16px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z" clip-rule="evenodd" />
                </svg>
                SecureChain
            </div>
            <h1>Welcome Back</h1>
            <p>Sign in to your secure account</p>
        </div>

        <form class="login-form" action="LoginServlet" method="post">
            <div class="form-group username">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username" />
            </div>
            
            <div class="form-group password">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password" />
            </div>
            
            <button type="submit" class="submit-btn">
                <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z" clip-rule="evenodd" />
                    <path fill-rule="evenodd" d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z" clip-rule="evenodd" />
                </svg>
                Sign In
            </button>
      
        </form>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) { %>
                <div class="error">
                    <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z" clip-rule="evenodd" />
                    </svg>
                    <%= error %>
                </div>
        <%  } %>

        <div class="register-link">
            New user? <a href="register.jsp">Create an account</a>
        </div>
         <div class="register-link">
           Go to Home? <a href="index.jsp">Kickoff</a>
        </div>

        <div class="security-badge">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M9.661 2.237a.531.531 0 01.678 0 11.947 11.947 0 007.078 2.749.5.5 0 01.479.425c.069.52.104 1.05.104 1.589 0 5.162-3.26 9.563-7.834 11.256a.48.48 0 01-.332 0C5.26 16.564 2 12.162 2 7c0-.539.035-1.07.104-1.589a.5.5 0 01.48-.425 11.947 11.947 0 007.077-2.75zm4.196 5.954a.75.75 0 00-1.214-.882l-3.236 4.53L7.53 9.53a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z" clip-rule="evenodd" />
            </svg>
            256-bit SSL encryption
        </div>
    </div>

    <script>
        // Add smooth form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.login-form');
            const submitBtn = document.querySelector('.submit-btn');
            const inputs = document.querySelectorAll('input');
            
            // Add loading state on form submit
            form.addEventListener('submit', function() {
                submitBtn.innerHTML = '<svg class="icon-style animate-spin" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><path d="M12 6v6l4 2"></path></svg>Signing In...';
                submitBtn.disabled = true;
                document.body.classList.add('loading');
            });
            
            // Add floating label effect
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    if (!this.value) {
                        this.parentElement.classList.remove('focused');
                    }
                });
                
                // Check if field has value on page load
                if (input.value) {
                    input.parentElement.classList.add('focused');
                }
            });
            
            // Add enter key support
            inputs.forEach(input => {
                input.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        form.submit();
                    }
                });
            });
        });
    </script>
</body>
</html>