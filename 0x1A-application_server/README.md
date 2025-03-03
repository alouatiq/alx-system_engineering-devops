# 0x1A. Application Server

## Description
This project focuses on setting up an application server to serve dynamic content using Flask and Gunicorn, and configuring Nginx to serve as a reverse proxy.

## Technologies
- Ubuntu 16.04 LTS
- Python 3
- Flask
- Gunicorn
- Nginx
- Bash scripting

## Requirements
- All scripts must be executable and follow Shellcheck guidelines
- Config files must be well-commented
- Flask app object must be named `app`
- Development server on port 5000
- Production server on port 5000 using Gunicorn

## Setup Instructions

### 1. Install Required Packages
```bash
sudo apt update && sudo apt install -y net-tools
```

### 2. Clone the AirBnB Clone Repository
```bash
git clone https://github.com/alouatiq/AirBnB_clone_v2.git
cd AirBnB_clone_v2
```

### 3. Configure Flask Application
Modify `web_flask/0-hello_route.py` to serve from `/airbnb-onepage/`:
```python
#!/usr/bin/python3
from flask import Flask

app = Flask(__name__)

@app.route('/airbnb-onepage/', strict_slashes=False)
def hello_hbnb():
    return "Hello HBNB!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

### 4. Run Flask Development Server
```bash
python3 -m web_flask.0-hello_route
```

### 5. Test the Application
```bash
curl 127.0.0.1:5000/airbnb-onepage/
```
Expected output:
```
Hello HBNB!
```

### 6. Run Gunicorn in Production Mode
```bash
gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app
```

### 7. Configure Nginx
Create `/etc/nginx/sites-available/default` with the following content:
```nginx
server {
    listen 80;
    location /airbnb-onepage/ {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```
Restart Nginx:
```bash
sudo service nginx restart
```

### 8. Verify External Access
```bash
curl http://digi101.tech/airbnb-onepage/
```
Expected output:
```
Hello HBNB!
