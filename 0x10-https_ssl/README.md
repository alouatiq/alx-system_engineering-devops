# 0x10. HTTPS SSL

## Description
This project focuses on the implementation of HTTPS and SSL/TLS in web infrastructure. You will learn how to secure web traffic with SSL certificates, configure HAProxy to handle SSL termination, and enforce HTTPS redirection for improved security.

---

## Learning Objectives
By the end of this project, you should be able to:

- Understand the roles of HTTPS and SSL/TLS.
- Explain the purpose of encrypting traffic.
- Define SSL termination and its advantages.
- Configure a load balancer with SSL termination.
- Enforce HTTPS redirection to prevent unencrypted traffic.

---

## Requirements

- All your files should be executable and pass Shellcheck (version 0.3.7).
- Your Bash scripts should start with `#!/usr/bin/env bash`.
- HAProxy version must be 1.5 or higher.
- Certificates should be generated using Certbot.

---

## Tasks

### 0. World Wide Web

**Objective:**

- Configure DNS records for the following subdomains:
  - `www`: Points to the load balancer.
  - `lb-01`: Points to the load balancer.
  - `web-01`: Points to the first web server.
  - `web-02`: Points to the second web server.

**Output:**

- Write a Bash script (`0-world_wide_web`) that:
  - Accepts `domain` and optionally `subdomain` as arguments.
  - Displays information about the specified subdomain(s).
  - Uses `dig` to verify DNS records.

---

### 1. HAProxy SSL Termination

**Objective:**

- Configure HAProxy to handle SSL termination for your domain and subdomains.

**Steps:**

1. Install Certbot and generate SSL certificates for your domain.
   ```bash
   sudo certbot certonly --standalone -d digi101.tech -d www.digi101.tech
   ```
2. Combine the certificate and private key into a single PEM file:
   ```bash
   sudo cat /etc/letsencrypt/live/digi101.tech/fullchain.pem /etc/letsencrypt/live/digi101.tech/privkey.pem > /etc/haproxy/certs/digi101.tech.pem
   sudo chmod 600 /etc/haproxy/certs/digi101.tech.pem
   ```
3. Configure HAProxy to use the certificate:
   ```
   frontend https_front
       bind *:443 ssl crt /etc/haproxy/certs/digi101.tech.pem
       default_backend http_back

   backend http_back
       balance roundrobin
       server web01 54.144.138.231:80 check
       server web02 34.201.61.21:80 check
   ```

**Output:**

- A file named `1-haproxy_ssl_termination` containing the updated HAProxy configuration.

---

### 2. No Loophole in Your Website Traffic

**Objective:**

- Configure HAProxy to enforce HTTPS by redirecting all HTTP traffic to HTTPS.

**Steps:**

1. Add the following to your HAProxy configuration:
   ```
   frontend http_front
       bind *:80
       redirect scheme https code 301 if !{ ssl_fc }

   frontend https_front
       bind *:443 ssl crt /etc/haproxy/certs/digi101.tech.pem
       default_backend http_back

   backend http_back
       balance roundrobin
       server web01 54.144.138.231:80 check
       server web02 34.201.61.21:80 check
   ```

2. Validate the configuration:
   ```bash
   sudo haproxy -c -f /etc/haproxy/haproxy.cfg
   ```

3. Restart HAProxy:
   ```bash
   sudo service haproxy restart
   ```

**Output:**

- A file named `100-redirect_http_to_https` containing the updated HAProxy configuration.

---

## Usage

### Test DNS Records
```bash
./0-world_wide_web digi101.tech
./0-world_wide_web digi101.tech web-01
```

### Test SSL Configuration
```bash
curl -sI https://digi101.tech
curl -sIL http://digi101.tech
```

---

## Author
Hassan Al Ouatiq

