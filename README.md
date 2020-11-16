# ReinforcementLearning

Melakukan proses pengambilan keputusan (aksi) terhadap perubahan tegangan pada jaringan sistem tenaga dengan menggunakan Q-Learning. Pada jaringan sistem tenaga, diperlukan tegangan beban berkisar 0.95-1.05 pu. Dalam kasus tertentu hal ini tidak dapat dicapai dan perlu dilakukan sejumlah aksi, agar tegangan dapat bergeser ke nilai yang dibutuhkan,
1.	States Space
State didefinisikan sebagai vektor dari informasi sistem yang digunakan untuk merepresentasikan kondisi sistem
•	Tegangan pada beban yang terkuantisasi (0.05)
[ 0,0.5, 0.1, 0.15, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1, 1.05, 1.1, 1.15, 1.2, 1.25, 1.3, 1.35, 1.4, 1.45, 1.5]
(30 state)
2.	Action Space
Pada tugas ini, aksi yang dipilih untuk diterapkan pada Reinforcement Learning adalah menyesuaikan set point. Untuk tiap generator, tegangan terminal dapat diatur dengan rentang [0.95, 0.975, 1.0, 1.025, 1.05]. Sedangkan untuk tap trafo dapat diatur menjadi [-2.5% 0 2.5%]. Kombinasi dari semua generator yang tersedia menjadi Action Space untuk melatih Agent. (15 state)

3.	Reward
Terdapat beberapa zona operasi tegangan yang didefinisikan untuk mengetahui kualitas distribusi tegangan. 
- Normal Zone (0.95-1.05 pu)
- Violation Zone (0.8-0.95 pu atau 1.05-1.25 pu)
- Diverged Zone (<0.8 pu atau > 1.25 pu)
