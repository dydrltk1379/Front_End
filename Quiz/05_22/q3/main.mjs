import fs from 'fs';

const path1 = "movie.txt";
const path2 = "tour.txt";

const movieData = fs.readFileSync(path1, {encoding : 'utf8'});
const tourData = fs.readFileSync(path2, {encoding : 'utf8'});

console.log(`==================== \n보고싶은 영화는 ${movieData}이고, \n가고싶은 여행지는 ${tourData} \n====================`);