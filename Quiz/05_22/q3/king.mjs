import fs from 'fs';
import readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('보고싶은 영화 입력 >> ', (movieTitle) => {
    fs.writeFile('movie.txt', movieTitle, (err) => {
        if (err) {
            console.error('Error writing to movie.txt:', err);
        }
        rl.close();
    });
});