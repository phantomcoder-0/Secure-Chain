<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.io.*" %>
<%
    // Check if user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - SecureChain</title>
    <meta name="description" content="SecureChain Dashboard - Manage your secure digital evidence">
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
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        /* Header */
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 1.5rem 2rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            position: sticky;
            top: 0;
            z-index: 100;
            animation: slideIn 0.8s ease-out;
        }

        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #0D9488;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logo svg {
            width: 2rem;
            height: 2rem;
            filter: drop-shadow(0 4px 8px rgba(13, 148, 136, 0.3));
            animation: pulse 2s ease-in-out infinite;
        }

        .nav-menu {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-item {
            color: #374151;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-item:hover {
            background: rgba(13, 148, 136, 0.1);
            color: #0D9488;
            transform: translateY(-2px);
        }

        .nav-item.active {
            background: rgba(13, 148, 136, 0.15);
            color: #0D9488;
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            background: rgba(13, 148, 136, 0.1);
            border-radius: 12px;
            border: 1px solid rgba(13, 148, 136, 0.2);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0d9488, #15803d);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
        }

        .logout-btn {
            padding: 0.75rem 1.5rem;
            background: linear-gradient(135deg, #dc2626, #ef4444);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(220, 38, 38, 0.3);
        }

        /* Main Content */
        .main-content {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .dashboard-header {
            margin-bottom: 2rem;
        }

        .dashboard-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .dashboard-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.2rem;
            font-weight: 400;
        }

        /* Content Sections */
        .content-section {
            display: none;
            animation: fadeInUp 0.5s ease-out;
        }

        .content-section.active {
            display: block;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, #0d9488, #15803d, #0369a1);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }

        .stat-icon.primary { background: linear-gradient(135deg, #0d9488, #15803d); }
        .stat-icon.secondary { background: linear-gradient(135deg, #0369a1, #0d9488); }
        .stat-icon.success { background: linear-gradient(135deg, #15803d, #16a34a); }
        .stat-icon.warning { background: linear-gradient(135deg, #ea580c, #f59e0b); }

        .stat-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #6b7280;
            font-size: 1rem;
            font-weight: 500;
        }

        /* Action Cards */
        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .action-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .action-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .action-icon {
            width: 60px;
            height: 60px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0d9488, #15803d);
            color: white;
            font-size: 1.5rem;
        }

        .action-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1f2937;
        }

        .action-description {
            color: #6b7280;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        /* Form Styles */
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-group input[type="file"] {
            width: 100%;
            padding: 1rem;
            border: 2px dashed #d1d5db;
            border-radius: 12px;
            background: #f9fafb;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .form-group input[type="file"]:hover {
            border-color: #0d9488;
            background: rgba(13, 148, 136, 0.05);
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

        /* Evidence Table */
        .evidence-table {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(229, 231, 235, 0.5);
        }

        .table th {
            background: rgba(249, 250, 251, 0.8);
            font-weight: 600;
            color: #374151;
        }

        .table tr:hover {
            background: rgba(249, 250, 251, 0.5);
        }

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-verified {
            background: #dcfce7;
            color: #16a34a;
        }

        .status-pending {
            background: #fef3c7;
            color: #d97706;
        }

        /* Message Styles */
        .message {
            padding: 1rem 1.5rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
        }

        .message.success {
            background: #dcfce7;
            color: #16a34a;
            border: 1px solid #bbf7d0;
        }

        .message.error {
            background: #fee2e2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .message.warning {
            background: #fef3c7;
            color: #d97706;
            border: 1px solid #fde68a;
        }

        .icon-style {
            width: 1.25em;
            height: 1.25em;
            display: inline-block;
            vertical-align: -0.25em;
            fill: currentColor;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }
            
            .main-content {
                padding: 1rem;
            }
            
            .dashboard-title {
                font-size: 2rem;
            }
            
            .stats-grid, .action-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="icon-style">
                    <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z" clip-rule="evenodd" />
                </svg>
                SecureChain
            </div>
            
            <nav class="nav-menu">
                <a href="#dashboard" class="nav-item active" onclick="showSection('dashboard')">Dashboard</a>
                <a href="#upload" class="nav-item" onclick="showSection('upload')">Upload Evidence</a>
                <a href="#verify" class="nav-item" onclick="showSection('verify')">Verify Evidence</a>
                <a href="#records" class="nav-item" onclick="showSection('records')">Evidence Records</a>
            </nav>
            
            <div class="user-menu">
                <div class="user-info">
                    <div class="user-avatar">
                        <%= username.substring(0, 1).toUpperCase() %>
                    </div>
                    <div>
                        <div style="font-weight: 600; color: #1f2937;"><%= username %></div>
                        <div style="font-size: 0.9rem; color: #6b7280;">Admin</div>
                    </div>
                </div>
                
                <a href="LogoutServlet" class="logout-btn">
                    <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z" clip-rule="evenodd" />
                        <path fill-rule="evenodd" d="M19 10a.75.75 0 00-.75-.75H8.704l1.048-.943a.75.75 0 10-1.004-1.114l-2.5 2.25a.75.75 0 000 1.114l2.5 2.25a.75.75 0 101.004-1.114L8.704 10.75H18.25A.75.75 0 0019 10z" clip-rule="evenodd" />
                    </svg>
                    Logout
                </a>
            </div>
        </div>
    </header>

    <main class="main-content">
        <!-- Dashboard Section -->
        <div id="dashboard" class="content-section active">
            <div class="dashboard-header">
                <h1 class="dashboard-title">Dashboard</h1>
                <p class="dashboard-subtitle">Welcome back, <%= username %>! Here's your digital evidence overview.</p>
            </div>

            <%
                // Count total evidence files
                File uploadsDir = new File(application.getRealPath("") + "/uploads");
                int totalFiles = 0;
                if (uploadsDir.exists()) {
                    File[] files = uploadsDir.listFiles();
                    totalFiles = files != null ? files.length : 0;
                }
                
                // Count verified files (files with hash records)
                File hashFile = new File(application.getRealPath("") + "/evidence_hashes.txt");
                int verifiedFiles = 0;
                if (hashFile.exists()) {
                    try (BufferedReader reader = new BufferedReader(new FileReader(hashFile))) {
                        while (reader.readLine() != null) {
                            verifiedFiles++;
                        }
                    } catch (IOException e) {
                        // Handle exception silently in dashboard stats
                    }
                }
            %>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon primary">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M15.988 3.012A2.25 2.25 0 0118 5.25v6.5A2.25 2.25 0 0115.75 14H13.5V7A2.5 2.5 0 0011 4.5H8.128a2.252 2.252 0 011.884-1.488A2.25 2.25 0 0112.25 1h1.5a2.25 2.25 0 012.238 2.012zM11.5 3.25a.75.75 0 01.75-.75h1.5a.75.75 0 01.75.75v.25h-3v-.25z" clip-rule="evenodd" />
                                <path fill-rule="evenodd" d="M2 7a1 1 0 011-1h8a1 1 0 011 1v10a1 1 0 01-1 1H3a1 1 0 01-1-1V7zm2 3.25a.75.75 0 01.75-.75h4.5a.75.75 0 010 1.5h-4.5a.75.75 0 01-.75-.75zm0 3.5a.75.75 0 01.75-.75h4.5a.75.75 0 010 1.5h-4.5a.75.75 0 01-.75-.75z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value"><%= totalFiles %></div>
                    <div class="stat-label">Total Evidence Files</div>
                </div>

                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon success">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value"><%= verifiedFiles %></div>
                    <div class="stat-label">Verified Records</div>
                </div>

                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon secondary">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M10 2a.75.75 0 01.75.75v.25h.75a.75.75 0 010 1.5h-.75v.25a.75.75 0 01-1.5 0v-.25h-.75a.75.75 0 010-1.5h.75V2.75A.75.75 0 0110 2zM5.05 5.05A.75.75 0 016.11 4.49l.25.433a.75.75 0 01-1.3  S.75l-.25-.433zM14.95 14.95a.75.75 0 01-.56 1.06l-.433-.25a.75.75 0 01.75-1.3l.433.25a.75.75 0 01.21.99zM5.05 14.95a.75.75 0 01.56-1.06l.433.25a.75.75 0 11-.75 1.3l-.433-.25a.75.75 0 01-.21-.99zM15.51 6.11a.75.75 0 011.06-.56l.433.25a.75.75 0 11-.75 1.3l-.433-.25a.75.75 0 01-.21-.99zM10 8a2 2 0 100 4 2 2 0 000-4zM8.25 10a1.75 1.75 0 113.5 0 1.75 1.75 0 01-3.5 0zM10 18a8 8 0 100-16 8 8 0 000 16z"/>
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value">SHA-256</div>
                    <div class="stat-label">Hashing Algorithm</div>
                </div>

                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon warning">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a.75.75 0 000 1.5h.253a.25.25 0 01.244.304l-.459 2.066A1.75 1.75 0 0010.747 15H11a.75.75 0 000-1.5h-.253a.25.25 0 01-.244-.304l.459-2.066A1.75 1.75 0 009.253 9H9z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value"><%= totalFiles - verifiedFiles %></div>
                    <div class="stat-label">Pending Verification</div>
                </div>
            </div>

            <div class="action-grid">
                <div class="action-card" onclick="showSection('upload')">
                    <div class="action-header">
                        <div class="action-icon">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M10.75 4.75a.75.75 0 00-1.5 0v4.5h-4.5a.75.75 0 000 1.5h4.5v4.5a.75.75 0 001.5 0v-4.5h4.5a.75.75 0 000-1.5h-4.5v-4.5z" />
                            </svg>
                        </div>
                        <div class="action-title">Upload Evidence</div>
                    </div>
                    <div class="action-description">
                        Upload new digital evidence files to your secure storage. Each file is hashed with SHA-256 for integrity.
                    </div>
                </div>

                <div class="action-card" onclick="showSection('verify')">
                    <div class="action-header">
                        <div class="action-icon">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M10 1.5A5.5 5.5 0 004.5 7v5.5a5.5 5.5 0 005.5 5.5 5.5 5.5 0 005.5-5.5V7A5.5 5.5 0 0010 1.5zM8.205 10.62a.75.75 0 011.06 0l1.25 1.25a.75.75 0 01-1.06 1.06L8.205 11.68a.75.75 0 010-1.06z" clip-rule="evenodd" />
                            </svg>
                        </div>
                        <div class="action-title">Verify Evidence</div>
                    </div>
                    <div class="action-description">
                        Check the integrity of an evidence file by comparing its current hash against the stored record.
                    </div>
                </div>
                 <div class="action-card" onclick="showSection('records')">
                    <div class="action-header">
                        <div class="action-icon">
                           <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                              <path fill-rule="evenodd" d="M4.25 2A2.25 2.25 0 002 4.25v11.5A2.25 2.25 0 004.25 18h11.5A2.25 2.25 0 0018 15.75V4.25A2.25 2.25 0 0015.75 2H4.25zm5.78 11.47a.75.75 0 10-1.06-1.06L7.22 14.19l-1.97-1.97a.75.75 0 00-1.06 1.06l2.5 2.5a.75.75 0 001.06 0l3-3zM14 7a.75.75 0 01-.75.75H7a.75.75 0 010-1.5h6.25A.75.75 0 0114 7z" clip-rule="evenodd" />
                           </svg>
                        </div>
                        <div class="action-title">View Records</div>
                    </div>
                    <div class="action-description">
                        Browse all uploaded evidence files and view their verification status and details.
                    </div>
                </div>
            </div>
        </div>

        <!-- Upload Section -->
        <div id="upload" class="content-section">
            <div class="dashboard-header">
                <h1 class="dashboard-title">Upload Evidence</h1>
                <p class="dashboard-subtitle">Securely upload a new evidence file. A SHA-256 hash will be generated and stored.</p>
            </div>
            <%
                String uploadStatus = (String) request.getAttribute("uploadStatus");
                if (uploadStatus != null) {
                    if (uploadStatus.startsWith("Success")) {
            %>
                        <div class="message success">
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.236 4.53L7.53 9.53a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z" clip-rule="evenodd" /></svg>
                            <%= uploadStatus %>
                        </div>
            <%      } else { %>
                        <div class="message error">
                           <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z" clip-rule="evenodd" /></svg>
                            <%= uploadStatus %>
                        </div>
            <%      }
                }
            %>
            <div class="form-container">
                <form action="UploadServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="evidenceFile">Select Evidence File</label>
                        <input type="file" id="evidenceFile" name="evidenceFile" required>
                    </div>
                    <button type="submit" class="submit-btn">
                        <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M9.25 13.25a.75.75 0 001.5 0V4.636l2.955 3.129a.75.75 0 001.09-1.03l-4.25-4.5a.75.75 0 00-1.09 0l-4.25 4.5a.75.75 0 101.09 1.03L9.25 4.636v8.614z" /><path d="M3.5 12.75a.75.75 0 00-1.5 0v2.5A2.75 2.75 0 004.75 18h10.5A2.75 2.75 0 0018 15.25v-2.5a.75.75 0 00-1.5 0v2.5c0 .69-.56 1.25-1.25 1.25H4.75c-.69 0-1.25-.56-1.25-1.25v-2.5z" /></svg>
                        Upload and Secure
                    </button>
                </form>
            </div>
        </div>
        
        <!-- Verify Section -->
        <div id="verify" class="content-section">
            <div class="dashboard-header">
                <h1 class="dashboard-title">Verify Evidence</h1>
                <p class="dashboard-subtitle">Upload a file to check its integrity against the stored hash records.</p>
            </div>
            <%
                String verificationResult = (String) request.getAttribute("verificationResult");
                if (verificationResult != null) {
                    String verificationMessage = (String) request.getAttribute("verificationMessage");
                    String messageClass = "warning";
                    String iconPath = "<path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z' clip-rule='evenodd' />";
                    if ("valid".equals(verificationResult)) {
                        messageClass = "success";
                        iconPath = "<path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.236 4.53L7.53 9.53a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z' clip-rule='evenodd' />";
                    } else if ("invalid".equals(verificationResult)) {
                        messageClass = "error";
                    } else { // notfound
                        iconPath = "<path fill-rule='evenodd' d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a.75.75 0 000 1.5h.253a.25.25 0 01.244.304l-.459 2.066A1.75 1.75 0 0010.747 15H11a.75.75 0 000-1.5h-.253a.25.25 0 01-.244-.304l.459-2.066A1.75 1.75 0 009.253 9H9z' clip-rule='evenodd' />";
                    }
            %>
                    <div class="message <%= messageClass %>">
                        <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><%= iconPath %></svg>
                        <%= verificationMessage %>
                    </div>
            <%  } %>
            <div class="form-container">
                <form action="VerifyServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="verifyFile">Select File to Verify</label>
                        <input type="file" id="verifyFile" name="verifyFile" required>
                    </div>
                    <button type="submit" class="submit-btn">
                        <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M10 1.5A5.5 5.5 0 004.5 7v5.5a5.5 5.5 0 005.5 5.5 5.5 5.5 0 005.5-5.5V7A5.5 5.5 0 0010 1.5zM8.205 10.62a.75.75 0 011.06 0l1.25 1.25a.75.75 0 01-1.06 1.06L8.205 11.68a.75.75 0 010-1.06z" clip-rule="evenodd" /></svg>
                        Verify Integrity
                    </button>
                </form>
            </div>
        </div>

        <!-- Evidence Records Section -->
        <div id="records" class="content-section">
            <div class="dashboard-header">
                <h1 class="dashboard-title">Evidence Records</h1>
                <p class="dashboard-subtitle">A complete log of all uploaded evidence and their verification status.</p>
            </div>
            <div class="evidence-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>File Name</th>
                            <th>Stored Hash (SHA-256)</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String recordsHashFilePath = application.getRealPath("") + "/evidence_hashes.txt";
                            File recordsHashFile = new File(recordsHashFilePath);
                            Map<String, String> evidenceMap = new HashMap<>();
                            boolean hasEvidence = false;

                            if (recordsHashFile.exists()) {
                                try (BufferedReader reader = new BufferedReader(new FileReader(recordsHashFile))) {
                                    String line;
                                    while ((line = reader.readLine()) != null) {
                                        String[] parts = line.split(":", 2);
                                        if (parts.length == 2) {
                                            evidenceMap.put(parts[0].trim(), parts[1].trim());
                                        }
                                    }
                                } catch (IOException e) {
                                    out.println("<tr><td colspan='3' class='message error'>Error reading hash file: " + e.getMessage() + "</td></tr>");
                                }
                            }

                            // Display verified records
                            for (Map.Entry<String, String> entry : evidenceMap.entrySet()) {
                                hasEvidence = true;
                        %>
                                <tr>
                                    <td><%= entry.getKey() %></td>
                                    <td><code style="font-size: 0.9em;"><%= entry.getValue() %></code></td>
                                    <td><span class="status-badge status-verified">Verified</span></td>
                                </tr>
                        <%
                            }

                            // Check for files in uploads dir that are not in the hash map (pending)
                            File recordsUploadsDir = new File(application.getRealPath("") + "/uploads");
                            if (recordsUploadsDir.exists() && recordsUploadsDir.isDirectory()) {
                                File[] uploadedFiles = recordsUploadsDir.listFiles();
                                if (uploadedFiles != null) {
                                    for (File file : uploadedFiles) {
                                        if (!evidenceMap.containsKey(file.getName())) {
                                            hasEvidence = true;
                        %>
                                            <tr>
                                                <td><%= file.getName() %></td>
                                                <td>-</td>
                                                <td><span class="status-badge status-pending">Pending</span></td>
                                            </tr>
                        <%
                                        }
                                    }
                                }
                            }

                            if (!hasEvidence) {
                        %>
                            <tr>
                                <td colspan="3" style="text-align: center; padding: 2rem; color: #6b7280;">No evidence files found. <a href="#upload" onclick="showSection('upload')" style="color: #0d9488; font-weight: 500;">Upload one now</a>.</td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <script>
        function showSection(sectionId) {
            document.querySelectorAll('.content-section').forEach(section => {
                section.classList.remove('active');
            });

            const targetSection = document.getElementById(sectionId);
            if (targetSection) {
                targetSection.classList.add('active');
            }

            document.querySelectorAll('.nav-item').forEach(item => {
                item.classList.remove('active');
            });
            const activeNavItem = document.querySelector(`.nav-item[href="#${sectionId}"]`);
            if(activeNavItem) {
                activeNavItem.classList.add('active');
            }
            
            if(history.pushState) {
                history.pushState(null, null, window.location.pathname + '#' + sectionId);
            } else {
                window.location.hash = '#' + sectionId;
            }
        }
        
        document.addEventListener('DOMContentLoaded', () => {
            let initialSection = 'dashboard';
            const hash = window.location.hash.substring(1);
            if (hash) {
                initialSection = hash;
            }

            <% if (request.getAttribute("uploadStatus") != null) { %>
                initialSection = 'upload';
            <% } else if (request.getAttribute("verificationResult") != null) { %>
                initialSection = 'verify';
            <% } %>
            
            showSection(initialSection);
        });
    </script>
</body>
</html>