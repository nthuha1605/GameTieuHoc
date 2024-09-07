<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo-animation.aspx.cs" Inherits="demo_animation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: #f0f8ff;
        }

        .fishbowl-container {
            position: relative;
        }

        .fishbowl {
            width: 200px; /* Adjust based on your image size */
            height: auto;
        }

        .bubble {
            width: 50px;
            height: 50px;
            background: rgba(135, 206, 235, 0.7);
            border-radius: 50%;
            position: absolute;
            top: -30px; /* Adjust based on your fishbowl image */
            left: calc(50% - 25px); /* Center the bubble */
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

            .bubble.clicked {
                animation: pop 0.6s forwards;
            }

        .number {
            position: absolute;
            top: -50px;
            left: calc(50% - 41px);
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: radial-gradient(circle, rgb(255 255 255) 0%, rgb(247 250 255) 50%, rgb(0 135 255) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fade-in 0.6s forwards;
            box-shadow: 0 0 15px rgb(0 178 255 / 50%), 0 0 30px rgba(135, 206, 235, 0.5);
        }

        @keyframes pop {
            0% {
                transform: scale(1);
                opacity: 1;
            }

            50% {
                transform: scale(1.5);
                opacity: 0.7;
            }

            100% {
                transform: scale(2);
                opacity: 0;
            }
        }

        @keyframes fade-in {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        .bubble-effect {
            position: absolute;
            width: 1.5rem;
            height: 1.5rem;
            background: rgba(135, 206, 235, 0.5);
            border-radius: 50%;
            animation: float-up 1.5s ease-in-out infinite;
        }

        @keyframes float-up {
            0% {
                transform: translateY(0);
                opacity: 1;
            }

            100% {
                transform: translateY(-100px);
                opacity: 0;
            }
        }

        .circle-background {
            position: absolute;
            top: -50px; /* Adjust based on your fishbowl image */
            left: calc(50% - 25px); /* Center the circle */
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: rgba(135, 206, 235, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fade-in 0.6s forwards;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--chậu cá bong bóng--%>
        <div class="fishbowl-container">
            <img src="fishbowl.png" alt="Fishbowl" class="fishbowl" />
            <div class="bubble" data-number="5"></div>
        </div>
    </form>
    <script>
        document.querySelector('.bubble').addEventListener('click', function () {
            const number = this.getAttribute('data-number');
            this.classList.add('clicked');

            setTimeout(() => {
                const numberDiv = document.createElement('div');
                numberDiv.className = 'number';
                numberDiv.textContent = number;
                document.querySelector('.fishbowl-container').appendChild(numberDiv);
                numberDiv.classList.add('show');

                for (let i = 0; i < 20; i++) { // Increase the number of small bubbles
                    createBubbleEffect(this);
                }
            }, 300); // Adjusted delay for smoother effect
        });

        function createBubbleEffect(element) {
            const bubbleEffect = document.createElement('div');
            bubbleEffect.className = 'bubble-effect';
            document.querySelector('.fishbowl-container').appendChild(bubbleEffect);

            const rect = element.getBoundingClientRect();
            const containerRect = document.querySelector('.fishbowl-container').getBoundingClientRect();

            // Random position with a larger spread
            const offsetX = Math.random() * 200 - 100;
            const offsetY = Math.random() * 200 - 100;

            bubbleEffect.style.left = `${rect.left - containerRect.left + rect.width / 2 + offsetX}px`;
            bubbleEffect.style.top = `${rect.top - containerRect.top + rect.height / 2 + offsetY}px`;

            setTimeout(() => {
                bubbleEffect.remove();
            }, 1500); // Adjusted duration for small bubbles
        }

    </script>
</body>
</html>
