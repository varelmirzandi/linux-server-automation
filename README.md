# Linux Server Automation & Hardening

Kumpulan skrip Bash dan *playbook* **Ansible** untuk otomasi konfigurasi dasar server Linux (Ubuntu/Debian/AlmaLinux), manajemen pengguna, *firewall*, serta *deployment* kontainer **Docker**.

## Struktur Direktori
- `scripts/` — Skrip utilitas administrasi sistem & pemantauan daya/layanan (`systemd`).
- `ansible/` — *Playbook* penyediaan paket dasar dan pengamanan SSH/firewall.
- `docker/` — Contoh konfigurasi *Docker Compose* untuk layanan web dan pemantauan.

## Catatan Keamanan
Seluruh variabel sensitif (alamat IP publik, *password*, dan kunci SSH) dikecualikan melalui `.gitignore`.
