; ============================================================
; AR4 ROBOT - POLA PIJAT PUNGGUNG (Koordinat Kecil)
; Disesuaikan dengan workspace robot AR4 MK4
; ============================================================
; WORKSPACE ROBOT (estimasi dari data aktual):
;   X range : ±70mm dari titik tengah
;   Y range : 0..150mm dari titik awal
;   Z range : 0..30mm (kontak ke atas)
;
; CARA PAKAI:
;   1. Jog robot ke atas tulang belakang bagian atas (C7/bahu)
;   2. Pastikan posisi AMAN (tidak akan nabrak meja/pasien)
;   3. Set START POSITION di GUI G-Code Tab
;   4. Semua checkbox "Open Loop" di tab Jog Controls → UNCHECK
;      (agar encoder aktif dan data tersimpan)
;   5. Isi Filename → Convert & Upload to SD → Play Gcode File
;
; KOORDINAT RELATIF DARI START POSITION:
;   X=0     : tulang belakang (tengah)
;   X negatif: sisi kiri pasien
;   X positif: sisi kanan pasien
;   Y=0     : posisi awal (bahu/C7)
;   Y positif: ke arah pinggang
;   Z=0     : kontak kulit
;   Z=30    : ketinggian aman travel
;
; FEEDRATE: F200=pijat lambat, F800=travel, F400=reposisi
; ============================================================

G21
G90
G28

; ============================================================
; POLA 1: EFFLEURAGE PARAVERTEBRAL
; Dua garis sejajar tulang belakang, dari bawah ke atas
; ============================================================

; --- Ulangan 1 ---
G0 X0 Y120 Z30
G1 X-15 Y120 Z0 F800
G1 X-15 Y0 Z0 F200
G1 X-15 Y0 Z30 F800
G0 X15 Y120 Z30
G1 X15 Y120 Z0 F800
G1 X15 Y0 Z0 F200
G1 X15 Y0 Z30 F800

; --- Ulangan 2 ---
G0 X-15 Y120 Z30
G1 X-15 Y120 Z0 F800
G1 X-15 Y0 Z0 F200
G1 X-15 Y0 Z30 F800
G0 X15 Y120 Z30
G1 X15 Y120 Z0 F800
G1 X15 Y0 Z0 F200
G1 X15 Y0 Z30 F800


; ============================================================
; POLA 2: STROKE LATERAL BAHU
; Menyapu keluar dari tulang belakang ke sisi bahu
; ============================================================

; --- Y=15 ---
G0 X0 Y15 Z30
G1 X0 Y15 Z0 F800
G1 X-65 Y15 Z0 F200
G1 X0 Y15 Z0 F400
G1 X65 Y15 Z0 F200
G1 X0 Y15 Z30 F800
; Ulangan 2
G1 X0 Y15 Z0 F800
G1 X-65 Y15 Z0 F200
G1 X0 Y15 Z0 F400
G1 X65 Y15 Z0 F200
G1 X0 Y15 Z30 F800

; --- Y=40 ---
G0 X0 Y40 Z30
G1 X0 Y40 Z0 F800
G1 X-68 Y40 Z0 F200
G1 X0 Y40 Z0 F400
G1 X68 Y40 Z0 F200
G1 X0 Y40 Z30 F800
; Ulangan 2
G1 X0 Y40 Z0 F800
G1 X-68 Y40 Z0 F200
G1 X0 Y40 Z0 F400
G1 X68 Y40 Z0 F200
G1 X0 Y40 Z30 F800


; ============================================================
; POLA 3: LENGKUNG SCAPULA (kurva di sisi punggung)
; Mengikuti tepi tulang belikat
; ============================================================

