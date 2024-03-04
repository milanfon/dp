import express from 'express';
import path from 'path';

const http = express();
const port = 3000;

http.use(express.static(path.join(__dirname, 'frontend')));

http.get('/api/bla', (_, res) => res.send("Bla"));
http.get('/api/null', (_, res) => res.send(""));

http.listen(port, () => console.log('Starting server...'));
