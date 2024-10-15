FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y \
    zsh \
    curl \
    wget \
    git \
    nginx \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

SHELL ["/bin/zsh", "-c"]

RUN pip install --no-cache-dir pytest pytest-cov llm

RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/sites-enabled/

WORKDIR /workspace

EXPOSE 80

CMD ["/bin/zsh"]
