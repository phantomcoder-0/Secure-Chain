<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - SecureChain</title>
    <meta name="description" content="Join SecureChain - Professional digital evidence management with blockchain-grade security">
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

        .register-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 
                0 20px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(255, 255, 255, 0.2);
            padding: 3rem;
            max-width: 700px;
            width: 100%;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.8s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .register-container::before {
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

        .register-header {
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

        .register-header h1 {
            font-size: 2.2rem;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, #1f2937 0%, #0d9488 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .register-header p {
            color: #6b7280;
            font-size: 1.1rem;
            font-weight: 400;
        }

        .form-grid {
            display: grid;
            gap: 1.5rem;
            animation: slideIn 0.8s ease-out 0.4s both;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            padding: 1rem 1.2rem;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            transition: all 0.3s ease;
            background: white;
            position: relative;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #0D9488;
            box-shadow: 0 0 0 4px rgba(13, 148, 136, 0.1);
            transform: translateY(-2px);
        }

        .form-group input:focus + label,
        .form-group select:focus + label,
        .form-group textarea:focus + label {
            color: #0D9488;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 90px;
        }

        /* Input icons */
        .form-group::after {
            content: '';
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="%23d1d5db"><path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/><path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/></svg>') no-repeat center;
            opacity: 0.5;
            transition: opacity 0.3s ease;
        }

        .form-group:focus-within::after {
            opacity: 1;
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
            animation: slideIn 0.5s ease-out;
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.1);
        }

        .success {
            color: #15803d;
            background: linear-gradient(135deg, #dcfce7 0%, #bbf7d0 100%);
            padding: 1rem 1.2rem;
            border-radius: 12px;
            border: 1px solid #bbf7d0;
            margin-top: 1rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            animation: slideIn 0.5s ease-out;
            box-shadow: 0 4px 12px rgba(21, 128, 61, 0.1);
        }

        .login-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(229, 231, 235, 0.8);
            animation: slideIn 0.8s ease-out 0.6s both;
        }

        .login-link a {
            color: #0D9488;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }

        .login-link a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(135deg, #0d9488, #15803d);
            transition: width 0.3s ease;
        }

        .login-link a:hover::after {
            width: 100%;
        }

        .login-link a:hover {
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

        /* Enhanced form validation styles */
        .form-group input:valid {
            border-color: #10b981;
        }

        .form-group input:invalid:not(:placeholder-shown) {
            border-color: #ef4444;
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
            
            .register-container {
                padding: 2rem;
                margin: 0.5rem;
                border-radius: 16px;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .register-header h1 {
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
            .register-container {
                padding: 1.5rem;
            }
            
            .register-header h1 {
                font-size: 1.5rem;
            }
            
            .form-group input,
            .form-group select,
            .form-group textarea {
                padding: 0.8rem 1rem;
            }
        }

        /* Dark mode support */
        @media (prefers-color-scheme: dark) {
            .register-container {
                background: rgba(31, 41, 55, 0.95);
                color: #f9fafb;
            }
            
            .register-header h1 {
                color: #f9fafb;
            }
            
            .form-group label {
                color: #d1d5db;
            }
            
            .form-group input,
            .form-group select,
            .form-group textarea {
                background: rgba(55, 65, 81, 0.8);
                border-color: #4b5563;
                color: #f9fafb;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z" clip-rule="evenodd" />
                </svg>
                SecureChain
            </div>
            <h1>Create Your Account</h1>
            <p>Join the secure digital evidence management platform</p>
        </div>

        <form action="RegisterServlet" method="post">
            <div class="form-grid">
                <div class="form-row">
                    <div class="form-group">
                        <label for="full_name">Full Name</label>
                        <input type="text" id="full_name" name="full_name" value="<%= request.getParameter("full_name") != null ? request.getParameter("full_name") : "" %>" required />
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required />
                    </div>
                    <div class="form-group">
                        <label for="contact_number">Contact Number</label>
                        <input type="tel" id="contact_number" name="contact_number" pattern="[0-9]{7,15}" title="7 to 15 digits" value="<%= request.getParameter("contact_number") != null ? request.getParameter("contact_number") : "" %>" required />
                    </div>
                </div>

                <div class="form-group full-width">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" required><%= request.getParameter("address") != null ? request.getParameter("address") : "" %></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required />
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirm Password</label>
                        <input type="password" id="confirm_password" name="confirm_password" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="security_question">Security Question</label>
                        <select id="security_question" name="security_question" required>
                            <option value="">--Select a question--</option>
                            <option value="What is your pet's name?" <%= "What is your pet's name?".equals(request.getParameter("security_question")) ? "selected" : "" %>>What is your pet's name?</option>
                            <option value="What is your mother's maiden name?" <%= "What is your mother's maiden name?".equals(request.getParameter("security_question")) ? "selected" : "" %>>What is your mother's maiden name?</option>
                            <option value="What was your first car?" <%= "What was your first car?".equals(request.getParameter("security_question")) ? "selected" : "" %>>What was your first car?</option>
                            <option value="What city were you born in?" <%= "What city were you born in?".equals(request.getParameter("security_question")) ? "selected" : "" %>>What city were you born in?</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="security_answer">Security Answer</label>
                        <input type="text" id="security_answer" name="security_answer" required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="role">Role</label>
                    <select id="role" name="role" required>
                        <option value="user" <%= "user".equals(request.getParameter("role")) ? "selected" : "" %>>User</option>
                        <option value="admin" <%= "admin".equals(request.getParameter("role")) ? "selected" : "" %>>Admin</option>
                    </select>
                </div>

                <button type="submit" class="submit-btn">
                    <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z"/>
                    </svg>
                    Create Account
                </button>
            </div>
        </form>

        <%
            String error = (String) request.getAttribute("error");
            String message = (String) request.getAttribute("message");
            if (error != null) { %>
                <div class="error">
                    <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z" clip-rule="evenodd" />
                    </svg>
                    <%= error %>
                </div>
        <%  } else if (message != null) { %>
                <div class="success">
                    <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.236 4.53L7.53 10.53a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z" clip-rule="evenodd" />
                    </svg>
                    <%= message %>
                </div>
        <%  } %>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Sign in here</a>
        </div>
        <div class="login-link">
           Go to Home? <a href="index.jsp">Kickoff</a>
        </div>
    </div>

    <script>
        // Add smooth form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const submitBtn = document.querySelector('.submit-btn');
            
            // Add loading state on form submit
            form.addEventListener('submit', function() {
                submitBtn.innerHTML = '<svg class="icon-style animate-spin" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="10"></circle><path d="M12 6v6l4 2"></path></svg>Creating Account...';
                submitBtn.disabled = true;
            });
            
            // Add floating label effect
            const inputs = document.querySelectorAll('input, select, textarea');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    if (!this.value) {
                        this.parentElement.classList.remove('focused');
                    }
                });
            });
        });
    </script>
</body>
</html>