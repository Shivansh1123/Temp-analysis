# Use the official Python image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the ports for FastAPI (8000) and Streamlit (7860)
EXPOSE 8000 7860

# Run FastAPI and Streamlit together
CMD ["sh", "-c", "uvicorn api:app --host 0.0.0.0 --port 8000 & sleep 5 && streamlit run app.py --server.port 7860 --server.address 0.0.0.0"]
