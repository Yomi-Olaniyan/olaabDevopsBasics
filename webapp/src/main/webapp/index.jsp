<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker & K8s Automation Guide</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Georgia', serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .carousel-container {
            max-width: 900px;
            margin: 0 auto;
            position: relative;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .carousel-header {
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .carousel-header h1 {
            font-size: 2.5em;
            font-weight: bold;
            text-decoration: underline;
            margin-bottom: 15px;
        }

        .carousel-wrapper {
            position: relative;
            overflow: hidden;
            height: 600px;
        }

        .carousel-slides {
            display: flex;
            transition: transform 0.5s ease;
            height: 100%;
        }

        .slide {
            min-width: 100%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            background: white;
        }

        .slide h2 {
            color: #2c3e50;
            font-size: 1.8em;
            font-weight: bold;
            margin-bottom: 20px;
            text-decoration: underline;
        }

        .slide h3 {
            color: #e74c3c;
            font-size: 1.4em;
            font-weight: bold;
            margin: 25px 0 15px 0;
        }

        .slide p {
            line-height: 1.6;
            font-size: 1.1em;
            color: #34495e;
            margin-bottom: 15px;
        }

        .table-container {
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: bold;
            font-size: 1.1em;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            background: #f8f9fa;
        }

        td:first-child {
            font-family: 'Courier New', monospace;
            background: #e9ecef;
            font-weight: bold;
            color: #495057;
        }

        tr:hover {
            background: #e3f2fd;
        }

        .navigation {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 15px;
        }

        .nav-btn {
            padding: 12px 25px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .nav-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .nav-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            transform: none;
        }

        .slide-counter {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9em;
        }

        .progress-bar {
            height: 4px;
            background: #ddd;
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            transition: width 0.5s ease;
        }

        @media (max-width: 768px) {
            .carousel-container {
                margin: 10px;
            }
            
            .slide {
                padding: 20px;
            }
            
            .carousel-header h1 {
                font-size: 2em;
            }
            
            .slide h2 {
                font-size: 1.5em;
            }
            
            table, th, td {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <div class="carousel-container">
        <div class="carousel-header">
            <h1>AUTOMATION TOOLS!</h1>
            <p>Using automation tools like Jenkins and Kubernetes can feel like one is in hell from the beginning!</p>
            <p>For the sake of fellow trainees, this guide will help you overcome the teething challenges. I've removed the redundancies and details capable of confusing you.</p>
            <p><strong>Let's separate the wheat from the chaff</strong></p>
        </div>

        <div class="carousel-wrapper">
            <div class="carousel-slides" id="slides">
                <!-- Slide 1: Docker Introduction -->
                <div class="slide">
                    <h2>Docker Is a Powerful Tool!!!</h2>
                    <p>Of all things you should know about Docker, you should know what it does and why you're using it.</p>
                    
                    <p>Docker is a containerization tool. It helps put your IMAGE inside a container. The very first challenge of most trainees like yours truly is the technical terms. So, for ease of understanding, the word 'IMAGE' in a context can mean contents that are served on over web page or, put simply, contents of a web page(website).</p>
                    
                    <p>Another technical term industry players use is 'APPLICATION'. Whenever either of both terms is used just know they are either talking about what will be displayed on a web server or they are talking about a part of a 3-tier product that the public can see or interact with even though it is more technical than what is described above – it's been oversimplified already! Lol…</p>
                    
                    <p>An Image or App can also be the totality of a 3-tier product, which comprises of the frontend, the backend and the database – only a part of it that is served over the web page is the one they want you to see or interact with.</p>
                </div>

                <!-- Slide 2: Base Images -->
                <div class="slide">
                    <h2>IMAGE, WEBAPP, DOCKERFILE – Manual Deployment</h2>
                    <p>Your image is ready? What's next?</p>
                    
                    <p>You need a BASE!!! This is another term that sends neophytes into utter confusion, and a thousand questions start running in their head: "What is a base?" "Why do we need it?" Put simply, a Base is a copy or model of another person's image that you want to model your own image after. It is like a foundation on which you lay your own product.</p>
                    
                    <p>Another Question! Does it mean we can't build an image without a base? No! You can well build an image without a base. In fact, we don't need a base to build an image – if you follow from where we started above, it shows we had an image before mentioning anything called base. So why do we need it? So that we can use somebody else's work to model ours.</p>
                </div>

                <!-- Slide 3: Types of Bases -->
                <div class="slide">
                    <h2>TYPES OF BASES/IMAGES</h2>
                    <p>There are images for web service! There are images for Database! Ok? Does that make sense to you?</p>
                    
                    <p>So how do we choose or know which images to use or adopt? It depends on the purpose of building our own image or the purpose our image intends to serve. For example, if our image is meant to only be the type whose contents shall be displayed when anyone – be it members of our company, family, or public – browses our website, then the image type for that purpose is one that delivers web contents or performs web services.</p>
                    
                    <p>Examples of such are (but not limited to): nginx, apache2/httpd, and TOMCAT! Yes, that same TOMCAT you've been hearing in class. Is it making a little sense now?</p>
                    
                    <p>Don't forget our question above, ok? Next question: how do I know which one to choose from nginx, apache2/httpd, or TOMCAT? This answer lies in the kind of language with which your own image was written and the kind of contents that will be served by your web page when is ready!</p>
                    
                    <p><strong>For example:</strong></p>
                </div>

                <!-- Slide 4: Base Images Table -->
                <div class="slide">
                    <h2>Base Images & Their Purposes</h2>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Purpose</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>nginx</td>
                                    <td>Static file web server / reverse proxy</td>
                                </tr>
                                <tr>
                                    <td>httpd (Apache)</td>
                                    <td>Full-featured web server</td>
                                </tr>
                                <tr>
                                    <td>node</td>
                                    <td>Can run a custom HTTP server with JS</td>
                                </tr>
                                <tr>
                                    <td>python</td>
                                    <td>With Flask or Django + <code>gunicorn</code> or <code>uvicorn</code></td>
                                </tr>
                                <tr>
                                    <td>tomcat</td>
                                    <td>Java-based web app container (serves .war)</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Slide 5: Use Cases Table -->
                <div class="slide">
                    <h2>Choosing the Right Base Image</h2>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Use Case</th>
                                    <th>Typical Base Image / Tool</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Java web app (.war)</td>
                                    <td><code>tomcat</code></td>
                                </tr>
                                <tr>
                                    <td>Static website (HTML/CSS/JS)</td>
                                    <td><code>nginx</code>, <code>httpd</code></td>
                                </tr>
                                <tr>
                                    <td>Node.js or Python Flask app</td>
                                    <td>Base image + run via <code>CMD</code></td>
                                </tr>
                                <tr>
                                    <td>API backend w/ reverse proxy</td>
                                    <td>App container + <code>nginx</code> as proxy</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="slide-counter">
                <span id="currentSlide">1</span> / <span id="totalSlides">5</span>
            </div>

            <div class="progress-bar">
                <div class="progress-fill" id="progressFill"></div>
            </div>
        </div>

        <div class="navigation">
            <button class="nav-btn" id="prevBtn" onclick="changeSlide(-1)">← Previous</button>
            <button class="nav-btn" id="nextBtn" onclick="changeSlide(1)">Next →</button>
        </div>
    </div>

    <script>
        let currentSlideIndex = 0;
        const slides = document.getElementById('slides');
        const totalSlides = slides.children.length;
        const progressFill = document.getElementById('progressFill');
        const currentSlideSpan = document.getElementById('currentSlide');
        const totalSlidesSpan = document.getElementById('totalSlides');
        const prevBtn = document.getElementById('prevBtn');
        const nextBtn = document.getElementById('nextBtn');

        totalSlidesSpan.textContent = totalSlides;

        function updateSlide() {
            const translateX = -currentSlideIndex * 100;
            slides.style.transform = `translateX(${translateX}%)`;
            
            const progressPercent = ((currentSlideIndex + 1) / totalSlides) * 100;
            progressFill.style.width = `${progressPercent}%`;
            
            currentSlideSpan.textContent = currentSlideIndex + 1;
            
            prevBtn.disabled = currentSlideIndex === 0;
            nextBtn.disabled = currentSlideIndex === totalSlides - 1;
        }

        function changeSlide(direction) {
            const newIndex = currentSlideIndex + direction;
            
            if (newIndex >= 0 && newIndex < totalSlides) {
                currentSlideIndex = newIndex;
                updateSlide();
            }
        }

        // Keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowLeft') {
                changeSlide(-1);
            } else if (e.key === 'ArrowRight') {
                changeSlide(1);
            }
        });

        // Initialize
        updateSlide();

        // Auto-advance (optional - uncomment to enable)
        /*
        setInterval(function() {
            if (currentSlideIndex < totalSlides - 1) {
                changeSlide(1);
            } else {
                currentSlideIndex = 0;
                updateSlide();
            }
        }, 10000); // 10 seconds
        */
    </script>
</body>
</html>
