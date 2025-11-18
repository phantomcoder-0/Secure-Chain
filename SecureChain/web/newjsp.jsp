<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evidence Management Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            color: white;
        }

        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .dashboard-header {
            text-align: center;
            color: white;
            margin-bottom: 3rem;
        }

        .dashboard-header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .dashboard-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .upload-icon {
            background: linear-gradient(45deg, #4CAF50, #45a049);
        }

        .verify-icon {
            background: linear-gradient(45deg, #2196F3, #1976D2);
        }

        .card h2 {
            color: #333;
            font-size: 1.3rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #555;
        }

        .file-input-wrapper {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .file-input {
            width: 100%;
            padding: 0.75rem;
            border: 2px dashed #ddd;
            border-radius: 8px;
            background: #f9f9f9;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-input:hover {
            border-color: #667eea;
            background: #f0f4ff;
        }

        .file-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        .result-area {
            margin-top: 2rem;
            padding: 1rem;
            border-radius: 8px;
            display: none;
        }

        .result-success {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }

        .result-error {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }

        .result-info {
            background: #d1ecf1;
            border: 1px solid #bee5eb;
            color: #0c5460;
        }

        .file-info {
            display: none;
            margin-top: 1rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }

        .file-info h4 {
            margin-bottom: 0.5rem;
            color: #333;
        }

        .file-info p {
            margin: 0.25rem 0;
            color: #666;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #666;
            font-size: 0.9rem;
        }

        .progress-bar {
            width: 100%;
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            margin-top: 1rem;
            overflow: hidden;
            display: none;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
            transition: width 0.3s ease;
            width: 0%;
        }

        @keyframes pulse {
            0% { opacity: 1; }
            50% { opacity: 0.7; }
            100% { opacity: 1; }
        }

        .loading {
            animation: pulse 1.5s infinite;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">
            ? Evidence Management System
        </div>
        <div class="user-info">
            <span id="welcomeUser">Welcome, User</span>
            <button class="logout-btn" onclick="logout()">Logout</button>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <h1>Evidence Management Dashboard</h1>
            <p>Secure file upload and verification system with SHA-256 hashing</p>
        </div>

        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number" id="totalFiles">0</div>
                <div class="stat-label">Total Files</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="verifiedFiles">0</div>
                <div class="stat-label">Verified Today</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="uploadedFiles">0</div>
                <div class="stat-label">Uploaded Today</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="systemStatus">?</div>
                <div class="stat-label">System Status</div>
            </div>
        </div>

        <!-- Main Dashboard Grid -->
        <div class="dashboard-grid">
            <!-- Upload Evidence Card -->
            <div class="card">
                <div class="card-header">
                    <div class="card-icon upload-icon">?</div>
                    <h2>Upload Evidence File</h2>
                </div>
                
                <form id="uploadForm" enctype="multipart/form-data" action="/evidence/upload" method="post">
                    <div class="form-group">
                        <label for="evidenceFile">Select Evidence File:</label>
                        <input type="file" id="evidenceFile" name="evidenceFile" class="file-input" 
                               accept=".pdf,.doc,.docx,.jpg,.jpeg,.png,.txt,.mp4,.avi" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description (Optional):</label>
                        <textarea id="description" name="description" rows="3" 
                                style="width: 100%; padding: 0.75rem; border: 1px solid #ddd; border-radius: 5px; resize: vertical;"
                                placeholder="Brief description of the evidence file..."></textarea>
                    </div>
                    
                    <button type="submit" class="btn" id="uploadBtn">
                        Upload Evidence
                    </button>
                    
                    <div class="progress-bar" id="uploadProgress">
                        <div class="progress-fill" id="uploadProgressFill"></div>
                    </div>
                </form>
                
                <div class="result-area" id="uploadResult"></div>
                
                <div class="file-info" id="uploadFileInfo">
                    <h4>File Information:</h4>
                    <p><strong>Name:</strong> <span id="uploadFileName"></span></p>
                    <p><strong>Size:</strong> <span id="uploadFileSize"></span></p>
                    <p><strong>Type:</strong> <span id="uploadFileType"></span></p>
                    <p><strong>SHA-256 Hash:</strong> <span id="uploadFileHash"></span></p>
                    <p><strong>Upload Time:</strong> <span id="uploadTime"></span></p>
                </div>
            </div>

            <!-- Verify Evidence Card -->
            <div class="card">
                <div class="card-header">
                    <div class="card-icon verify-icon">?</div>
                    <h2>Verify Evidence File</h2>
                </div>
                
                <form id="verifyForm" enctype="multipart/form-data" action="/evidence/verify" method="post">
                    <div class="form-group">
                        <label for="verifyFile">Select File to Verify:</label>
                        <input type="file" id="verifyFile" name="verifyFile" class="file-input" 
                               accept=".pdf,.doc,.docx,.jpg,.jpeg,.png,.txt,.mp4,.avi" required>
                    </div>
                    
                    <button type="submit" class="btn" id="verifyBtn">
                        Verify Evidence
                    </button>
                    
                    <div class="progress-bar" id="verifyProgress">
                        <div class="progress-fill" id="verifyProgressFill"></div>
                    </div>
                </form>
                
                <div class="result-area" id="verifyResult"></div>
                
                <div class="file-info" id="verifyFileInfo">
                    <h4>Verification Results:</h4>
                    <p><strong>File Name:</strong> <span id="verifyFileName"></span></p>
                    <p><strong>Computed Hash:</strong> <span id="verifyFileHash"></span></p>
                    <p><strong>Status:</strong> <span id="verifyStatus"></span></p>
                    <p><strong>Original Upload:</strong> <span id="originalUpload"></span></p>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Session check and user authentication
        function checkSession() {
            const user = sessionStorage.getItem('currentUser');
            if (!user) {
                alert('Session expired. Please login again.');
                window.location.href = '/login.jsp';
                return false;
            }
            document.getElementById('welcomeUser').textContent = `Welcome, ${user}`;
            return true;
        }

        // Logout function
        function logout() {
            sessionStorage.removeItem('currentUser');
            localStorage.removeItem('evidenceHashes');
            alert('Logged out successfully');
            window.location.href = '/login.jsp';
        }

        // Initialize evidence storage
        function initializeStorage() {
            if (!localStorage.getItem('evidenceHashes')) {
                localStorage.setItem('evidenceHashes', JSON.stringify({}));
            }
            updateStats();
        }

        // Update statistics
        function updateStats() {
            const hashes = JSON.parse(localStorage.getItem('evidenceHashes') || '{}');
            const today = new Date().toDateString();
            
            let totalFiles = Object.keys(hashes).length;
            let verifiedToday = 0;
            let uploadedToday = 0;
            
            for (let hash in hashes) {
                if (hashes[hash].uploadDate === today) {
                    uploadedToday++;
                }
                if (hashes[hash].lastVerified === today) {
                    verifiedToday++;
                }
            }
            
            document.getElementById('totalFiles').textContent = totalFiles;
            document.getElementById('verifiedFiles').textContent = verifiedToday;
            document.getElementById('uploadedFiles').textContent = uploadedToday;
        }

        // SHA-256 hashing function
        async function calculateSHA256(file) {
            const buffer = await file.arrayBuffer();
            const hashBuffer = await crypto.subtle.digest('SHA-256', buffer);
            const hashArray = Array.from(new Uint8Array(hashBuffer));
            return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
        }

        // Format file size
        function formatFileSize(bytes) {
            if (bytes === 0) return '0 Bytes';
            const k = 1024;
            const sizes = ['Bytes', 'KB', 'MB', 'GB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
        }

        // Show progress bar
        function showProgress(progressId, fillId) {
            const progressBar = document.getElementById(progressId);
            const progressFill = document.getElementById(fillId);
            progressBar.style.display = 'block';
            progressFill.style.width = '0%';
            
            let width = 0;
            const interval = setInterval(() => {
                width += Math.random() * 30;
                if (width >= 90) {
                    clearInterval(interval);
                    progressFill.style.width = '90%';
                } else {
                    progressFill.style.width = width + '%';
                }
            }, 100);
            
            return interval;
        }

        // Hide progress bar
        function hideProgress(progressId, fillId) {
            const progressBar = document.getElementById(progressId);
            const progressFill = document.getElementById(fillId);
            progressFill.style.width = '100%';
            setTimeout(() => {
                progressBar.style.display = 'none';
                progressFill.style.width = '0%';
            }, 500);
        }

        // Upload form handler
        document.getElementById('uploadForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            if (!checkSession()) return;
            
            const fileInput = document.getElementById('evidenceFile');
            const file = fileInput.files[0];
            const description = document.getElementById('description').value;
            
            if (!file) {
                alert('Please select a file to upload');
                return;
            }
            
            const uploadBtn = document.getElementById('uploadBtn');
            const resultArea = document.getElementById('uploadResult');
            const fileInfo = document.getElementById('uploadFileInfo');
            
            uploadBtn.disabled = true;
            uploadBtn.textContent = 'Uploading...';
            uploadBtn.classList.add('loading');
            
            const progressInterval = showProgress('uploadProgress', 'uploadProgressFill');
            
            try {
                // Calculate SHA-256 hash
                const hash = await calculateSHA256(file);
                
                // Simulate upload process
                await new Promise(resolve => setTimeout(resolve, 1500));
                
                // Store in local storage (simulating database)
                const hashes = JSON.parse(localStorage.getItem('evidenceHashes') || '{}');
                const currentTime = new Date();
                const uploadData = {
                    filename: file.name,
                    size: file.size,
                    type: file.type,
                    hash: hash,
                    uploadDate: currentTime.toDateString(),
                    uploadTime: currentTime.toLocaleString(),
                    uploader: sessionStorage.getItem('currentUser'),
                    description: description
                };
                
                hashes[hash] = uploadData;
                localStorage.setItem('evidenceHashes', JSON.stringify(hashes));
                
                // Show success result
                resultArea.className = 'result-area result-success';
                resultArea.innerHTML = '? <strong>Evidence uploaded successfully!</strong><br>File has been securely stored with SHA-256 hash verification.';
                resultArea.style.display = 'block';
                
                // Show file information
                document.getElementById('uploadFileName').textContent = file.name;
                document.getElementById('uploadFileSize').textContent = formatFileSize(file.size);
                document.getElementById('uploadFileType').textContent = file.type || 'Unknown';
                document.getElementById('uploadFileHash').textContent = hash;
                document.getElementById('uploadTime').textContent = currentTime.toLocaleString();
                fileInfo.style.display = 'block';
                
                // Reset form
                document.getElementById('uploadForm').reset();
                updateStats();
                
            } catch (error) {
                resultArea.className = 'result-area result-error';
                resultArea.innerHTML = '? <strong>Upload failed:</strong> ' + error.message;
                resultArea.style.display = 'block';
            } finally {
                hideProgress('uploadProgress', 'uploadProgressFill');
                uploadBtn.disabled = false;
                uploadBtn.textContent = 'Upload Evidence';
                uploadBtn.classList.remove('loading');
            }
        });

        // Verify form handler
        document.getElementById('verifyForm').addEventListener('submit', async function(e) {
            e.preventDefault();
            
            if (!checkSession()) return;
            
            const fileInput = document.getElementById('verifyFile');
            const file = fileInput.files[0];
            
            if (!file) {
                alert('Please select a file to verify');
                return;
            }
            
            const verifyBtn = document.getElementById('verifyBtn');
            const resultArea = document.getElementById('verifyResult');
            const fileInfo = document.getElementById('verifyFileInfo');
            
            verifyBtn.disabled = true;
            verifyBtn.textContent = 'Verifying...';
            verifyBtn.classList.add('loading');
            
            const progressInterval = showProgress('verifyProgress', 'verifyProgressFill');
            
            try {
                // Calculate SHA-256 hash
                const hash = await calculateSHA256(file);
                
                // Simulate verification process
                await new Promise(resolve => setTimeout(resolve, 1500));
                
                // Check against stored hashes
                const hashes = JSON.parse(localStorage.getItem('evidenceHashes') || '{}');
                const storedData = hashes[hash];
                
                // Update file info
                document.getElementById('verifyFileName').textContent = file.name;
                document.getElementById('verifyFileHash').textContent = hash;
                
                if (storedData) {
                    // Evidence found and verified
                    resultArea.className = 'result-area result-success';
                    resultArea.innerHTML = '? <strong>Evidence is authentic!</strong><br>File integrity verified successfully.';
                    
                    document.getElementById('verifyStatus').innerHTML = '<span style="color: #28a745;">? Authentic</span>';
                    document.getElementById('originalUpload').textContent = storedData.uploadTime;
                    
                    // Update last verified date
                    storedData.lastVerified = new Date().toDateString();
                    hashes[hash] = storedData;
                    localStorage.setItem('evidenceHashes', JSON.stringify(hashes));
                    
                } else {
                    // Evidence not found or tampered
                    resultArea.className = 'result-area result-error';
                    resultArea.innerHTML = '? <strong>Evidence may be tampered!</strong><br>No matching hash found in the system.';
                    
                    document.getElementById('verifyStatus').innerHTML = '<span style="color: #dc3545;">? Not Found/Tampered</span>';
                    document.getElementById('originalUpload').textContent = 'N/A';
                }
                
                resultArea.style.display = 'block';
                fileInfo.style.display = 'block';
                updateStats();
                
            } catch (error) {
                resultArea.className = 'result-area result-error';
                resultArea.innerHTML = '? <strong>Verification failed:</strong> ' + error.message;
                resultArea.style.display = 'block';
            } finally {
                hideProgress('verifyProgress', 'verifyProgressFill');
                verifyBtn.disabled = false;
                verifyBtn.textContent = 'Verify Evidence';
                verifyBtn.classList.remove('loading');
            }
        });

        // File input change handlers
        document.getElementById('evidenceFile').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                console.log('Selected file for upload:', file.name);
            }
        });

        document.getElementById('verifyFile').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                console.log('Selected file for verification:', file.name);
            }
        });

        // Initialize dashboard
        window.onload = function() {
            // For demo purposes, set a default user
            if (!sessionStorage.getItem('currentUser')) {
                sessionStorage.setItem('currentUser', 'DemoUser');
            }
            
            if (checkSession()) {
                initializeStorage();
            }
        };
    </script>
</body>
</html>