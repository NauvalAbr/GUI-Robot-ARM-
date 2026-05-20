; ============================================================
; AR4 ROBOT - POLA PIJAT PUNGGUNG SAJA
; Skala 1:1 proporsi tubuh manusia dewasa rata-rata
; ============================================================
; REFERENSI ANATOMI (dari gambar):
;   - Dua garis paravertebral naik (panah atas) + titik merah
;   - Stroke horizontal keluar dari tulang belakang (bahu)
;   - Kurva lengkung di area scapula (seperti tanda < >)
;   - Stroke ke bawah di punggung bawah
;   - Lingkaran besar di area gluteal
;
; CARA PAKAI:
;   1. Jog robot ke atas C7 (leher bawah), kontak ringan ke kulit
;   2. Set START POSITION di GUI G-Code Tab:
;      X = posisi aktual robot di tengah tulang belakang
;      Y = posisi aktual di level C7 (bahu atas)
;      Z = posisi saat ujung robot menyentuh kulit
;   3. Load file ini → Convert & Run
;
; DIMENSI 1:1 MANUSIA (mm, dewasa rata-rata):
;   Lebar bahu (bideltoid)  : 380mm → X = ±190
;   Lebar punggung tengah   : 360mm → X = ±180
;   Lebar pinggang          : 280mm → X = ±140
;   Panjang C7 ke sacrum    : 520mm → Y = 0..520
;   Posisi scapula          : X = ±100..180, Y = 50..200
;   Gluteal                 : Y = 490..620, X = ±150
;
; KOORDINAT RELATIF DARI START POSITION:
;   X=0   : tulang belakang (tengah)
;   X neg : sisi kiri pasien
;   X pos : sisi kanan pasien
;   Y=0   : bahu atas (C7)
;   Y pos : ke arah kaki
;   Z=0   : kontak kulit
;   Z=40  : ketinggian aman (travel)
;
; FEEDRATE: F300=pijat, F1000=travel, F500=reposisi di kulit
; ============================================================

G21
G90
G28

; ============================================================
; POLA 1: EFFLEURAGE PARAVERTEBRAL
; Dua garis sejajar kiri-kanan tulang belakang, dari bawah ke atas
; Mengikuti panah naik pada gambar (titik-titik merah)
; ============================================================

; --- Ulangan 1 ---
G0 X0 Y520 Z40
; Kiri paravertebral (X=-25)
G1 X-25 Y520 Z0 F1000
G1 X-25 Y0 Z0 F300
G1 X-25 Y0 Z40 F1000
; Kanan paravertebral (X=25)
G0 X25 Y520 Z40
G1 X25 Y520 Z0 F1000
G1 X25 Y0 Z0 F300
G1 X25 Y0 Z40 F1000

; --- Ulangan 2 ---
G0 X-25 Y520 Z40
G1 X-25 Y520 Z0 F1000
G1 X-25 Y0 Z0 F300
G1 X-25 Y0 Z40 F1000
G0 X25 Y520 Z40
G1 X25 Y520 Z0 F1000
G1 X25 Y0 Z0 F300
G1 X25 Y0 Z40 F1000


; ============================================================
; POLA 2: STROKE HORIZONTAL BAHU
; Dari tulang belakang menyapu keluar ke bahu (panah horizontal)
; Y=20 level bahu atas
; ============================================================

; --- Ulangan 1 ---
G0 X0 Y20 Z40
G1 X0 Y20 Z0 F1000
G1 X-190 Y20 Z0 F300
G1 X0 Y20 Z0 F500
G1 X190 Y20 Z0 F300
G1 X0 Y20 Z40 F1000

; --- Ulangan 2 ---
G1 X0 Y20 Z0 F1000
G1 X-190 Y20 Z0 F300
G1 X0 Y20 Z0 F500
G1 X190 Y20 Z0 F300
G1 X0 Y20 Z40 F1000


; ============================================================
; POLA 3: LENGKUNG SCAPULA (kurva tanda < dan >)
; Mengikuti tepi scapula dari atas ke bawah, lalu keluar
; Scapula kiri: X=-100..-180, Y=50..200
; ============================================================

; --- Scapula Kiri - Ulangan 1 ---
G0 X-190 Y30 Z40
G1 X-190 Y30 Z0 F1000
G1 X-160 Y70 Z0 F300
G1 X-110 Y130 Z0 F300
G1 X-100 Y180 Z0 F300
G1 X-140 Y210 Z0 F300
G1 X-185 Y210 Z0 F300
G1 X-185 Y210 Z40 F1000

; --- Scapula Kiri - Ulangan 2 ---
G0 X-190 Y30 Z40
G1 X-190 Y30 Z0 F1000
G1 X-160 Y70 Z0 F300
G1 X-110 Y130 Z0 F300
G1 X-100 Y180 Z0 F300
G1 X-140 Y210 Z0 F300
G1 X-185 Y210 Z0 F300
G1 X-185 Y210 Z40 F1000

; --- Scapula Kanan - Ulangan 1 ---
G0 X190 Y30 Z40
G1 X190 Y30 Z0 F1000
G1 X160 Y70 Z0 F300
G1 X110 Y130 Z0 F300
G1 X100 Y180 Z0 F300
G1 X140 Y210 Z0 F300
G1 X185 Y210 Z0 F300
G1 X185 Y210 Z40 F1000

; --- Scapula Kanan - Ulangan 2 ---
G0 X190 Y30 Z40
G1 X190 Y30 Z0 F1000
G1 X160 Y70 Z0 F300
G1 X110 Y130 Z0 F300
G1 X100 Y180 Z0 F300
G1 X140 Y210 Z0 F300
G1 X185 Y210 Z0 F300
G1 X185 Y210 Z40 F1000


