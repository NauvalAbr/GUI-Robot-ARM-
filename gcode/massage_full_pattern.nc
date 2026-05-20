; ============================================================
; AR4 ROBOT - POLA PIJAT PUNGGUNG + KAKI
; ============================================================
; CARA PAKAI:
;   1. Posisikan robot di atas puncak tulang belakang (leher)
;   2. Set Start Position di GUI G-Code Tab:
;      X = posisi aktual robot di tulang belakang (tengah)
;      Y = posisi aktual robot di bagian atas punggung (leher)
;      Z = posisi aktual robot menyentuh kulit (kontak ringan)
;   3. Load file ini di G-Code Tab, klik Convert & Run
;
; SISTEM KOORDINAT (relatif dari Start Position):
;   X = 0   : tengah tulang belakang
;   X negatif: sisi kiri pasien
;   X positif: sisi kanan pasien
;   Y = 0   : bagian atas punggung (bahu/leher)
;   Y positif: ke arah kaki
;   Z = 0   : kontak kulit
;   Z = 40  : ketinggian aman (travel)
;
; FEEDRATE:
;   F1000 = pergerakan cepat (travel, tidak menyentuh)
;   F300  = gerakan pijat (lambat, kontak)
;   F500  = reposisi di atas kulit
; ============================================================

G21        ; satuan metrik (mm)
G90        ; koordinat absolut
G28        ; pindah ke Start Position

; ============================================================
; BAGIAN 1: EFFLEURAGE TULANG BELAKANG
; Gerakan mengusap sepanjang tulang belakang dari atas ke bawah
; Diulang 2 kali
; ============================================================

; --- Ulangan 1 ---
G0 X0 Y0 Z40         ; angkat ke ketinggian aman, posisi atas
G1 X0 Y0 Z0 F1000    ; turun ke kulit
G1 X0 Y230 Z0 F300   ; usap ke bawah sepanjang tulang belakang
G1 X0 Y230 Z40 F1000 ; angkat
G0 X0 Y0 Z40         ; kembali ke atas

; --- Ulangan 2 ---
G1 X0 Y0 Z0 F1000
G1 X0 Y230 Z0 F300
G1 X0 Y230 Z40 F1000
G0 X0 Y0 Z40


; ============================================================
; BAGIAN 2: STROKE LATERAL PUNGGUNG ATAS
; Gerakan menyilang keluar dari tulang belakang (kiri & kanan)
; Setiap ketinggian Y diulang 2 kali, lalu turun ke Y berikutnya
; ============================================================

; --- Y=20 (bahu atas) ---
; Ulangan 1
G0 X0 Y20 Z40
G1 X0 Y20 Z0 F1000
G1 X-65 Y20 Z0 F300     ; usap ke kiri
G1 X0 Y20 Z0 F500       ; kembali ke tengah
G1 X65 Y20 Z0 F300      ; usap ke kanan
G1 X0 Y20 Z40 F1000     ; angkat
; Ulangan 2
G1 X0 Y20 Z0 F1000
G1 X-65 Y20 Z0 F300
G1 X0 Y20 Z0 F500
G1 X65 Y20 Z0 F300
G1 X0 Y20 Z40 F1000

; --- Y=45 ---
; Ulangan 1
G0 X0 Y45 Z40
G1 X0 Y45 Z0 F1000
G1 X-70 Y45 Z0 F300
G1 X0 Y45 Z0 F500
G1 X70 Y45 Z0 F300
G1 X0 Y45 Z40 F1000
; Ulangan 2
G1 X0 Y45 Z0 F1000
G1 X-70 Y45 Z0 F300
G1 X0 Y45 Z0 F500
G1 X70 Y45 Z0 F300
G1 X0 Y45 Z40 F1000

; --- Y=70 ---
; Ulangan 1
G0 X0 Y70 Z40
G1 X0 Y70 Z0 F1000
G1 X-70 Y70 Z0 F300
G1 X0 Y70 Z0 F500
G1 X70 Y70 Z0 F300
G1 X0 Y70 Z40 F1000
; Ulangan 2
G1 X0 Y70 Z0 F1000
G1 X-70 Y70 Z0 F300
G1 X0 Y70 Z0 F500
G1 X70 Y70 Z0 F300
G1 X0 Y70 Z40 F1000


; ============================================================
; BAGIAN 3: LINGKARAN BAHU
; Gerakan melingkar di area trapezius kiri dan kanan
; Diulang 2 kali per sisi
; ============================================================

