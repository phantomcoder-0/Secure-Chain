<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SecureChain - Digital Evidence Management Solutions</title>
    <meta name="description" content="Professional digital evidence management system with blockchain-grade security, SHA-256 verification, and comprehensive audit trails.">
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
            overflow-x: hidden;
            background-color: #f9fafb; /* Set a base background */
        }

        /* --- Class for SVG Icons --- */
        .icon-style {
            width: 1.25em; /* Slightly larger for better visibility */
            height: 1.25em;
            display: inline-block;
            vertical-align: -0.25em; /* Better alignment with text */
            fill: currentColor;
        }

        /* Navigation */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            z-index: 1000;
            padding: 1rem 0;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.05);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #0D9488;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: #374151;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #0D9488;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #0d9488 0%, #15803d 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%" r="50%"><stop offset="0%" style="stop-color:rgba(255,255,255,0.1)"/><stop offset="100%" style="stop-color:rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)"/><circle cx="800" cy="300" r="150" fill="url(%23a)"/><circle cx="400" cy="700" r="120" fill="url(%23a)"/></svg>');
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .hero-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .hero-text h1 {
            font-size: 3.5rem;
            font-weight: 800;
            color: white;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero-text .subtitle {
            font-size: 1.3rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 2rem;
        }

        .hero-text p {
            font-size: 1.1rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2.5rem;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem; /* Increased gap for icons */
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
        }

        .btn-primary:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .btn-secondary {
            background: white;
            color: #0D9488;
            border: 2px solid white;
        }

        .btn-secondary:hover {
            background: transparent;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        /* Sections */
        .features, .solutions, .tech-stack, .contact, .footer {
            padding: 8rem 0;
        }
        .features { background: white; }
        .solutions { background: #111827; color: #e5e7eb; }
        .tech-stack { background: #f9fafb; }
        .contact { background: white; }
        .footer { background: #111827; color: #d1d5db; padding: 5rem 0 2rem; }

        .section-container { max-width: 1200px; margin: 0 auto; padding: 0 2rem; }
        .section-header { text-align: center; margin-bottom: 5rem; }
        .section-header h2 { font-size: 2.5rem; font-weight: 700; color: #1f2937; margin-bottom: 1rem; }
        .section-header p { font-size: 1.1rem; color: #6b7280; max-width: 700px; margin: 0 auto; }
        
        .solutions .section-header h2 { color: white; }
        .solutions .section-header p { color: #d1d5db; }
        
        /* Grid & Card Styles */
        .features-grid, .solutions-grid, .tech-grid {
            display: grid;
            gap: 2rem;
        }
        .features-grid { grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); }
        .solutions-grid { grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 3rem; margin-top: 4rem; }
        
        .feature-card { 
            text-align: center; 
            transition: all 0.3s ease;
            background: #f9fafb;
            padding: 2.5rem; 
            border-radius: 20px; 
            border: 1px solid #e5e7eb;
        }
        .feature-card:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08); 
            border-color: #0D9488;
            background-color: white;
        }
        .feature-icon { font-size: 3rem; margin-bottom: 1.5rem; display: block; color: #0D9488; }
        .feature-card h3 { font-size: 1.3rem; font-weight: 600; color: #1f2937; margin-bottom: 1rem; }
        .feature-card p { color: #6b7280; line-height: 1.6; }

        .solution-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); padding: 2.5rem; border-radius: 20px; border: 1px solid rgba(255, 255, 255, 0.1); transition: all 0.3s ease; }
        .solution-card:hover { transform: translateY(-5px); background: rgba(255, 255, 255, 0.08); }
        .solution-card h3 { font-size: 1.3rem; margin-bottom: 1rem; color: white; display: flex; align-items: center; gap: 0.75rem; }
        .solution-card ul { list-style: none; margin-top: 1rem; padding-left: 0; }
        .solution-card li { padding: 0.5rem 0 0.5rem 1.5rem; position: relative; }
        .solution-card li:before { content: '?'; position: absolute; left: 0; color: #4ade80; font-weight: bold; }

        /* Technology Stack Section */
        .tech-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 4rem;
        }
        .tech-card {
            background: white;
            padding: 2.5rem 2rem;
            border-radius: 20px;
            text-align: center;
            border: 1px solid #e5e7eb;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
        }
        .tech-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(13, 148, 136, 0.12);
            border-color: #0D9488;
        }
        .tech-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            color: #0D9488;
            line-height: 1; /* Fixes SVG vertical alignment issues */
        }
        .tech-card h3 {
            font-size: 1.3rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.75rem;
        }
        .tech-card p {
            color: #6b7280;
            line-height: 1.6;
            font-size: 0.95rem;
        }
        
        /* Contact Section */
        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1.2fr; /* Give more space to the form */
            gap: 4rem;
            align-items: flex-start;
        }
        .contact-info h3 {
            font-size: 1.8rem;
            color: #1f2937;
            margin-bottom: 1rem;
        }
        .contact-info p {
            margin-bottom: 2rem;
            color: #6b7280;
        }
        .contact-details-list {
            list-style: none;
            padding: 0;
        }
        .contact-details-list li {
            display: flex;
            align-items: flex-start; /* Align icon to top of text */
            gap: 1rem;
            margin-bottom: 1.5rem;
            font-size: 1rem;
        }
        .contact-details-list .icon-style {
            color: #0D9488;
            width: 1.5rem;
            height: 1.5rem;
            flex-shrink: 0; /* Prevent icon from shrinking */
            margin-top: 0.15em;
        }

        .contact-form {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.07);
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #374151;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem 1rem;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            font-size: 1rem;
            font-family: inherit;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #0D9488;
            box-shadow: 0 0 0 3px rgba(13, 148, 136, 0.2);
        }
        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }
        .submit-btn {
            width: 100%;
            padding: 1rem;
            background-color: #0D9488;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        .submit-btn:hover {
            background-color: #0f766e;
            transform: translateY(-2px);
        }
        
        /* Footer */
        .footer-content { max-width: 1200px; margin: 0 auto; padding: 0 2rem; display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 3rem; }
        .footer-section p { color: #9ca3af; }
        .footer-section h3 { margin-bottom: 1.5rem; color: #0D9488; font-size: 1.1rem;}
        .footer-section ul { list-style: none; padding-left: 0; }
        .footer-section li { margin-bottom: 0.75rem; }
        .footer-section a, .footer-section .contact-link { color: #9ca3af; text-decoration: none; transition: color 0.3s ease; display: flex; align-items: center; gap: 0.5rem; }
        .footer-section a:hover { color: white; }
        .footer-bottom { text-align: center; padding-top: 3rem; margin-top: 3rem; border-top: 1px solid #374151; color: #9ca3af; }

        /* Responsive Design */
        @media (max-width: 992px) {
            .contact-grid {
                grid-template-columns: 1fr;
            }
        }
        @media (max-width: 768px) {
            .navbar { padding: 0.5rem 0; }
            .nav-container { padding: 0 1rem; }
            .nav-links { display: none; }
            .hero-content { grid-template-columns: 1fr; gap: 2rem; padding: 8rem 1rem 2rem; text-align: center; }
            .hero-text h1 { font-size: 2.5rem; }
            .hero-buttons { justify-content: center; }
            .section-container { padding: 0 1rem; }
            .section-header h2 { font-size: 2rem; }
            .features-grid, .solutions-grid, .tech-grid { grid-template-columns: 1fr; }
        }

        /* Scroll animations */
        .fade-in { opacity: 0; transform: translateY(30px); transition: all 0.6s ease; }
        .fade-in.visible { opacity: 1; transform: translateY(0); }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="logo">
                <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" style="width:1.2em; height:1.2em;"><path fill-rule="evenodd" d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z" clip-rule="evenodd" /></svg>
                SecureChain
            </a>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#solutions">Solutions</a></li>
                <li><a href="#technology">Technology</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
             <div class="hero-text">
                <h1>Secure Digital Evidence Management</h1>
                <p class="subtitle">Blockchain-grade security for forensic professionals</p>
                <p>Protect, verify, and manage digital evidence with military-grade encryption, immutable audit trails, and comprehensive chain-of-custody tracking.</p>
                <div class="hero-buttons">
                    <a href="register.jsp" class="btn btn-primary">
                        <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z" /></svg>
                        Start Free Trial
                    </a>
                    <a href="#contact" class="btn btn-secondary">
                        <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M2 3.5A1.5 1.5 0 013.5 2h1.148a1.5 1.5 0 011.465 1.175l.716 3.578a1.5 1.5 0 01-1.305 1.762l-1.104.442a1.5 1.5 0 00-1.07 2.13l3.293 3.293a1.5 1.5 0 002.13-1.07l.442-1.104a1.5 1.5 0 011.762-1.305l3.578.716A1.5 1.5 0 0118 15.352V16.5a1.5 1.5 0 01-1.5 1.5h-10A1.5 1.5 0 015 16.5v-3.865a1.5 1.5 0 01.358-1.002l.49-1.225L4.05 9.174A1.5 1.5 0 012 7.71V3.5z" /></svg>
                        Request Demo
                    </a>
                </div>
            </div>
             <div class="hero-visual">
                <!-- Dashboard content could go here if needed -->
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <div class="section-container">
            <div class="section-header fade-in">
                <h2>Advanced Security Features</h2>
                <p>Comprehensive digital evidence management with enterprise-grade security and forensic-ready documentation.</p>
            </div>
            <div class="features-grid">
                <div class="feature-card fade-in">
                    <div class="feature-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H4.5a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" /></svg></div>
                    <h3>Multi-Layer Authentication</h3>
                    <p>Advanced role-based access control with biometric authentication, multi-factor verification, and session management.</p>
                </div>
                <div class="feature-card fade-in">
                    <div class="feature-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" /></svg></div>
                    <h3>SHA-256 Hash Verification</h3>
                    <p>Automatic cryptographic hash generation and verification ensures file integrity and provides tamper-evident proof.</p>
                </div>
                <div class="feature-card fade-in">
                    <div class="feature-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M7.5 14.25v2.25m3-4.5v4.5m3-6.75v6.75m3-9v9M6 20.25h12A2.25 2.25 0 0020.25 18V6A2.25 2.25 0 0018 3.75H6A2.25 2.25 0 003.75 6v12A2.25 2.25 0 006 20.25z" /></svg></div>
                    <h3>Immutable Audit Trail</h3>
                    <p>Complete chain-of-custody tracking with timestamped logs, user actions, and metadata preservation for compliance.</p>
                </div>
                 <div class="feature-card fade-in">
                    <div class="feature-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 16.5V9.75m0 0l-3 3m3-3l3 3M6.75 19.5a4.5 4.5 0 01-1.41-8.775 5.25 5.25 0 0110.233-2.33 3 3 0 013.758 3.848A3.752 3.752 0 0118 19.5H6.75z" /></svg></div>
                    <h3>Hybrid Cloud Storage</h3>
                    <p>Secure cloud-based storage with local backup options, automated redundancy, and enterprise-grade encryption.</p>
                </div>
                <div class="feature-card fade-in">
                    <div class="feature-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" /></svg></div>
                    <h3>Real-time Monitoring</h3>
                    <p>24/7 system monitoring with instant alerts for unauthorized access attempts, system anomalies, and security breaches.</p>
                </div>
                <div class="feature-card fade-in">
                    <div class="feature-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 1.5H8.25A2.25 2.25 0 006 3.75v16.5a2.25 2.25 0 002.25 2.25h7.5A2.25 2.25 0 0018 20.25V3.75a2.25 2.25 0 00-2.25-2.25H13.5m-3 0V3h3V1.5m-3 0h3m-3 18.75h3" /></svg></div>
                    <h3>Mobile Accessibility</h3>
                    <p>Secure mobile applications for field evidence collection, real-time verification, and remote access with top security.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Solutions Section -->
    <section class="solutions" id="solutions">
        <div class="section-container">
            <div class="section-header fade-in">
                <h2 style="color: white;">Industry Solutions</h2>
                <p>Tailored digital evidence management for various sectors and use cases.</p>
            </div>
            <div class="solutions-grid">
                <div class="solution-card fade-in">
                    <h3><svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M4 2a1 1 0 011 1v1h1a1 1 0 010 2H5v1h1a1 1 0 110 2H5v1h1a1 1 0 110 2H5v1h1a1 1 0 110 2H5v1a1 1 0 01-2 0V3a1 1 0 011-1zm11 1h-2a1 1 0 00-1 1v11a1 1 0 001 1h2a1 1 0 001-1V4a1 1 0 00-1-1z" clip-rule="evenodd" /></svg> Law Enforcement</h3>
                    <p>Comprehensive evidence management for police departments, detective units, and investigative agencies.</p>
                </div>
                <div class="solution-card fade-in">
                    <h3><svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M10.53 2.47a.75.75 0 010 1.06l-4.72 4.72h10.44a.75.75 0 010 1.5H5.81l4.72 4.72a.75.75 0 11-1.06 1.06l-6-6a.75.75 0 010-1.06l6-6a.75.75 0 011.06 0zM16.25 5h.75a.75.75 0 010 1.5h-.75a.75.75 0 010-1.5z" clip-rule="evenodd" /></svg> Legal Firms</h3>
                    <p>Secure evidence management for law firms, corporate legal departments, and litigation support.</p>
                </div>
                <div class="solution-card fade-in">
                    <h3><svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M3.5 2A1.5 1.5 0 002 3.5v1.256a1.5 1.5 0 00.124.62l3.36 6.719A1.5 1.5 0 007 13h6a1.5 1.5 0 001.516-1.105l2.067-6.202A1.5 1.5 0 0015.067 4H10V3.5A1.5 1.5 0 008.5 2h-5z" /><path d="M4 14a1 1 0 112 0 1 1 0 01-2 0zM14 14a1 1 0 112 0 1 1 0 01-2 0z" /></svg> Corporate Security</h3>
                    <p>Enterprise-grade security for internal investigations and incident response teams.</p>
                </div>
                <div class="solution-card fade-in">
                    <h3><svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M4.632 3.335A5.352 5.352 0 0110 5.25c2.196 0 4.113 1.28 4.965 3.123A5.352 5.352 0 0115.368 16.665 5.352 5.352 0 0110 14.75c-2.196 0-4.113-1.28-4.965-3.123A5.352 5.352 0 014.632 3.335z" /><path d="M10 12.25a2.25 2.25 0 100-4.5 2.25 2.25 0 000 4.5z" /></svg> Digital Forensics</h3>
                    <p>Specialized tools for forensic investigators and cybersecurity professionals.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Technology Stack Section -->
    <section class="tech-stack" id="technology">
        <div class="section-container">
            <div class="section-header fade-in">
                <h2>Our Technology Stack</h2>
                <p>We leverage a robust, modern technology stack to deliver unparalleled security, scalability, and performance for your critical digital evidence.</p>
            </div>
            <div class="tech-grid">
                <div class="tech-card fade-in">
                    <div class="tech-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M17.25 6.75L22.5 12l-5.25 5.25m-10.5 0L1.5 12l5.25-5.25m7.5-3l-4.5 15" /></svg></div>
                    <h3>Backend Framework</h3>
                    <p>Powered by Java Enterprise (JSP/Servlet) and the Spring Framework for mission-critical reliability and performance.</p>
                </div>
                <div class="tech-card fade-in">
                    <div class="tech-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.286zm0 13.036h.008v.008h-.008v-.008z" /></svg></div>
                    <h3>Military-Grade Encryption</h3>
                    <p>AES-256 for data at rest and in transit, complemented by SHA-256 hashing and a robust PKI infrastructure.</p>
                </div>
                <div class="tech-card fade-in">
                    <div class="tech-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M20.25 6.375c0 2.278-3.694 4.125-8.25 4.125S3.75 8.653 3.75 6.375m16.5 0c0-2.278-3.694-4.125-8.25-4.125S3.75 4.097 3.75 6.375m16.5 0v11.25c0 2.278-3.694 4.125-8.25 4.125s-8.25-1.847-8.25-4.125V6.375" /></svg></div>
                    <h3>Database Systems</h3>
                    <p>Enterprise-grade MySQL and PostgreSQL with clustering, replication, and automated backup for ultimate data integrity.</p>
                </div>
                <div class="tech-card fade-in">
                    <div class="tech-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244" /></svg></div>
                    <h3>Blockchain Ledger</h3>
                    <p>Private blockchain integration (Hyperledger Fabric) to create an immutable, tamper-proof audit trail for every action.</p>
                </div>
                 <div class="tech-card fade-in">
                    <div class="tech-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 008.716-6.747M12 21a9.004 9.004 0 01-8.716-6.747M12 21V3M12 3a9.004 9.004 0 00-8.716 6.747M12 3c4.805 0 8.716 3.91 8.716 8.747" /></svg></div>
                    <h3>Web Server</h3>
                    <p>High-performance Apache Tomcat server, configured with load balancing and failover for high availability.</p>
                </div>
                <div class="tech-card fade-in">
                    <div class="tech-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 16.5V9.75m0 0l-3 3m3-3l3 3M6.75 19.5a4.5 4.5 0 01-1.41-8.775 5.25 5.25 0 0110.233-2.33 3 3 0 013.758 3.848A3.752 3.752 0 0118 19.5H6.75z" /></svg></div>
                    <h3>Cloud Infrastructure</h3>
                    <p>Deployed on secure AWS & Azure environments with auto-scaling, advanced monitoring, and disaster recovery plans.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact" id="contact">
        <div class="section-container">
            <div class="section-header fade-in">
                <h2>Get In Touch</h2>
                <p>Have questions about our security protocols or need a personalized demo? Reach out to our team, and we'll get back to you within 24 hours.</p>
            </div>
            <div class="contact-grid fade-in">
                <div class="contact-info">
                    <h3>Contact Information</h3>
                    <p>Our experts are available to discuss your specific needs for digital evidence management. We're here to help you build a more secure and compliant workflow.</p>
                    <ul class="contact-details-list">
                        <li>
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M9.69 18.933l.003.001C9.89 19.02 10 19 10 19s.11.02.308-.066l.002-.001.006-.003.018-.008a5.741 5.741 0 00.281-.14c.186-.096.446-.24.757-.433.62-.384 1.445-.976 2.274-1.765C15.302 14.988 17 12.493 17 9A7 7 0 103 9c0 3.492 1.698 5.988 3.355 7.584a13.731 13.731 0 002.273 1.765 11.842 11.842 0 00.757.433.57.57 0 00.28.14l.018.008.006.003zM10 11.25a2.25 2.25 0 100-4.5 2.25 2.25 0 000 4.5z" clip-rule="evenodd" /></svg>
                            <span>123 Security Plaza, Suite 500, Tech City, 10101</span>
                        </li>
                        <li>
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M2 3.5A1.5 1.5 0 013.5 2h1.148a1.5 1.5 0 011.465 1.175l.716 3.578a1.5 1.5 0 01-1.305 1.762l-1.104.442a1.5 1.5 0 00-1.07 2.13l3.293 3.293a1.5 1.5 0 002.13-1.07l.442-1.104a1.5 1.5 0 011.762-1.305l3.578.716A1.5 1.5 0 0118 15.352V16.5a1.5 1.5 0 01-1.5 1.5h-10A1.5 1.5 0 015 16.5v-3.865a1.5 1.5 0 01.358-1.002l.49-1.225L4.05 9.174A1.5 1.5 0 012 7.71V3.5z" /></svg>
                            <span>+1 (555) 123-4567</span>
                        </li>
                        <li>
                            <svg class="icon-style" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M3 4a2 2 0 00-2 2v1.161l8.441 4.221a1.25 1.25 0 001.118 0L19 7.162V6a2 2 0 00-2-2H3z" /><path d="M19 8.839l-7.77 3.885a2.75 2.75 0 01-2.46 0L1 8.839V14a2 2 0 002 2h14a2 2 0 002-2V8.839z" /></svg>
                            <span>support@securechain.com</span>
                        </li>
                    </ul>
                </div>
                <div class="contact-form">
                    <form action="#" method="POST">
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Your Message</label>
                            <textarea id="message" name="message" required></textarea>
                        </div>
                        <button type="submit" class="submit-btn">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>SecureChain</h3>
                <p>The gold standard in secure digital evidence management for professionals.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#solutions">Solutions</a></li>
                    <li><a href="#technology">Technology</a></li>
                    <li><a href="#">Security Whitepaper</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Company</h3>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Compliance</a></li>
                    <li><a href="#">Press</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <ul>
                    <li>
                        <span class="contact-link">
                           <svg class="icon-style" style="width:1rem; height:1rem;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M2 3.5A1.5 1.5 0 013.5 2h1.148a1.5 1.5 0 011.465 1.175l.716 3.578a1.5 1.5 0 01-1.305 1.762l-1.104.442a1.5 1.5 0 00-1.07 2.13l3.293 3.293a1.5 1.5 0 002.13-1.07l.442-1.104a1.5 1.5 0 011.762-1.305l3.578.716A1.5 1.5 0 0118 15.352V16.5a1.5 1.5 0 01-1.5 1.5h-10A1.5 1.5 0 015 16.5v-3.865a1.5 1.5 0 01.358-1.002l.49-1.225L4.05 9.174A1.5 1.5 0 012 7.71V3.5z" /></svg>
                           +1 (555) 123-4567
                        </span>
                    </li>
                    <li>
                        <a href="mailto:support@securechain.com">
                            <svg class="icon-style" style="width:1rem; height:1rem;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path d="M3 4a2 2 0 00-2 2v1.161l8.441 4.221a1.25 1.25 0 001.118 0L19 7.162V6a2 2 0 00-2-2H3z" /><path d="M19 8.839l-7.77 3.885a2.75 2.75 0 01-2.46 0L1 8.839V14a2 2 0 002 2h14a2 2 0 002-2V8.839z" /></svg>
                            support@securechain.com
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2025 SecureChain. All rights reserved. | Privacy Policy | Terms of Service</p>
        </div>
    </footer>
    
    <script>
        // All Javascript remains the same
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });
        });

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

        document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));
    </script>
</body>
</html>