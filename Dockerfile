FROM klakegg/hugo:0.78.2-alpine
RUN apk add -U git
COPY . /src
RUN make init
RUN make build

FROM nginx:1.25.2-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=0 /src/public /usr/share/nginx/html
EXPOSE 80
