# PythonのDockerイメージをダウンロード
FROM python:3.12

# pythonの出力表示をDocker用に設定
ENV PYTHONUNBUFFERED=1

# 作業フォルダを指定
WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの設定ファイルが存在するなら、コピーしてパッケージをインストール
COPY pyproject.toml* poetry.lock* ./
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi
