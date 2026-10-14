import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color biru = Color(0xFF4361EE);
const Color ungu = Color(0xFF7209B7);
const Color latar = Color(0xFFF4F6FC);
const Color warnaTeks = Color(0xFF30374A);
const Color warnaGaris = Color(0xFFDCE3F3);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: latar,
        colorScheme: ColorScheme.fromSeed(seedColor: biru),
      ),
      home: const ProfilMahasiswaPage(),
    );
  }
}

class ProfilMahasiswaPage extends StatelessWidget {
  const ProfilMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu Profil Mahasiswa')),
            );
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'detail') {
                _showDetail(context);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'detail', child: Text('Detail Mahasiswa')),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Foto profil
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: biru,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/foto_profil.jpeg',
                          width: 112,
                          height: 112,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 112,
                              height: 112,
                              color: const Color(0xFFDCE5FF),
                              child: const Icon(
                                Icons.person,
                                size: 78,
                                color: biru,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Muhammad Nurul Mudzakkir',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: warnaTeks,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Kartu identitas
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: warnaGaris),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        ProfileRow(
                          label: 'NIM',
                          value: '2495114014',
                          color: biru,
                          icon: Icons.credit_card,
                        ),
                        ProfileRow(
                          label: 'Program Studi',
                          value: 'Teknik Informatika',
                          color: ungu,
                          icon: Icons.school,
                        ),
                        ProfileRow(
                          label: 'Universitas',
                          value: 'Universitas Hasyim Asy’ari',
                          color: Color(0xFF00897B),
                          icon: Icons.account_balance,
                        ),
                        ProfileRow(
                          label: 'Hobi / Deskripsi Singkat',
                          value: 'Belum diisi',
                          color: Color(0xFFEF6C00),
                          icon: Icons.favorite,
                          last: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Informasi tambahan
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: warnaGaris),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.025),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8EAFE),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Icon(
                            Icons.image_outlined,
                            size: 40,
                            color: biru,
                          ),
                        ),
                        const SizedBox(width: 13),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Informasi Tambahan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: warnaTeks,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Kelas: TI-5A',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF596174),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Program Studi: Teknik Informatika',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF596174),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tombol detail
                  Center(
                    child: SizedBox(
                      width: 220,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () => _showDetail(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: biru,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Detail Mahasiswa', style: TextStyle(color: biru)),
        content: const SingleChildScrollView(
          child: Text(
            'Nama: Muhammad Nurul Mudzakkir\n'
            'NIM: 2495114014\n'
            'Kelas: TI-5A\n'
            'Program Studi: Teknik Informatika\n'
            'Universitas: Universitas Hasyim Asy’ari\n'
            'Hobi: Belum diisi\n'
            'Deskripsi: Belum diisi',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  final bool last;

  const ProfileRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
    this.last = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: last
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE6EAF2))),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 430;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ikon
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, size: 18, color: color),
              ),

              const SizedBox(width: 10),

              // Label
              Expanded(
                flex: isNarrow ? 5 : 4,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF42495A),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              const Text(
                ':',
                style: TextStyle(fontSize: 13, color: Color(0xFF8991A3)),
              ),

              const SizedBox(width: 10),

              // Nilai berada dekat dengan label
              Expanded(
                flex: isNarrow ? 5 : 4,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F3FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      value,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: warnaTeks,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