; --- Bahu Kiri (pusat X=-80, Y=30, R=25) ---
; Ulangan 1
G0 X-55 Y30 Z40
G1 X-55 Y30 Z0 F1000
G1 X-62 Y48 Z0 F300
G1 X-80 Y55 Z0 F300
G1 X-98 Y48 Z0 F300
G1 X-105 Y30 Z0 F300
G1 X-98 Y12 Z0 F300
G1 X-80 Y5 Z0 F300
G1 X-62 Y12 Z0 F300
G1 X-55 Y30 Z0 F300
G1 X-55 Y30 Z40 F1000
; Ulangan 2
G1 X-55 Y30 Z0 F1000
G1 X-62 Y48 Z0 F300
G1 X-80 Y55 Z0 F300
G1 X-98 Y48 Z0 F300
G1 X-105 Y30 Z0 F300
G1 X-98 Y12 Z0 F300
G1 X-80 Y5 Z0 F300
G1 X-62 Y12 Z0 F300
G1 X-55 Y30 Z0 F300
G1 X-55 Y30 Z40 F1000

; --- Bahu Kanan (pusat X=80, Y=30, R=25) ---
; Ulangan 1
G0 X55 Y30 Z40
G1 X55 Y30 Z0 F1000
G1 X62 Y48 Z0 F300
G1 X80 Y55 Z0 F300
G1 X98 Y48 Z0 F300
G1 X105 Y30 Z0 F300
G1 X98 Y12 Z0 F300
G1 X80 Y5 Z0 F300
G1 X62 Y12 Z0 F300
G1 X55 Y30 Z0 F300
G1 X55 Y30 Z40 F1000
; Ulangan 2
G1 X55 Y30 Z0 F1000
G1 X62 Y48 Z0 F300
G1 X80 Y55 Z0 F300
G1 X98 Y48 Z0 F300
G1 X105 Y30 Z0 F300
G1 X98 Y12 Z0 F300
G1 X80 Y5 Z0 F300
G1 X62 Y12 Z0 F300
G1 X55 Y30 Z0 F300
G1 X55 Y30 Z40 F1000


; ============================================================
; BAGIAN 4: STROKE LATERAL PUNGGUNG BAWAH (LUMBAR)
; ============================================================

; --- Y=110 ---
; Ulangan 1
G0 X0 Y110 Z40
G1 X0 Y110 Z0 F1000
G1 X-65 Y110 Z0 F300
G1 X0 Y110 Z0 F500
G1 X65 Y110 Z0 F300
G1 X0 Y110 Z40 F1000
; Ulangan 2
G1 X0 Y110 Z0 F1000
G1 X-65 Y110 Z0 F300
G1 X0 Y110 Z0 F500
G1 X65 Y110 Z0 F300
G1 X0 Y110 Z40 F1000

; --- Y=140 ---
; Ulangan 1
G0 X0 Y140 Z40
G1 X0 Y140 Z0 F1000
G1 X-60 Y140 Z0 F300
G1 X0 Y140 Z0 F500
G1 X60 Y140 Z0 F300
G1 X0 Y140 Z40 F1000
; Ulangan 2
G1 X0 Y140 Z0 F1000
G1 X-60 Y140 Z0 F300
G1 X0 Y140 Z0 F500
G1 X60 Y140 Z0 F300
G1 X0 Y140 Z40 F1000

; --- Y=170 ---
; Ulangan 1
G0 X0 Y170 Z40
G1 X0 Y170 Z0 F1000
G1 X-55 Y170 Z0 F300
G1 X0 Y170 Z0 F500
G1 X55 Y170 Z0 F300
G1 X0 Y170 Z40 F1000
; Ulangan 2
G1 X0 Y170 Z0 F1000
G1 X-55 Y170 Z0 F300
G1 X0 Y170 Z0 F500
G1 X55 Y170 Z0 F300
G1 X0 Y170 Z40 F1000

; --- Y=200 ---
; Ulangan 1
G0 X0 Y200 Z40
G1 X0 Y200 Z0 F1000
G1 X-50 Y200 Z0 F300
G1 X0 Y200 Z0 F500
G1 X50 Y200 Z0 F300
G1 X0 Y200 Z40 F1000
; Ulangan 2
G1 X0 Y200 Z0 F1000
G1 X-50 Y200 Z0 F300
G1 X0 Y200 Z0 F500
G1 X50 Y200 Z0 F300
G1 X0 Y200 Z40 F1000


