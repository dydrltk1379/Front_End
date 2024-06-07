0. vue 프로젝트 초기화 npm 명령어

npm create vite@latest [프로젝트명]
npm install
npm run dev

1. vue_bootstrap_1_basic
npm create vite@latest vue_bootstrap_1_basic
cd vue_bootstrap_1_basic
npm i bootstrap
npm i vite-plugin-webpackchunkname
npm i vue-router
npm i axios
npm i mitt
npm install
npm run dev

2. json-server
https://www.mockaroo.com/ 에서 MOCK_DATA 생성!
npm i -g json-server
mkdir db-server
mv ./MOCK_DATA.json ./db-server/MOCK_DATA.json
cd db-server
json-server —watch MOCK_DATA.json –port 3001
