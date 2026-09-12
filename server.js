const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3004;
const WEB_DIR = path.join(__dirname, 'web');

const MIME = {
    '.html': 'text/html',
    '.js': 'application/javascript',
    '.wasm': 'application/wasm',
};

http.createServer((req, res) => {
    const url = req.url === '/' ? '/index.html' : req.url.split('?')[0];
    const filePath = path.join(WEB_DIR, url);

    try {
        const data = fs.readFileSync(filePath);
        const ext = path.extname(filePath);
        res.writeHead(200, { 'Content-Type': MIME[ext] || 'application/octet-stream' });
        res.end(data);
    } catch (e) {
        res.writeHead(404);
        res.end('Not found');
    }
}).listen(PORT, () => console.log(`RSDKv2 Web running at http://localhost:${PORT}`));