; ============================================================
; BAGIAN 5: LINGKARAN GLUTEAL (PANTAT)
; ============================================================

; --- Gluteal Kiri (pusat X=-45, Y=270, R=35) ---
; Ulangan 1
G0 X-10 Y270 Z40
G1 X-10 Y270 Z0 F1000
G1 X-20 Y295 Z0 F300
G1 X-45 Y305 Z0 F300
G1 X-70 Y295 Z0 F300
G1 X-80 Y270 Z0 F300
G1 X-70 Y245 Z0 F300
G1 X-45 Y235 Z0 F300
G1 X-20 Y245 Z0 F300
G1 X-10 Y270 Z0 F300
G1 X-10 Y270 Z40 F1000
; Ulangan 2
G1 X-10 Y270 Z0 F1000
G1 X-20 Y295 Z0 F300
G1 X-45 Y305 Z0 F300
G1 X-70 Y295 Z0 F300
G1 X-80 Y270 Z0 F300
G1 X-70 Y245 Z0 F300
G1 X-45 Y235 Z0 F300
G1 X-20 Y245 Z0 F300
G1 X-10 Y270 Z0 F300
G1 X-10 Y270 Z40 F1000

; --- Gluteal Kanan (pusat X=45, Y=270, R=35) ---
; Ulangan 1
G0 X80 Y270 Z40
G1 X80 Y270 Z0 F1000
G1 X70 Y295 Z0 F300
G1 X45 Y305 Z0 F300
G1 X20 Y295 Z0 F300
G1 X10 Y270 Z0 F300
G1 X20 Y245 Z0 F300
G1 X45 Y235 Z0 F300
G1 X70 Y245 Z0 F300
G1 X80 Y270 Z0 F300
G1 X80 Y270 Z40 F1000
; Ulangan 2
G1 X80 Y270 Z0 F1000
G1 X70 Y295 Z0 F300
G1 X45 Y305 Z0 F300
G1 X20 Y295 Z0 F300
G1 X10 Y270 Z0 F300
G1 X20 Y245 Z0 F300
G1 X45 Y235 Z0 F300
G1 X70 Y245 Z0 F300
G1 X80 Y270 Z0 F300
G1 X80 Y270 Z40 F1000


; ============================================================
; BAGIAN 6: PAHA BELAKANG
; Stroke memanjang dari gluteal ke lutut
; ============================================================

; --- Paha Kiri ---
; Ulangan 1
G0 X-50 Y320 Z40
G1 X-50 Y320 Z0 F1000
G1 X-50 Y480 Z0 F300
G1 X-50 Y480 Z40 F1000
G0 X-50 Y320 Z40
; Ulangan 2
G1 X-50 Y320 Z0 F1000
G1 X-50 Y480 Z0 F300
G1 X-50 Y480 Z40 F1000

; --- Paha Kanan ---
; Ulangan 1
G0 X50 Y320 Z40
G1 X50 Y320 Z0 F1000
G1 X50 Y480 Z0 F300
G1 X50 Y480 Z40 F1000
G0 X50 Y320 Z40
; Ulangan 2
G1 X50 Y320 Z0 F1000
G1 X50 Y480 Z0 F300
G1 X50 Y480 Z40 F1000


; ============================================================
; BAGIAN 7: BETIS
; Stroke memanjang dari lutut ke tumit
; ============================================================

; --- Betis Kiri ---
; Ulangan 1
G0 X-40 Y490 Z40
G1 X-40 Y490 Z0 F1000
G1 X-40 Y620 Z0 F300
G1 X-40 Y620 Z40 F1000
G0 X-40 Y490 Z40
; Ulangan 2
G1 X-40 Y490 Z0 F1000
G1 X-40 Y620 Z0 F300
G1 X-40 Y620 Z40 F1000

; --- Betis Kanan ---
; Ulangan 1
G0 X40 Y490 Z40
G1 X40 Y490 Z0 F1000
G1 X40 Y620 Z0 F300
G1 X40 Y620 Z40 F1000
G0 X40 Y490 Z40
; Ulangan 2
G1 X40 Y490 Z0 F1000
G1 X40 Y620 Z0 F300
G1 X40 Y620 Z40 F1000


; ============================================================
; SELESAI - Kembali ke Start Position
; ============================================================
G0 X0 Y0 Z40
G28
