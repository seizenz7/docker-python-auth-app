# Gunakan image Python 3.11 yang ringan
FROM python:3.11-slim
# Instal dependensi sistem yang diperlukan, serta membersihkan cache apt untuk mengurangi ukuran image
RUN apt-get update && apt-get install -y libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*
# Buat user non-root untuk menjalankan aplikasi dengan aman di dalam container tanpa hak akses root 
RUN useradd -m -u 1000 appuser
# Setel direktori kerja di dalam container ke /app
WORKDIR /app
# Salin file requirements.txt ke dalam container untuk menginstal dependensi Python
COPY requirements.txt .
# Instal dependensi Python dari file requirements.txt yang diperlukan untuk aplikasi Flask dan psycopg2 tanpa menggunakan cache untuk mengurangi ukuran image
RUN pip install --no-cache-dir -r requirements.txt
# Salin semua file aplikasi ke dalam container, pastikan untuk menyalin semua file yang diperlukan untuk menjalankan aplikasi Flask, termasuk app.py dan file konfigurasi lainnya jika ada
COPY . .
# Ubah kepemilikan direktori aplikasi ke user non-root yang telah dibuat untuk memastikan aplikasi berjalan dengan hak akses yang sesuai untuk meningkatkan keamanan container
RUN chown -R appuser:appuser /app
# Beralih ke user non-root untuk menjalankan aplikasi dengan aman di dalam container tanpa hak akses root, yang merupakan praktik terbaik untuk keamanan container dan mencegah potensi kerentanan keamanan yang dapat dieksploitasi jika aplikasi dijalankan dengan hak akses root di dalam container yang dapat menyebabkan kerusakan sistem atau pencurian data jika terjadi pelanggaran keamanan di dalam container
USER appuser
# Ekspos port 5000 untuk aplikasi Flask agar dapat diakses dari luar container, yang merupakan port default untuk aplikasi Flask 
EXPOSE 5000
# Perintah untuk menjalankan aplikasi Flask menggunakan Python, yang akan memulai server Flask saat container dijalankan, memastikan bahwa aplikasi dapat menerima permintaan dan merespons dengan benar.
CMD ["python", "app.py"]