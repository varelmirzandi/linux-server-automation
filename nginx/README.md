# Nginx Virtual Host & Reverse Proxy Lab

Konfigurasi contoh Nginx di lingkungan lokal Ubuntu (127.0.0.1) untuk memisahkan virtual host berdasarkan server_name serta meneruskan trafik ke layanan backend menggunakan proxy_pass:

- portfolio.local: Melayani halaman web statis langsung dari direktori root (/var/www/html).
- iot.local: Berfungsi sebagai reverse proxy ke layanan backend pada http://127.0.0.1:8080 dengan header Host, X-Real-IP, dan X-Forwarded-For.

## Pengujian Singkat

    sudo nginx -t && sudo systemctl reload nginx
    curl -I http://portfolio.local
    curl -I http://iot.local
