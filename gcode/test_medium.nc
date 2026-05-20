; ============================================================
; TEST MEDIUM - Pola dasar punggung atas (area kecil)
; Koordinat aman: X ±50mm, Y 0..100mm, Z 0..25mm
; ============================================================
; Set Start Position di tengah area yang ingin dipijat
; ============================================================

G21
G90
G28

; === Stroke 1: Maju lurus di tengah (spine) ===
G0 X0 Y0 Z25
G1 X0 Y0 Z0 F800
G1 X0 Y80 Z0 F300
G1 X0 Y80 Z25 F800

; === Stroke 2: Ulang maju lurus ===
G0 X0 Y0 Z25
G1 X0 Y0 Z0 F800
G1 X0 Y80 Z0 F300
G1 X0 Y80 Z25 F800

; === Stroke 3: Lateral kiri di Y=20 ===
G0 X0 Y20 Z25
G1 X0 Y20 Z0 F800
G1 X-50 Y20 Z0 F300
G1 X0 Y20 Z25 F800

; === Stroke 4: Lateral kanan di Y=20 ===
G0 X0 Y20 Z25
G1 X0 Y20 Z0 F800
G1 X50 Y20 Z0 F300
G1 X0 Y20 Z25 F800

; === Stroke 5: Lateral kiri di Y=50 ===
G0 X0 Y50 Z25
G1 X0 Y50 Z0 F800
G1 X-50 Y50 Z0 F300
G1 X0 Y50 Z25 F800

; === Stroke 6: Lateral kanan di Y=50 ===
G0 X0 Y50 Z25
G1 X0 Y50 Z0 F800
G1 X50 Y50 Z0 F300
G1 X0 Y50 Z25 F800

; === Stroke 7: Lateral kiri di Y=80 ===
G0 X0 Y80 Z25
G1 X0 Y80 Z0 F800
G1 X-45 Y80 Z0 F300
G1 X0 Y80 Z25 F800

; === Stroke 8: Lateral kanan di Y=80 ===
G0 X0 Y80 Z25
G1 X0 Y80 Z0 F800
G1 X45 Y80 Z0 F300
G1 X0 Y80 Z25 F800

; === Stroke 9: Diagonal kiri atas ke kanan bawah ===
G0 X-40 Y10 Z25
G1 X-40 Y10 Z0 F800
G1 X40 Y90 Z0 F300
G1 X40 Y90 Z25 F800

; === Stroke 10: Diagonal kanan atas ke kiri bawah ===
G0 X40 Y10 Z25
G1 X40 Y10 Z0 F800
G1 X-40 Y90 Z0 F300
G1 X-40 Y90 Z25 F800

; === Stroke 11: Ulang spine dari atas ke bawah ===
G0 X0 Y0 Z25
G1 X0 Y0 Z0 F800
G1 X0 Y100 Z0 F300
G1 X0 Y100 Z25 F800

; === Stroke 12: Ulang spine 2 ===
G0 X0 Y0 Z25
G1 X0 Y0 Z0 F800
G1 X0 Y100 Z0 F300
G1 X0 Y100 Z25 F800

; === Kembali ke Start ===
G0 X0 Y0 Z25
G28
