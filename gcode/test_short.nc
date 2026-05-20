; ============================================================
; TEST PENDEK - Hanya 3 gerakan untuk uji encoder logging
; ============================================================
; Jog robot ke posisi aman, Set Start Position, lalu run.
; X=0, Y=0 = posisi awal robot
; Gerakan sangat kecil agar tidak out of reach
; ============================================================

G21
G90
G28

; Maju sedikit di Y
G0 X0 Y0 Z20
G1 X0 Y30 Z0 F300

; Geser kanan
G1 X20 Y30 Z0 F300

; Kembali ke awal
G1 X0 Y0 Z0 F300

G0 X0 Y0 Z20
G28
