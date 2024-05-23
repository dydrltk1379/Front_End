import fs from 'fs';
import readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('가고싶은 여행지 입력 >> ', (Country) => {
    fs.writeFile('tour.txt', Country, (err) => {
        if (err) {
            console.error('Error writing to tour.txt:', err);
        }
        rl.close();
    });
});