; ============================================================
; POLA 4: STROKE LATERAL PUNGGUNG TENGAH
; Y=230..370 level thoracic bawah
; ============================================================

; --- Y=240 ---
G0 X0 Y240 Z40
G1 X0 Y240 Z0 F1000
G1 X-175 Y240 Z0 F300
G1 X0 Y240 Z0 F500
G1 X175 Y240 Z0 F300
G1 X0 Y240 Z40 F1000
; Ulangan 2
G1 X0 Y240 Z0 F1000
G1 X-175 Y240 Z0 F300
G1 X0 Y240 Z0 F500
G1 X175 Y240 Z0 F300
G1 X0 Y240 Z40 F1000

; --- Y=300 ---
G0 X0 Y300 Z40
G1 X0 Y300 Z0 F1000
G1 X-165 Y300 Z0 F300
G1 X0 Y300 Z0 F500
G1 X165 Y300 Z0 F300
G1 X0 Y300 Z40 F1000
; Ulangan 2
G1 X0 Y300 Z0 F1000
G1 X-165 Y300 Z0 F300
G1 X0 Y300 Z0 F500
G1 X165 Y300 Z0 F300
G1 X0 Y300 Z40 F1000

; --- Y=370 ---
G0 X0 Y370 Z40
G1 X0 Y370 Z0 F1000
G1 X-150 Y370 Z0 F300
G1 X0 Y370 Z0 F500
G1 X150 Y370 Z0 F300
G1 X0 Y370 Z40 F1000
; Ulangan 2
G1 X0 Y370 Z0 F1000
G1 X-150 Y370 Z0 F300
G1 X0 Y370 Z0 F500
G1 X150 Y370 Z0 F300
G1 X0 Y370 Z40 F1000


; ============================================================
; POLA 5: STROKE LUMBAR (punggung bawah, panah ke bawah)
; Stroke vertikal turun di area lumbar
; ============================================================

; --- Kiri lumbar (X=-30) ---
G0 X-30 Y380 Z40
G1 X-30 Y380 Z0 F1000
G1 X-30 Y490 Z0 F300
G1 X-30 Y490 Z40 F1000
; Ulangan 2
G1 X-30 Y380 Z0 F1000
G1 X-30 Y490 Z0 F300
G1 X-30 Y490 Z40 F1000

; --- Kanan lumbar (X=30) ---
G0 X30 Y380 Z40
G1 X30 Y380 Z0 F1000
G1 X30 Y490 Z0 F300
G1 X30 Y490 Z40 F1000
; Ulangan 2
G1 X30 Y380 Z0 F1000
G1 X30 Y490 Z0 F300
G1 X30 Y490 Z40 F1000

; --- Stroke lateral lumbar ---
G0 X0 Y440 Z40
G1 X0 Y440 Z0 F1000
G1 X-140 Y440 Z0 F300
G1 X0 Y440 Z0 F500
G1 X140 Y440 Z0 F300
G1 X0 Y440 Z40 F1000
; Ulangan 2
G1 X0 Y440 Z0 F1000
G1 X-140 Y440 Z0 F300
G1 X0 Y440 Z0 F500
G1 X140 Y440 Z0 F300
G1 X0 Y440 Z40 F1000


; ============================================================
; POLA 6: LINGKARAN GLUTEAL
; Dua lingkaran besar di area pantat (8 titik approx, R=60mm)
; Pusat kiri: X=-95, Y=565 | Pusat kanan: X=95, Y=565
; ============================================================

; --- Gluteal Kiri - Ulangan 1 ---
G0 X-35 Y565 Z40
G1 X-35 Y565 Z0 F1000
G1 X-53 Y607 Z0 F300
G1 X-95 Y625 Z0 F300
G1 X-137 Y607 Z0 F300
G1 X-155 Y565 Z0 F300
G1 X-137 Y523 Z0 F300
G1 X-95 Y505 Z0 F300
G1 X-53 Y523 Z0 F300
G1 X-35 Y565 Z0 F300
G1 X-35 Y565 Z40 F1000

; --- Gluteal Kiri - Ulangan 2 ---
G1 X-35 Y565 Z0 F1000
G1 X-53 Y607 Z0 F300
G1 X-95 Y625 Z0 F300
G1 X-137 Y607 Z0 F300
G1 X-155 Y565 Z0 F300
G1 X-137 Y523 Z0 F300
G1 X-95 Y505 Z0 F300
G1 X-53 Y523 Z0 F300
G1 X-35 Y565 Z0 F300
G1 X-35 Y565 Z40 F1000

; --- Gluteal Kanan - Ulangan 1 ---
G0 X35 Y565 Z40
G1 X35 Y565 Z0 F1000
G1 X53 Y607 Z0 F300
G1 X95 Y625 Z0 F300
G1 X137 Y607 Z0 F300
G1 X155 Y565 Z0 F300
G1 X137 Y523 Z0 F300
G1 X95 Y505 Z0 F300
G1 X53 Y523 Z0 F300
G1 X35 Y565 Z0 F300
G1 X35 Y565 Z40 F1000

; --- Gluteal Kanan - Ulangan 2 ---
G1 X35 Y565 Z0 F1000
G1 X53 Y607 Z0 F300
G1 X95 Y625 Z0 F300
G1 X137 Y607 Z0 F300
G1 X155 Y565 Z0 F300
G1 X137 Y523 Z0 F300
G1 X95 Y505 Z0 F300
G1 X53 Y523 Z0 F300
G1 X35 Y565 Z0 F300
G1 X35 Y565 Z40 F1000


; ============================================================
; SELESAI - Kembali ke Start Position
; ============================================================
G0 X0 Y0 Z40
G28
