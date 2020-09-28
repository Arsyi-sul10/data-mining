# Introduction to R

## Apa itu R?

R adalah sebuah bahasa pemograman yang digunakan untuk analisis statistika. Berdasarkan [Wikipedia](<https://id.wikipedia.org/wiki/R_(bahasa_pemrograman)>), Bahasa R kini menjadi standar de facto di antara statistikawan untuk pengembangan perangkat lunak statistika, serta digunakan secara luas untuk pengembangan perangkat lunak statistika dan analisis data

## Basic Syntax

### Output

Sama seperti python, output di R bisa langsung mengetikkan apa yang mau di print kemudian dijalankan ataupun menggunakan syntax _print_.

##### Contoh

```
5 + 7 # Output: 12
print(5 + 7) # Output : 12

"Hello World" # Output: "Hello World"
print("Hello World") # Output: "Hello World"
```

### Operator and Value Assignment

#### 1. Assignment Operator

Assignment Operator adalah operator yang digunakan untuk memberikan nilai ke dalam sebuah variabel.
Di R, tipe data dari sebuah variabel bisa berubah-ubah. Misalkan variabel _angka_ memiliki tipe data _numeric_, _angka_ juga bisa berubah menjadi tipe data _character_.

| Operator           | Kegunaan                                                                                                                             |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| <- <br> <<- <br> = | Left Assignment untuk memberi nilai yang ada di sebelah kanan ke variabel yang ada di sebelah kiri                                   |
| -> <br> ->>        | Right Assignment untuk memberi nilai yang ada di sebelah kiri ke variabel yang ada di sebelah kanan (kebalikan dari Left Assignment) |

##### Contoh

```
# Set value variable angka

# Left Assignment
angka <- 10
class(angka)  # numeric
angka <- "Angka 10"
class(angka) # character

# Right Assignment
10 -> angka
```

##### Perbedaan <- dan =

Variabel yang di definisikan menggunakan = di dalam function call hanya akan berlaku di fungsi itu saja, sementara dengan <-, variabel tersebut terdeklarasi di workspace sehingga bisa dipanggil.
Simplenya kita bisa katakan sebagai = untuk assign variabel local dan <- untuk assign variabel global

#### 2. Arithmetic Operator

Operator yang digunakan untuk mengoperasikan kalkulasi aritmatika.

| Operator | Deskripsi               |
| -------- | ----------------------- |
| +        | Penjumlahan             |
| -        | Pengurangan             |
| \*       | Perkalian               |
| /        | Pembagian desimal       |
| %/%      | Pembagian tanpa desimal |
| %%       | Modulus (sisa bagi)     |
| ^        | Pangkat                 |

#### 3. Relational Operator

Operator yang digunakan untuk membandingkan sebuah value dengan value lainnya

| Operator | Deskripsi                         |
| -------- | --------------------------------- |
| >        | Lebih besar dari                  |
| <        | Lebih kecil dari                  |
| ==       | Sama dengan                       |
| <=       | Lebih kecil dari atau sama dengan |
| >=       | Lebih besar dari atau sama dengan |
| !=       | Tidak sama dengan                 |

#### 4. Logical Operator

Operator yang digunakan untuk kalkulasi logika matematika

| Operator | Deskripsi                 |
| -------- | ------------------------- |
| &        | Dan (Element-wise)        |
| \|       | Atau (Element-wise)       |
| !        | Tidak (Element-wise)      |
| &&       | Dan (Tidak Element-wise)  |
| \|\|     | Atau (Tidak Element-wise) |

##### Perbedaan Wise dan Tidak Wise

Perbedaannya akan terlihat ketika kita menggunakan _vector_. **Element-wise** akan mengaplikasikan operator logisnya pada semua element di vector, sedangkan **Tidak Element-wise** hanya akan mengaplikasikan operator logisnya pada element pertama di vector

```
1 & c(1, 0, 1, 1) # Output: TRUE FALSE TRUE TRUE

1 && c(1, 0, 1, 1) # Output: TRUE
```

### Tipe Data

Ada beberapa tipe data yang terdapat di R:

| Tipe Data | Keterangan        | Contoh        |
| --------- | ----------------- | ------------- |
| Logical   | Boolean           | TRUE, FALSE   |
| Numeric   | Bilangan desimal  | 10, 2.3       |
| Integer   | Bilangan Bulat    | 2L, 10L       |
| Complex   | Bilangan Imajiner | sqrt(-1)      |
| Character | Karakter          | "Hello World" |

## 2. Vector

Vector adalah object data di R yang paling dasar. Simplenya Vector itu adalah array 1 dimensi, Matrix adalah array 2 dimensi dan Array sendiri bisa dalam bentuk 1 dimensi ataupun 2 dimensi. Index pertama vector adalah 1

### 2.1. Inisialisasi

Untuk melakukan inisialisasi kita bisa menggunakan syntax:

```
NilaiAwal : NilaiAkhir

# or

c(NilaiAwal : NilaiAkhir)

#or

c(1, 2, 10)

#or

c("hai", "hei", "hoi")
```

Ketika membuat sebuah vector, data akan bertambah/berkurang 1 by default, tidak peduli dia adalah bilangan bulat atau tidak. Data yang akan ditampilkan adalah daya yang >= NlaiAwal dan <= NilaiAkhir

```
a <- c(1:5)
a # Output: 1 2 3 4 5

a <- c(1.2:5)
a # Output: 1.2 2.2 3.2 4.2
```

Jika ingin mengubah increment/decrement dari vector, kita harus menggunakan syntax _seq()_

```
seq(0, 5, by=0.5)
# Output: 0.0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0
```

### 2.2. Mengakses Vector

Kita buat terlebih dahulu sebuah vector.

```
hewan <- c("Ayam", "Bebek", "Cecak", "Domba")
```

Untuk mengaksesnya ada beberapa cara:

#### 2.2.1. Print semua isinya

```
hewan

#Output: "Ayam"  "Bebek" "Cecak" "Domba"
```

#### 2.2.2. Print berdasarkan index

```
hewan[c(1,3,4)]

#Output: "Ayam"  "Cecak" "Domba"
```

#### 2.2.3. Print beberapa secara berurutan

```
hewan[c(1:3)]

#Output: "Ayam"  "Bebek" "Cecak"
```

#### 2.2.4 Print berdasarkan kondisi TRUE FALSE

```
hewan[c(TRUE, TRUE, FALSE, TRUE)]

#Output: "Ayam"  "Bebek" "Domba"
```

### 2.3. Manipulasi Vector

Untuk memanipulasinya ada hal yang perlu diperhatikan yaitu panjang dari vector.
Jika kita ingin mengkalkulasikan 2 vector, maka ukuran dari salah satu vector harus bisa habis dibagi vector lainnya.

Ada beberapa kondisi:

#### 2.3.1. Ukuran kedua vector adalah sama

```
a <- c(1, 2, 3, 4)
b <- c(10, 20, 30, 40)

a + b
# Output: 11 22 33 44

# Perhitungannya adalah
# (a[1] + b[1])  (a[2] + b[2])
# (a[3] + b[3])  (a[4] + b[4])
```

#### 2.3.2. Ukuran kedua vector tidak sama

```
a <- c(1, 2, 3, 4)
b <- c(10, 20)

a + b
# Output: 11 22 13 24

# Perhitungannya adalah
# (a[1] + b[1])  (a[2] + b[2])
# (a[3] + b[1])  (a[4] + b[2])
```

### 2.4. Sorting Vector

```
vec <- c(1,5,2,4,3)
sort(vec, decreasing = TRUE)
#Output: 5 4 3 2 1
```

## 3. Matrix
