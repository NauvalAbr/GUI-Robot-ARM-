; ============================================================
; AR4 ROBOT - POLA PIJAT KAKI SAJA
; Skala 1:1 proporsi tubuh manusia dewasa rata-rata
; ============================================================
; CARA PAKAI:
;   1. Jog robot ke atas lipatan gluteal (pangkal paha belakang)
;   2. Set START POSITION di GUI G-Code Tab:
;      X = posisi tengah di antara kedua paha (tengah)
;      Y = posisi aktual di lipatan gluteal (Y=0)
;      Z = posisi saat ujung robot menyentuh kulit
;   3. Load file ini → Convert & Run
;
; DIMENSI 1:1 MANUSIA (mm, dewasa rata-rata):
;   Lebar paha atas         : 150mm → X = ±75
;   Lebar betis (max)       : 110mm → X = ±55
;   Panjang lipatan-lutut   : 380mm → Y = 0..380
;   Panjang lutut-tumit     : 370mm → Y = 410..780
;
; KOORDINAT RELATIF DARI START POSITION:
;   X=0   : titik tengah antara kedua kaki
;   X=-75 : paha kiri (lateral)
;   X=75  : paha kanan (lateral)
;   Y=0   : lipatan gluteal (pangkal paha)
;   Y=380 : lutut
;   Y=780 : tumit
;   Z=0   : kontak kulit
;   Z=40  : ketinggian aman
;
; FEEDRATE: F300=pijat, F1000=travel, F500=reposisi di kulit
; ============================================================

G21
G90
G28

; ============================================================
; POLA 1: EFFLEURAGE PAHA BELAKANG
; Stroke memanjang dari pangkal paha ke lutut
; ============================================================

; --- Paha Kiri (X=-60) - Ulangan 1 ---
G0 X-60 Y0 Z40
G1 X-60 Y0 Z0 F1000
G1 X-60 Y380 Z0 F300
G1 X-60 Y380 Z40 F1000
; --- Ulangan 2 ---
G0 X-60 Y0 Z40
G1 X-60 Y0 Z0 F1000
G1 X-60 Y380 Z0 F300
G1 X-60 Y380 Z40 F1000

; --- Paha Kanan (X=60) - Ulangan 1 ---
G0 X60 Y0 Z40
G1 X60 Y0 Z0 F1000
G1 X60 Y380 Z0 F300
G1 X60 Y380 Z40 F1000
; --- Ulangan 2 ---
G0 X60 Y0 Z40
G1 X60 Y0 Z0 F1000
G1 X60 Y380 Z0 F300
G1 X60 Y380 Z40 F1000


; ============================================================
; POLA 2: STROKE LATERAL PAHA
; Menyapu dari medial ke lateral di beberapa level
; ============================================================

; --- Y=80 ---
G0 X0 Y80 Z40
G1 X0 Y80 Z0 F1000
G1 X-75 Y80 Z0 F300
G1 X0 Y80 Z0 F500
G1 X75 Y80 Z0 F300
G1 X0 Y80 Z40 F1000
; Ulangan 2
G1 X0 Y80 Z0 F1000
G1 X-75 Y80 Z0 F300
G1 X0 Y80 Z0 F500
G1 X75 Y80 Z0 F300
G1 X0 Y80 Z40 F1000

; --- Y=180 ---
G0 X0 Y180 Z40
G1 X0 Y180 Z0 F1000
G1 X-70 Y180 Z0 F300
G1 X0 Y180 Z0 F500
G1 X70 Y180 Z0 F300
G1 X0 Y180 Z40 F1000
; Ulangan 2
G1 X0 Y180 Z0 F1000
G1 X-70 Y180 Z0 F300
G1 X0 Y180 Z0 F500
G1 X70 Y180 Z0 F300
G1 X0 Y180 Z40 F1000

; --- Y=280 ---
G0 X0 Y280 Z40
G1 X0 Y280 Z0 F1000
G1 X-65 Y280 Z0 F300
G1 X0 Y280 Z0 F500
G1 X65 Y280 Z0 F300
G1 X0 Y280 Z40 F1000
; Ulangan 2
G1 X0 Y280 Z0 F1000
G1 X-65 Y280 Z0 F300
G1 X0 Y280 Z0 F500
G1 X65 Y280 Z0 F300
G1 X0 Y280 Z40 F1000


; ============================================================
; POLA 3: EFFLEURAGE BETIS
; Stroke memanjang dari lutut ke tumit
; ============================================================

