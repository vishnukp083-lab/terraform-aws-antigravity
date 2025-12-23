#!/bin/bash
# Target directory
TARGET_DIR="/usr/share/nginx/html"
# Ensure target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR does not exist. Creating it."
    sudo mkdir -p "$TARGET_DIR"
fi
echo "Deploying The Vastra Studio to $TARGET_DIR..."
# Write index.html
sudo cat <<EOF > "$TARGET_DIR/index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Vastra Studio | Bespoke Tailoring</title>
    <!-- Premium Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;500&family=Great+Vibes&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="cursor-dot"></div>
    <div class="cursor-outline"></div>
    <!-- Fabric Texture Background -->
    <div class="fabric-bg"></div>
    <div class="vignette"></div>
    <div class="container">
        <div class="logo-wrapper">
            <svg class="logo-svg" viewBox="0 0 600 400" xmlns="http://www.w3.org/2000/svg">
                <defs>
                    <filter id="glow" x="-20%" y="-20%" width="140%" height="140%">
                        <feGaussianBlur stdDeviation="3" result="blur" />
                        <feComposite in="SourceGraphic" in2="blur" operator="over" />
                    </filter>
                    <linearGradient id="gold-gradient" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#bf953f;stop-opacity:1" />
                        <stop offset="50%" style="stop-color:#fcf6ba;stop-opacity:1" />
                        <stop offset="100%" style="stop-color:#b38728;stop-opacity:1" />
                    </linearGradient>
                </defs>
                <!-- 1. The stylized 'V' / Scissors / Needle integration -->
                <!-- Moved to align with text baseline y=220. Pivot is at y=10 inside group -->
                <!-- Adjusted to 228 based on verification (was 12px high) -->
                <g class="symbol-group" transform="translate(285, 228)">
                    <!-- Left blade/stroke -->
                    <path class="scissor-blade left-blade" d="M -8 -60 L 0 10" stroke="url(#gold-gradient)"
                        stroke-width="5" stroke-linecap="round" />
                    <!-- Right blade/stroke -->
                    <path class="scissor-blade right-blade" d="M 8 -60 L 0 10" stroke="url(#gold-gradient)"
                        stroke-width="5" stroke-linecap="round" />
                    <!-- Pivot point -->
                    <circle class="pivot" cx="0" cy="10" r="4" fill="#fff" />
                    <!-- Handles (Optional decoration for realism) -->
                    <circle class="handle left-handle" cx="-15" cy="-70" r="8" stroke="url(#gold-gradient)"
                        stroke-width="3" fill="none" opacity="0" />
                    <circle class="handle right-handle" cx="15" cy="-70" r="8" stroke="url(#gold-gradient)"
                        stroke-width="3" fill="none" opacity="0" />
                </g>
                <!-- 2. Main Text Path for "ASTRA" (V is the symbol above) -->
                <!-- Added explicit V that will fade in -->
                <text x="280" y="220" class="logo-text main-text v-text" style="opacity: 0">V</text>
                <!-- Moved Closer to V (x=325) -->
                <text x="325" y="220" class="logo-text main-text">ASTRA</text>
                <!-- The 'The' prefix -->
                <text x="210" y="220" class="logo-text prefix-text">The</text>
                <!-- 3. Subtext -->
                <text x="300" y="270" text-anchor="middle" class="logo-text sub-text">STUDIO</text>
                <!-- 4. Stitching Path - The golden thread -->
                <!-- A complex path that weaves through the text -->
                <path id="stitch-path" class="thread-path"
                    d="M 100 220 Q 150 150, 200 220 T 300 220 T 400 220 T 500 220" fill="none" stroke="#D4AF37"
                    stroke-width="1.5" stroke-dasharray="5,5" />
                <!-- 5. The Needle (Animated along the path) -->
                <g id="needle" class="needle-group">
                    <path d="M 0 0 L 40 -40" stroke="#f0f0f0" stroke-width="1.5" stroke-linecap="round" />
                    <circle cx="40" cy="-40" r="1.5" fill="#f0f0f0" />
                </g>
            </svg>
        </div>
        <div class="tagline">Bespoke Tailoring & Design</div>
        <div class="cta-container">
            <button class="cta-btn">Explore Collection</button>
            <button id="download-btn" class="cta-btn"
                style="margin-left: 20px; border-color: #fff; color: #fff;">Download Logo</button>
        </div>
    </div>
    <!-- GSAP for robust timeline animation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/MotionPathPlugin.min.js"></script>
    <script src="script.js"></script>
