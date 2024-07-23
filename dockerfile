
FROM python:3.8-slim
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirments.txt
EXPOSE 5000
ENV NAME World
CMD ["python", "app.py"]
