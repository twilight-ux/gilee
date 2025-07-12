<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Belajar Bareng.com</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            user-select: none;
            overflow: hidden;
            touch-action: none;
        }
        
        body {
            background-color: #0000ff;
            color: red;
            font-family: 'Courier New', monospace;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 9999;
        }
        
        #virus-text {
            font-size: 3rem;
            font-weight: bold;
            text-align: center;
            animation: glitch 1s linear infinite;
            margin-bottom: 2rem;
        }
        
        #fake-warning {
            color: white;
            font-size: 1.2rem;
            text-align: center;
            margin-bottom: 3rem;
            padding: 0 1rem;
        }
        
        #fake-progress {
            width: 80%;
            height: 20px;
            background-color: #333;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        #progress-bar {
            height: 100%;
            width: 0%;
            background-color: red;
            animation: progress 10s linear infinite;
        }
        
        .hidden-btn {
            position: absolute;
            width: 50px;
            height: 50px;
            opacity: 0;
            cursor: pointer;
        }
        
        .hidden-btn:nth-child(1) { top: 10%; left: 10%; }
        .hidden-btn:nth-child(2) { top: 80%; left: 20%; }
        .hidden-btn:nth-child(3) { bottom: 15%; right: 15%; }
        .hidden-btn:nth-child(4) { top: 30%; right: 30%; }
        .hidden-btn:nth-child(5) { bottom: 40%; left: 40%; }
        
        @keyframes glitch {
            0% { text-shadow: 2px 0 0 red; }
            20% { text-shadow: -2px 0 0 lime; }
            40% { text-shadow: -2px -2px 0 blue; }
            60% { text-shadow: 2px 2px 0 yellow; }
            80% { text-shadow: 2px -2px 0 purple; }
            100% { text-shadow: -2px 0 0 red; }
        }
        
        @keyframes progress {
            0% { width: 0%; }
            50% { width: 50%; }
            100% { width: 100%; }
        }
    </style>
</head>
<body>
    <div id="virus-text">VIRUS DETECTED!</div>
    <div id="fake-warning">
        Warning: Your device has been infected with malware. Scanning system files...
        <br><br>
        Do not turn off your device. This may take several minutes.
    </div>
    <div id="fake-progress">
        <div id="progress-bar"></div>
    </div>
    
    <!-- Hidden exit buttons (need to click 5 times) -->
    <button class="hidden-btn"></button>
    <button class="hidden-btn"></button>
    <button class="hidden-btn"></button>
    <button class="hidden-btn"></button>
    <button class="hidden-btn"></button>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Make fullscreen
            function requestFullscreen() {
                const elem = document.documentElement;
                if (elem.requestFullscreen) {
                    elem.requestFullscreen();
                } else if (elem.webkitRequestFullscreen) {
                    elem.webkitRequestFullscreen();
                } else if (elem.msRequestFullscreen) {
                    elem.msRequestFullscreen();
                }
            }
            
            requestFullscreen();
            
            // Prevent context menu
            document.addEventListener('contextmenu', function(e) {
                e.preventDefault();
            });
            
            // Prevent back button
            history.pushState(null, null, document.title);
            window.addEventListener('popstate', function () {
                history.pushState(null, null, document.title);
            });
            
            // Track clicks on hidden buttons
            let clickCount = 0;
            const hiddenBtns = document.querySelectorAll('.hidden-btn');
            const requiredClicks = 5;
            
            hiddenBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    clickCount++;
                    if (clickCount >= requiredClicks) {
                        // Create exit effect
                        document.body.style.animation = 'fadeOut 0.5s forwards';
                        setTimeout(() => {
                            // Exit fullscreen if supported
                            if (document.exitFullscreen) {
                                document.exitFullscreen();
                            } else if (document.webkitExitFullscreen) {
                                document.webkitExitFullscreen();
                            } else if (document.msExitFullscreen) {
                                document.msExitFullscreen();
                            }
                            window.location.href = 'about:blank';
                        }, 500);
                    }
                });
            });
            
            // Add fake error messages periodically
            setInterval(() => {
                const fakeMessages = [
                    "Error: Malware signature detected",
                    "System files corrupted",
                    "Scanning network connections...",
                    "Attempting quarantine... failed",
                    "Threat level: CRITICAL",
                    "Device compromised",
                    "Data collection in progress"
                ];
                
                const randomMessage = fakeMessages[Math.floor(Math.random() * fakeMessages.length)];
                const warningElement = document.getElementById('fake-warning');
                warningElement.textContent = randomMessage;
                
                // Randomly change virus text color
                document.getElementById('virus-text').style.color = 
                    `rgb(${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 56)}, ${Math.floor(Math.random() * 56)})`;
                
            }, 3000);
        });
    </script>
</body>
</html>

