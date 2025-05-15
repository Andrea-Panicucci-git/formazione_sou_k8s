# Base immagine
FROM python:3.13-slim
# Imposto la workdir
WORKDIR /app
# Copio le dipendenze e le installo 
COPY requisiti.txt .
RUN pip install --no-cache-dir -r requisiti.txt
# Copio l'app code
COPY app.py .
# Esponi porta
EXPOSE 5000
# Avvia l'app
CMD ["python", "app.py"]

