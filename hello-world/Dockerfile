FROM alpine:3.7

RUN echo 'https://mirrors.ustc.edu.cn/alpine/edge/testing/' > /etc/apk/repositories \
    && apk add --update --no-cache libc-dev tcc \
    && touch main.c \
    && echo '#include"stdio.h"' >> main.c \
    && echo 'int main (void) { printf("Hello World!\n"); return 0; }' >> main.c \
    && tcc main.c -o hello

FROM alpine:3.7

LABEL maintainer "yitiandelan@outlook.com"

COPY --from=0 /hello .

CMD ["./hello"]
