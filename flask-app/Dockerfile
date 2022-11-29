#Use Python 3.6 as a base image
FROM python:3.6
# Copy contents into image
COPY requirements.txt requirements.txt
# install pip dependencies from requirements file
RUN pip install -r requirements.txt
COPY . .
# Expose correct port
EXPOSE 5050
# Create an entrypoint
CMD ["python","app.py"]