</body>
</html>
EOF
# Write style.css
sudo cat <<EOF > "$TARGET_DIR/style.css"
/* CSS Reset and Variables */
:root {
    --bg-color: #000000;
    /* Pure Black Background */
    --text-color: #D4AF37;
    /* Gold Main Text */
    --gold: #D4AF37;
    --gold-gradient: linear-gradient(135deg, #bf953f, #fcf6ba, #b38728, #fbf5b7, #aa771c);
    --font-serif: 'Cinzel', serif;
    --font-sans: 'Montserrat', sans-serif;
    --font-script: 'Great Vibes', cursive;
}
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    cursor: none;
}
body {
    background-color: var(--bg-color);
    color: var(--text-color);
    font-family: var(--font-sans);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    position: relative;
}
/* Fabric Background Effect */
.fabric-bg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image:
        repeating-linear-gradient(45deg, rgba(255, 255, 255, 0.03) 0px, rgba(255, 255, 255, 0.03) 1px, transparent 1px, transparent 10px),
        repeating-linear-gradient(-45deg, rgba(255, 255, 255, 0.03) 0px, rgba(255, 255, 255, 0.03) 1px, transparent 1px, transparent 10px);
    background-size: 20px 20px;
    z-index: -2;
    opacity: 0.3;
    /* Slightly subtler on black */
}
.vignette {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle, transparent 40%, #000 120%);
    z-index: -1;
    pointer-events: none;
}
/* Custom Cursor */
.cursor-dot {
    width: 6px;
    height: 6px;
    background: var(--gold);
    border-radius: 50%;
    position: fixed;
    top: 0;
    left: 0;
    transform: translate(-50%, -50%);
    pointer-events: none;
    z-index: 9999;
}
.cursor-outline {
    width: 40px;
    height: 40px;
    border: 1px solid rgba(212, 175, 55, 0.5);
    border-radius: 50%;
    position: fixed;
    top: 0;
    left: 0;
    transform: translate(-50%, -50%);
    pointer-events: none;
    z-index: 9998;
    transition: width 0.2s, height 0.2s, background-color 0.2s;
}
/* Container */
.container {
    text-align: center;
    position: relative;
    z-index: 10;
    perspective: 1000px;
}
/* Logo SVG Styles */
.logo-wrapper {
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
    filter: drop-shadow(0 0 15px rgba(212, 175, 55, 0.2));
}
.logo-text {
    font-family: var(--font-serif);
    fill: var(--gold);
    /* Ensure all logo text is gold */
    opacity: 0;
    /* Animated in via JS */
}
.prefix-text {
    font-size: 32px;
    font-family: var(--font-script);
    fill: var(--gold);
}
.main-text {
    font-size: 64px;
    font-weight: 700;
    letter-spacing: 4px;
}
.sub-text {
    font-size: 20px;
    font-weight: 300;
    letter-spacing: 14px;
    fill: var(--gold);
    /* Gold subtext */
    text-transform: uppercase;
}
/* Scissors/V Symbol */
.scissor-blade {
    transform-origin: 0 10px;
    /* Pivot point */
}
/* Tagline */
.tagline {
    margin-top: -30px;
    font-size: 1rem;
    color: #888;
    letter-spacing: 4px;
    opacity: 0;
    transform: translateY(20px);
}
/* CTA Button */
.cta-container {
    margin-top: 40px;
    opacity: 0;
    transform: translateY(20px);
}
.cta-btn {
    background: transparent;
    color: var(--gold);
    border: 1px solid var(--gold);
    padding: 12px 30px;
    font-family: var(--font-sans);
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.8rem;
    transition: all 0.3s ease;
    cursor: none;
    /* We use custom cursor */
    position: relative;
    overflow: hidden;
}
.cta-btn:hover {
    background: rgba(212, 175, 55, 0.1);
    box-shadow: 0 0 20px rgba(212, 175, 55, 0.3);
}
.cta-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: 0.5s;
}
.cta-btn:hover::before {
    left: 100%;
}
/* Interactive Hover States */
.hover-target {
    transform: scale(1.05);
    transition: transform 0.3s ease;
}
EOF
# Write script.js
sudo cat <<EOF > "$TARGET_DIR/script.js"
gsap.registerPlugin(MotionPathPlugin);
document.addEventListener('DOMContentLoaded', () => {
    // Custom Cursor Logic
    const cursorDot = document.querySelector('.cursor-dot');
    const cursorOutline = document.querySelector('.cursor-outline');
    window.addEventListener('mousemove', (e) => {
        const posX = e.clientX;
        const posY = e.clientY;
        cursorDot.style.left = \`\${posX}px\`;
        cursorDot.style.top = \`\${posY}px\`;
        // Slightly delayed follow for outline
        cursorOutline.animate({
            left: \`\${posX}px\`,
            top: \`\${posY}px\`
        }, { duration: 400, fill: "forwards" });
        // Parallax Effect
        const moveX = (window.innerWidth / 2 - posX) * 0.02;
        const moveY = (window.innerHeight / 2 - posY) * 0.02;
        gsap.to('.logo-wrapper', {
            x: moveX,
            y: moveY,
            duration: 1,
            ease: 'power2.out'
        });
        // Fabric sheen effect
        gsap.to('.fabric-bg', {
            backgroundPosition: \`\${posX / 20}px \${posY / 20}px\`,
            duration: 1
        });
    });
    // Hover interactive elements
    const interactiveElements = document.querySelectorAll('a, button');
    interactiveElements.forEach(el => {
        el.addEventListener('mouseenter', () => {
            cursorOutline.style.width = '60px';
            cursorOutline.style.height = '60px';
            cursorOutline.style.backgroundColor = 'rgba(212, 175, 55, 0.1)';
        });
        el.addEventListener('mouseleave', () => {
            cursorOutline.style.width = '40px';
            cursorOutline.style.height = '40px';
            cursorOutline.style.backgroundColor = 'transparent';
        });
    });
    // --- Master Timeline Animation ---
    const tl = gsap.timeline({ defaults: { ease: "power2.out" } });
    // 1. Initial Scissors Animation ("Cutting" open the scene)
    // We want them to end up looking like a "V"
    tl.from('.scissor-blade', {
        rotation: 0, // Start closed (vertical)
        opacity: 0,
        duration: 1.5,
        stagger: 0.1,
        transformOrigin: "0 10px" // Pivot point
    })
        .to('.left-blade', { rotation: -30, duration: 1.5, ease: "power4.out" }, "-=0.5")
        .to('.right-blade', { rotation: 30, duration: 1.5, ease: "power4.out" }, "<")
        // Animate handles if added
        .to('.handle', { opacity: 1, duration: 1 }, "<")
        // 2. Text Reveal
        .to('.logo-text', {
            opacity: 1,
            y: 0,
            duration: 1,
            stagger: 0.2
        }, "-=0.5")
        // 3. Thread Stitching Animation
        // Reveal the path progressively
        .fromTo('#stitch-path',
            { strokeDasharray: "5, 5", strokeDashoffset: 1000 },
            { strokeDashoffset: 0, duration: 3, ease: "none" }
        )
        // Animate Needle ALONG the path simultaneously
        .to('#needle', {
            motionPath: {
                path: "#stitch-path",
                align: "#stitch-path",
                alignOrigin: [0, 1],
                autoRotate: true
            },
            duration: 3,
            ease: "none"
        }, "<") // Run at same time as path drawing
        // 4. Final Polish
        .to('.tagline', { opacity: 1, y: 0, duration: 1 }, "-=1")
        .to('.cta-container', { opacity: 1, y: 0, duration: 1 }, "-=0.5")
        // 5. MORPH: Crossfade Scissors to real 'V' text for legibility
        .to('.symbol-group', { opacity: 0, duration: 1 }, "+=0.5") // Wait half a sec then fade out scissors
        .to('.v-text', { opacity: 1, duration: 1 }, "<"); // Fade in V text at same time
    // Optional: Subtle float for the needle after animation
    gsap.to('#needle', {
        y: "+=5",
        duration: 2,
        yoyo: true,
        repeat: -1,
        ease: "sine.inOut",
        delay: 5 // Start after main animation
    });
    // --- DOWNLOAD FEATURE ---
    document.getElementById('download-btn').addEventListener('click', () => {
        const svg = document.querySelector('.logo-svg');
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');
        const svgData = new XMLSerializer().serializeToString(svg);
        // We need to inline styles because generic <img> rendering ignores external CSS
        // The most critical ones are fonts and fills
        const styleRules = \`
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;500&family=Great+Vibes&display=swap');
                .logo-text { font-family: 'Cinzel', serif; fill: #D4AF37; }
                .main-text { font-weight: 700; letter-spacing: 4px; font-size: 64px; }
                .sub-text { font-weight: 300; letter-spacing: 14px; fill: #D4AF37; font-size: 20px; text-transform: uppercase; }
                .prefix-text { font-family: 'Great Vibes', cursive; fill: #D4AF37; font-size: 32px; }
                .v-text { opacity: 1; } /* Ensure V is visible in download regardless of animation state */
                .symbol-group { display: none; } /* Hide the scissors in static image if we want just the text, OR keep them if preferred. Let's keep strict text legibility for download. */
            </style>
        \`;
        // Inject styles into SVG data
        const svgWithStyle = svgData.replace('<defs>', '<defs>' + styleRules);
        const img = new Image();
        const svgBlob = new Blob([svgWithStyle], { type: 'image/svg+xml;charset=utf-8' });
        const url = URL.createObjectURL(svgBlob);
        // Set specific high-res size
        canvas.width = 1200;
        canvas.height = 800;
        img.onload = () => {
            // Draw Black Background
            ctx.fillStyle = "#000000";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            // Draw the SVG centered
            // The SVG viewBox is 0 0 600 400. We scale it up 2x.
            ctx.drawImage(img, 0, 0, 1200, 800);
            // Trigger Download
            const a = document.createElement('a');
            a.download = 'The_Vastra_Studio_Logo.png';
            a.href = canvas.toDataURL('image/png');
            a.click();
            URL.revokeObjectURL(url);
        };
        img.src = url;
    });
});
EOF
echo "Deployment complete! Files are in $TARGET_DIR."
chmod +x "$TARGET_DIR/"*
ls -l "$TARGET_DIR"