; --- Betis Kiri (X=-45) - Ulangan 1 ---
G0 X-45 Y410 Z40
G1 X-45 Y410 Z0 F1000
G1 X-45 Y780 Z0 F300
G1 X-45 Y780 Z40 F1000
; --- Ulangan 2 ---
G0 X-45 Y410 Z40
G1 X-45 Y410 Z0 F1000
G1 X-45 Y780 Z0 F300
G1 X-45 Y780 Z40 F1000

; --- Betis Kanan (X=45) - Ulangan 1 ---
G0 X45 Y410 Z40
G1 X45 Y410 Z0 F1000
G1 X45 Y780 Z0 F300
G1 X45 Y780 Z40 F1000
; --- Ulangan 2 ---
G0 X45 Y410 Z40
G1 X45 Y410 Z0 F1000
G1 X45 Y780 Z0 F300
G1 X45 Y780 Z40 F1000


; ============================================================
; POLA 4: STROKE LATERAL BETIS
; ============================================================

; --- Y=490 ---
G0 X0 Y490 Z40
G1 X0 Y490 Z0 F1000
G1 X-55 Y490 Z0 F300
G1 X0 Y490 Z0 F500
G1 X55 Y490 Z0 F300
G1 X0 Y490 Z40 F1000
; Ulangan 2
G1 X0 Y490 Z0 F1000
G1 X-55 Y490 Z0 F300
G1 X0 Y490 Z0 F500
G1 X55 Y490 Z0 F300
G1 X0 Y490 Z40 F1000

; --- Y=620 ---
G0 X0 Y620 Z40
G1 X0 Y620 Z0 F1000
G1 X-50 Y620 Z0 F300
G1 X0 Y620 Z0 F500
G1 X50 Y620 Z0 F300
G1 X0 Y620 Z40 F1000
; Ulangan 2
G1 X0 Y620 Z0 F1000
G1 X-50 Y620 Z0 F300
G1 X0 Y620 Z0 F500
G1 X50 Y620 Z0 F300
G1 X0 Y620 Z40 F1000


; ============================================================
; POLA 5: LINGKARAN BETIS (area gastrocnemius, otot betis)
; Pusat kiri: X=-40, Y=540 | Pusat kanan: X=40, Y=540, R=40
; ============================================================

; --- Betis Kiri - Ulangan 1 ---
G0 X0 Y540 Z40
G1 X0 Y540 Z0 F1000
G1 X-11 Y568 Z0 F300
G1 X-40 Y580 Z0 F300
G1 X-69 Y568 Z0 F300
G1 X-80 Y540 Z0 F300
G1 X-69 Y512 Z0 F300
G1 X-40 Y500 Z0 F300
G1 X-11 Y512 Z0 F300
G1 X0 Y540 Z0 F300
G1 X0 Y540 Z40 F1000
; --- Ulangan 2 ---
G1 X0 Y540 Z0 F1000
G1 X-11 Y568 Z0 F300
G1 X-40 Y580 Z0 F300
G1 X-69 Y568 Z0 F300
G1 X-80 Y540 Z0 F300
G1 X-69 Y512 Z0 F300
G1 X-40 Y500 Z0 F300
G1 X-11 Y512 Z0 F300
G1 X0 Y540 Z0 F300
G1 X0 Y540 Z40 F1000

; --- Betis Kanan - Ulangan 1 ---
G0 X80 Y540 Z40
G1 X80 Y540 Z0 F1000
G1 X69 Y568 Z0 F300
G1 X40 Y580 Z0 F300
G1 X11 Y568 Z0 F300
G1 X0 Y540 Z0 F300
G1 X11 Y512 Z0 F300
G1 X40 Y500 Z0 F300
G1 X69 Y512 Z0 F300
G1 X80 Y540 Z0 F300
G1 X80 Y540 Z40 F1000
; --- Ulangan 2 ---
G1 X80 Y540 Z0 F1000
G1 X69 Y568 Z0 F300
G1 X40 Y580 Z0 F300
G1 X11 Y568 Z0 F300
G1 X0 Y540 Z0 F300
G1 X11 Y512 Z0 F300
G1 X40 Y500 Z0 F300
G1 X69 Y512 Z0 F300
G1 X80 Y540 Z0 F300
G1 X80 Y540 Z40 F1000


; ============================================================
; SELESAI - Kembali ke Start Position
; ============================================================
G0 X0 Y0 Z40
G28
