def tanya(pertanyaan):
    jawaban = input(pertanyaan + " (y/n): ").lower()
    return jawaban == "y"

def deteksi_hama():
    print("Jawablah pertanyaan berikut untuk mendeteksi jenis hama pada tanaman:")

    gejala_daun_menguning = tanya("Apakah daun tanaman menguning?")
    gejala_tanaman_layu = tanya("Apakah tanaman tampak layu?")
    gejala_bercak_hitam = tanya("Apakah terdapat bercak hitam pada tanaman?")
    gejala_daun_berlubang = tanya("Apakah daun tanaman berlubang?")

    if gejala_daun_menguning and gejala_tanaman_layu:
        return "Virus tanaman"
    elif gejala_daun_menguning and gejala_bercak_hitam:
        return "Kutu daun"
    elif gejala_daun_berlubang and gejala_bercak_hitam:
        return "Hama kombinasi (Jamur + Ulat)"
    elif gejala_daun_berlubang and gejala_tanaman_layu:
        return "Serangan ulat berat"
    elif gejala_bercak_hitam and gejala_tanaman_layu:
        return "Infeksi jamur berat"
    elif gejala_bercak_hitam:
        return "Jamur daun"
    elif gejala_daun_berlubang:
        return "Ulat daun"
    elif gejala_daun_menguning:
        return "Kekurangan nutrisi"
    elif gejala_tanaman_layu:
        return "Infeksi akar atau kekeringan"
    else:
        return "Hama tidak diketahui"

hasil = deteksi_hama()
print("Jenis hama yang terdeteksi:", hasil)
