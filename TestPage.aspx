<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestPage.aspx.cs" Inherits="TestPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Star Particles</title>
    <style>
        particle {
            position: fixed;
            left: 0;
            top: 0;
            border-radius: 50%;
            pointer-events: none;
            opacity: 0;
        }

        button {
            padding: 10px;
        }

        body {
            overflow: hidden;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
    </style>
</head>
<body>
    <button id="button">Click on me</button>
    <button class="btn-animate">Click on me</button>
    <button class="btn-animate">Click on me</button>
    <button class="btn-animate">Click on me</button>

    <script>
        if (document.body.animate) {
            document.querySelectorAll(".btn-animate").forEach(button => {
                button.addEventListener("click", pop);
            });
        }

        function pop(e) {
            for (let i = 0; i < 30; i++) {
                createParticle(e.clientX, e.clientY);
            }
        }

        function createParticle(x, y) {
            const particle = document.createElement("particle");
            document.body.appendChild(particle);

            const size = Math.floor(Math.random() * 20 + 5);
            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            let width = Math.floor(Math.random() * 30 + 8);
            let height = width;
            let destinationX = (Math.random() - 0.5) * 300;
            let destinationY = (Math.random() - 0.5) * 300;
            let rotation = Math.random() * 520;
            let delay = Math.random() * 200;
            //particle.style.background = `hsl(${Math.random() * 90 + 180}, 70%, 60%)`;
            //particle.innerHTML = ["❤", "🧡", "💛", "💚", "💙", "💜", "🤎"][
            //    Math.floor(Math.random() * 7)
            //];
            //particle.style.fontSize = `${Math.random() * 24 + 10}px`;
            //width = height = "auto";
            var color = `hsl(${Math.random() * 90 + 90}, 70%, 50%)`;
            particle.style.boxShadow = `0 0 ${Math.floor(
                Math.random() * 10 + 10
            )}px ${color}`;
            particle.style.background = color;
            particle.style.borderRadius = "50%";
            width = height = Math.random() * 5 + 4;
            //const destinationX = x + (Math.random() - 0.5) * 2 * 75;
            //  const destinationY = y + (Math.random() - 0.5) * 2 * 75;

            const animation = particle.animate(
                [
                    {
                        transform: `translate(-50%, -50%) translate(${x}px, ${y}px) rotate(0deg)`,
                        opacity: 1
                    },
                    {
                        transform: `translate(-50%, -50%) translate(${x + destinationX}px, ${y + destinationY
                            }px) rotate(${rotation}deg)`,
                        opacity: 0
                    }
                ],
                {
                    duration: Math.random() * 1000 + 5000,
                    easing: "cubic-bezier(0, .9, .57, 1)",
                    delay: delay
                }
            );
            animation.onfinish = () => {
                particle.remove();
            };
        }
    </script>
</body>
</html>

