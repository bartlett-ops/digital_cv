FROM node:16-alpine as builder
WORKDIR /opt/digital-cv

COPY package.json ./
COPY tsconfig.json ./
COPY src ./src
RUN npm install
RUN npm run build

COPY .eslintrc ./
RUN npm run lint


FROM node:16-alpine
RUN npm install pm2 -g
WORKDIR /opt/digital-cv

COPY package.json ./
RUN npm install --omit=dev
COPY --from=builder /opt/digital-cv/dist .

EXPOSE 8080
ENV PORT=8080

CMD ["pm2-runtime","index.js"]
