<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savannah CI/CD Pipeline</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(
                135deg,
                #87CEEB 0%,
                #4682B4 25%,
                #F4A460 50%,
                #DEB887 75%,
                #D2691E 100%
            );
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        .savannah-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(255,215,0,0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255,165,0,0.2) 0%, transparent 50%),
                linear-gradient(180deg, #87CEEB 0%, #4682B4 30%, #F4A460 60%, #DEB887 85%, #D2691E 100%);
            z-index: -2;
        }

        .clouds {
            position: fixed;
            top: 10%;
            width: 100%;
            height: 200px;
            background: 
                radial-gradient(ellipse 200px 50px at 25% 50%, rgba(255,255,255,0.8) 0%, transparent 70%),
                radial-gradient(ellipse 150px 40px at 75% 30%, rgba(255,255,255,0.6) 0%, transparent 70%),
                radial-gradient(ellipse 180px 45px at 50% 70%, rgba(255,255,255,0.7) 0%, transparent 70%);
            animation: drift 20s ease-in-out infinite;
            z-index: -1;
        }

        @keyframes drift {
            0%, 100% { transform: translateX(0px); }
            50% { transform: translateX(30px); }
        }

        .feline-silhouette {
            position: fixed;
            bottom: 20%;
            right: 10%;
            width: 120px;
            height: 80px;
            background: linear-gradient(45deg, #8B4513, #A0522D);
            border-radius: 50px 20px 20px 50px;
            opacity: 0.7;
            z-index: -1;
            animation: tail-sway 3s ease-in-out infinite;
        }

        .feline-silhouette::before {
            content: '';
            position: absolute;
            top: -20px;
            left: 10px;
            width: 40px;
            height: 40px;
            background: linear-gradient(45deg, #8B4513, #A0522D);
            border-radius: 50%;
        }

        .feline-silhouette::after {
            content: '';
            position: absolute;
            top: 10px;
            right: -60px;
            width: 80px;
            height: 8px;
            background: linear-gradient(90deg, #8B4513, transparent);
            border-radius: 20px;
            animation: tail-wave 2s ease-in-out infinite;
        }

        @keyframes tail-sway {
            0%, 100% { transform: rotate(0deg); }
            50% { transform: rotate(2deg); }
        }

        @keyframes tail-wave {
            0%, 100% { transform: rotate(0deg); }
            50% { transform: rotate(10deg); }
        }

        .cheetah {
            position: fixed;
            bottom: 15%;
            left: 5%;
            width: 100px;
            height: 60px;
            background: linear-gradient(135deg, #DAA520, #B8860B);
            border-radius: 30px 15px 15px 30px;
            opacity: 0.6;
            z-index: -1;
            animation: prowl 4s ease-in-out infinite;
        }

        .cheetah::before {
            content: '';
            position: absolute;
            top: -15px;
            left: 5px;
            width: 30px;
            height: 30px;
            background: linear-gradient(135deg, #DAA520, #B8860B);
            border-radius: 50%;
        }

        @keyframes prowl {
            0%, 100% { transform: translateX(0px) scaleX(1); }
            50% { transform: translateX(20px) scaleX(1.1); }
        }

        .grass-blade {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 150px;
            background: linear-gradient(180deg, transparent 0%, rgba(107,142,35,0.3) 50%, rgba(85,107,47,0.5) 100%);
            z-index: -1;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
            position: relative;
            z-index: 10;
        }

        .content-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 
                0 20px 40px rgba(0,0,0,0.1),
                0 0 0 1px rgba(255,255,255,0.2),
                inset 0 1px 0 rgba(255,255,255,0.3);
            border: 2px solid rgba(255,215,0,0.3);
            animation: glow 3s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from { box-shadow: 0 20px 40px rgba(0,0,0,0.1), 0 0 20px rgba(255,215,0,0.2); }
            to { box-shadow: 0 25px 50px rgba(0,0,0,0.15), 0 0 30px rgba(255,215,0,0.4); }
        }

        h1 {
            color: #FF6B35;
            text-align: center;
            margin: 30px 0;
            font-size: 2.5em;
            font-weight: bold;
            text-shadow: 
                3px 3px 0px #FF8C00,
                6px 6px 10px rgba(255,140,0,0.3);
            background: linear-gradient(45deg, #FF6B35, #FF8C00, #FFD700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        h2 {
            color: #2C5530;
            margin: 25px 0 15px 0;
            font-size: 1.4em;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(44,85,48,0.2);
            border-left: 5px solid #FF6B35;
            padding-left: 15px;
            background: linear-gradient(90deg, rgba(255,107,53,0.1), transparent);
            padding: 10px 15px;
            border-radius: 0 10px 10px 0;
        }

        h3 {
            color: #8B4513;
            margin: 20px 0 10px 0;
            font-size: 1.2em;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(139,69,19,0.2);
            background: linear-gradient(45deg, rgba(218,165,32,0.2), rgba(184,134,11,0.1));
            padding: 8px 12px;
            border-radius: 8px;
            border-left: 3px solid #DAA520;
        }

        .highlight {
            background: linear-gradient(120deg, rgba(255,215,0,0.3), rgba(255,140,0,0.2));
            padding: 2px 6px;
            border-radius: 4px;
            font-weight: bold;
        }

        .devops-title {
            text-align: center;
            font-size: 3em;
            margin: 40px 0;
            background: linear-gradient(45deg, #FF6B35, #FFD700, #32CD32, #1E90FF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 0 20px rgba(255,107,53,0.3);
            animation: rainbow 4s ease-in-out infinite;
        }

        @keyframes rainbow {
            0%, 100% { filter: hue-rotate(0deg); }
            50% { filter: hue-rotate(180deg); }
        }

        .questions-section {
            background: linear-gradient(135deg, rgba(70,130,180,0.1), rgba(135,206,235,0.1));
            padding: 25px;
            border-radius: 15px;
            margin-top: 30px;
            border: 1px solid rgba(70,130,180,0.2);
        }

        .acacia-tree {
            position: fixed;
            bottom: 10%;
            right: 25%;
            width: 80px;
            height: 120px;
            z-index: -1;
            opacity: 0.4;
        }

        .acacia-tree::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 8px;
            height: 60px;
            background: linear-gradient(180deg, #8B4513, #A0522D);
            border-radius: 4px;
        }

        .acacia-tree::after {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 60px;
            background: radial-gradient(ellipse, rgba(107,142,35,0.6) 0%, transparent 70%);
            border-radius: 50%;
        }

        .sun {
            position: fixed;
            top: 15%;
            right: 15%;
            width: 100px;
            height: 100px;
            background: radial-gradient(circle, #FFD700 0%, #FFA500 70%, transparent 100%);
            border-radius: 50%;
            opacity: 0.8;
            z-index: -1;
            animation: sun-glow 4s ease-in-out infinite;
        }

        @keyframes sun-glow {
            0%, 100% { 
                box-shadow: 0 0 20px rgba(255,215,0,0.4), 0 0 40px rgba(255,165,0,0.2); 
                transform: scale(1);
            }
            50% { 
                box-shadow: 0 0 30px rgba(255,215,0,0.6), 0 0 60px rgba(255,165,0,0.3); 
                transform: scale(1.1);
            }
        }

        @media (max-width: 768px) {
            .container { padding: 20px 10px; }
            .content-card { padding: 25px; }
            h1 { font-size: 2em; }
            .devops-title { font-size: 2.2em; }
            .feline-silhouette, .cheetah { display: none; }
        }
    </style>
</head>
<body>
    <div class="savannah-bg"></div>
    <div class="clouds"></div>
    <div class="sun"></div>
    <div class="feline-silhouette"></div>
    <div class="cheetah"></div>
    <div class="acacia-tree"></div>
    <div class="grass-blade"></div>

    <div class="container">
        <div class="content-card">
            <h2><strong>Creating a complete CI/CD Pipeline using a single server as both my Jenkins and Docker Server.</strong></h2>
            
            <h2><strong>Given that it is only one Ubuntu server functioning as both a Docker and Jenkins server, it is important</strong></h2>
            
            <h2><strong>to note that  <span class="highlight">jenkins is added to the docker group</span> if docker commands will be accepted on that server.</strong></h2>
            
            <div class="devops-title">
                <strong>DEVOPS MAKES AUTOMATION REALLY INTERESTING!</strong>
            </div>
            
            <div class="questions-section">
                <h2>QUESTIONS:</h2>
                <h3>1. What happens if the dockerfile has its owner and group changed recursively to 'olaab'?</h3>
            </div>
        </div>
    </div>
</body>
</html>