; --- Scapula Kiri ---
G0 X-65 Y15 Z30
G1 X-65 Y15 Z0 F800
G1 X-55 Y40 Z0 F200
G1 X-40 Y70 Z0 F200
G1 X-38 Y90 Z0 F200
G1 X-55 Y105 Z0 F200
G1 X-65 Y105 Z0 F200
G1 X-65 Y105 Z30 F800
; Ulangan 2
G0 X-65 Y15 Z30
G1 X-65 Y15 Z0 F800
G1 X-55 Y40 Z0 F200
G1 X-40 Y70 Z0 F200
G1 X-38 Y90 Z0 F200
G1 X-55 Y105 Z0 F200
G1 X-65 Y105 Z0 F200
G1 X-65 Y105 Z30 F800

; --- Scapula Kanan ---
G0 X65 Y15 Z30
G1 X65 Y15 Z0 F800
G1 X55 Y40 Z0 F200
G1 X40 Y70 Z0 F200
G1 X38 Y90 Z0 F200
G1 X55 Y105 Z0 F200
G1 X65 Y105 Z0 F200
G1 X65 Y105 Z30 F800
; Ulangan 2
G0 X65 Y15 Z30
G1 X65 Y15 Z0 F800
G1 X55 Y40 Z0 F200
G1 X40 Y70 Z0 F200
G1 X38 Y90 Z0 F200
G1 X55 Y105 Z0 F200
G1 X65 Y105 Z0 F200
G1 X65 Y105 Z30 F800


; ============================================================
; POLA 4: STROKE LATERAL PUNGGUNG TENGAH
; ============================================================

; --- Y=70 ---
G0 X0 Y70 Z30
G1 X0 Y70 Z0 F800
G1 X-65 Y70 Z0 F200
G1 X0 Y70 Z0 F400
G1 X65 Y70 Z0 F200
G1 X0 Y70 Z30 F800
; Ulangan 2
G1 X0 Y70 Z0 F800
G1 X-65 Y70 Z0 F200
G1 X0 Y70 Z0 F400
G1 X65 Y70 Z0 F200
G1 X0 Y70 Z30 F800

; --- Y=100 ---
G0 X0 Y100 Z30
G1 X0 Y100 Z0 F800
G1 X-60 Y100 Z0 F200
G1 X0 Y100 Z0 F400
G1 X60 Y100 Z0 F200
G1 X0 Y100 Z30 F800
; Ulangan 2
G1 X0 Y100 Z0 F800
G1 X-60 Y100 Z0 F200
G1 X0 Y100 Z0 F400
G1 X60 Y100 Z0 F200
G1 X0 Y100 Z30 F800


; ============================================================
; POLA 5: STROKE LUMBAR (punggung bawah)
; ============================================================

; --- Kiri lumbar ---
G0 X-20 Y110 Z30
G1 X-20 Y110 Z0 F800
G1 X-20 Y145 Z0 F200
G1 X-20 Y145 Z30 F800
; Ulangan 2
G1 X-20 Y110 Z0 F800
G1 X-20 Y145 Z0 F200
G1 X-20 Y145 Z30 F800

; --- Kanan lumbar ---
G0 X20 Y110 Z30
G1 X20 Y110 Z0 F800
G1 X20 Y145 Z0 F200
G1 X20 Y145 Z30 F800
; Ulangan 2
G1 X20 Y110 Z0 F800
G1 X20 Y145 Z0 F200
G1 X20 Y145 Z30 F800

; --- Lateral lumbar ---
G0 X0 Y130 Z30
G1 X0 Y130 Z0 F800
G1 X-55 Y130 Z0 F200
G1 X0 Y130 Z0 F400
G1 X55 Y130 Z0 F200
G1 X0 Y130 Z30 F800
; Ulangan 2
G1 X0 Y130 Z0 F800
G1 X-55 Y130 Z0 F200
G1 X0 Y130 Z0 F400
G1 X55 Y130 Z0 F200
G1 X0 Y130 Z30 F800


; ============================================================
; SELESAI - Kembali ke Start Position
; ============================================================
G0 X0 Y0 Z30
G28
