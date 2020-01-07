FROM danteev/texlive:latest

WORKDIR /root

RUN apt-get install git
RUN git clone https://github.com/matsavage/latex-action.git
WORKDIR /root/latex-action
RUN git submodule init
RUN git submodule update

RUN mkdir -p /usr/local/share/texmf/tex/latex/
RUN mv lib/* /usr/local/share/texmf/tex/latex/

COPY entrypoint.sh /root/

WORKDIR /root

ENTRYPOINT ["/root/entrypoint.sh"]
