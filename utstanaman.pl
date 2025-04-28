:- dynamic gejala/2.

% Tanya dan simpan jawaban
tanya(Gejala) :-
    write('Apakah '), write(Gejala), write('? (y/n): '),
    read(Jawaban),
    assertz(gejala(Gejala, Jawaban)).

% Cek jawaban yang sudah ada
ya(Gejala) :-
    gejala(Gejala, y).

tidak(Gejala) :-
    gejala(Gejala, n).

% Rules deteksi hama berdasarkan kombinasi jawaban
deteksi_hama(Hama) :-
    ya('daun tanaman menguning'),
    ya('tanaman tampak layu'),
    !, Hama = 'Virus tanaman'.

deteksi_hama(Hama) :-
    ya('daun tanaman menguning'),
    ya('terdapat bercak hitam pada tanaman'),
    !, Hama = 'Kutu daun'.

deteksi_hama(Hama) :-
    ya('daun tanaman berlubang'),
    ya('terdapat bercak hitam pada tanaman'),
    !, Hama = 'Hama kombinasi (Jamur + Ulat)'.

deteksi_hama(Hama) :-
    ya('daun tanaman berlubang'),
    ya('tanaman tampak layu'),
    !, Hama = 'Serangan ulat berat'.

deteksi_hama(Hama) :-
    ya('terdapat bercak hitam pada tanaman'),
    ya('tanaman tampak layu'),
    !, Hama = 'Infeksi jamur berat'.

deteksi_hama(Hama) :-
    ya('terdapat bercak hitam pada tanaman'),
    !, Hama = 'Jamur daun'.

deteksi_hama(Hama) :-
    ya('daun tanaman berlubang'),
    !, Hama = 'Ulat daun'.

deteksi_hama(Hama) :-
    ya('daun tanaman menguning'),
    !, Hama = 'Kekurangan nutrisi'.

deteksi_hama(Hama) :-
    ya('tanaman tampak layu'),
    !, Hama = 'Infeksi akar atau kekeringan'.

deteksi_hama('Hama tidak diketahui').

% Bersihkan jawaban sebelum mulai
reset :-
    retractall(gejala(_, _)).

% Mulai sistem pakar
start :-
    reset,
    tanya('daun tanaman menguning'),
    tanya('tanaman tampak layu'),
    tanya('terdapat bercak hitam pada tanaman'),
    tanya('daun tanaman berlubang'),
    deteksi_hama(Hama),
    nl,
    write('Jenis hama yang terdeteksi: '), write(Hama), nl.
