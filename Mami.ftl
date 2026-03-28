<#assign titulo = "¡Feliz Cumpleaños Mami! 🎂">
<#assign fotosIds = [
    "1Rw-BwhuLj0qT6B-g5-CQTq-nWmqmIas0", "16ri2I8EyU6yzqrY4ZCCKxJDSGtMEtpqY",
    "1yyNQaODcGUgoTc9UBkZ4_BbSKnJFgyg_", "1y3ehf3abX_s0BkiwQsXELnb7gcuxUsZ-",
    "1in58LIAl8RbP_i27ORutMOoFE0-I0wTL", "1hX_SW2btCHVMnHj0SxgStaEQyblybpSz",
    "1gdQQyrUst8umRVmMAQAaobEchx8YQofu", "1curZu_xFMW2FN9KxCWy36nKPID16uRuk",
    "1YsOmnwtZmII61M9Q8K5GzikOKgRGe-ya", "1QxcxHFzOYseTOXT5N_ViePWbmI9vi8SE",
    "1PJemHKJL670StzFFAK-D5UQu0S0gGm7H", "1MfkIlNI77yjqdeXMxdTdHjyz1d2YC-BT",
    "1KAWRh99jIYWqK4Sy93k0Pr9H9tbwa-lA", "14MmR8mFXVwTrfhJdFqSgeGB6wlwqHrV7",
    "12f147bdgElbx4_RvpVUeGsjyroTXTpzj", "1wXfcfhIvin6wXl3bK3BbvvDw8r7gD7qd",
    "1udum1jmMIdLkyVyHpRAzS-m7nbl2Pbe_", "1qWrdbphHgaIm2UMPpz1RcrIrFeEB15_0",
    "1eFGpEfPCzk1bCAZB-_RxpEWmpUMOKLRn", "1d48M4PWJJovbQjELKO8vpIXkUt7MliZb",
    "1_4Pw5M1uSDT1opKC1OopqyfrgcdSOP0Y", "1YmpDAbfhLA8lx6-R8JrDsXonostm0kfc",
    "1Y7GoOS1qTq-aaRmtfp2cftvKjsyDrJlJ", "1VlXhyFYoNF7tb7ZL9BUhxox9fx_PiisE",
    "1xzRxiYK6ftS0k8nsk-PtUkCMOp_OyTUB", "1hbNPwXJK9FVP0FGYLWp3plOWwHHz3GZV",
    "1bpI9bW88kk4csTs9Mtca0IpvOjNa5MvU", "1ZjxnRzrd8J-1GWzghjDJxhImhWfKN9ay",
    "1UQPpwurkKJpkutvpPCbbmLp5nqtjuAIx", "1Fh0j2gq5-C1whGBF-qBo1KExCCKAkX1a",
    "17rwphhUI8HO5rbrTj-_XgL36jE3ElwvM", "1dfJS_quKuvsaL1zjA6jzbdHXNFy-us6J",
    "1Ze8pYSLwIRS5vo4XHmRHB0mYAgNTiBWQ", "1XgXy597zpNO332iY4C5XkpcB34ho7WKb",
    "1TRPYMDzBC8xbmcv9kFxjfLSAm02S0Trw", "1Hm5VYSjsLSX2qTni-TjxkPLoVP57Uj3a",
    "1GsubvFGT_sGhIzW0ghFv4898hyt6Vimy", "1lqTEjpObm6zJZlrLIYOOFRkXDagLAt4f"
]>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo}</title>
    <link rel="stylesheet" href="Mami.css">
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>${titulo}</h1>
        <p>Toca una foto para verla en grande</p>
        <div class="gallery">
            <#list fotosIds as id>
                <img src="http://googleusercontent.com/profile/picture/${id}" alt="Recuerdo">
            </#list>
        </div>
        <button class="btn-felicitar" onclick="celebrar()">¡Felicidades! 🎉</button>
    </div>

    <div id="miVisor" class="viewer">
        <span class="close-btn" onclick="cerrarVisor()">×</span>
        <span class="nav-btn prev" onclick="cambiarFoto(-1)">❮</span>
        <img id="fotoGrande" class="viewer-img">
        <span class="nav-btn next" onclick="cambiarFoto(1)">❯</span>
    </div>

    <script>
        let indiceActual = 0;
        // Obtenemos la lista después de que FTL las genere
        const getLista = () => document.querySelectorAll('.gallery img');
        const visor = document.getElementById('miVisor');
        const fotoGrande = document.getElementById('fotoGrande');

        // Delegación de eventos para las fotos generadas
        document.querySelector('.gallery').addEventListener('click', (e) => {
            if (e.target.tagName === 'IMG') {
                const fotos = getLista();
                indiceActual = Array.from(fotos).indexOf(e.target);
                abrirVisor();
            }
        });

        function abrirVisor() {
            const fotos = getLista();
            visor.style.display = "flex";
            fotoGrande.src = fotos[indiceActual].src;
            document.body.style.overflow = "hidden";
        }

        function cerrarVisor() {
            visor.style.display = "none";
            document.body.style.overflow = "auto";
        }

        function cambiarFoto(dir) {
            const fotos = getLista();
            indiceActual = (indiceActual + dir + fotos.length) % fotos.length;
            fotoGrande.src = fotos[indiceActual].src;
        }

        visor.onclick = (e) => { if(e.target == visor) cerrarVisor(); };

        function celebrar() {
            confetti({ particleCount: 150, spread: 70, origin: { y: 0.6 } });
            setTimeout(() => { alert('¡Te quiero mucho Mami! ❤️'); }, 500);
        }
    </script>
</body>
</html>