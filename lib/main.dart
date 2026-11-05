import 'package:material_ui/material_ui.dart';

import 'widgets/tombol_ikuti.dart';

void main() => runApp(const KartuNamaApp());

/// Tantangan 2: Stateful karena menyimpan mode tema yang bisa diganti.
class KartuNamaApp extends StatefulWidget {
  const KartuNamaApp({super.key});

  @override
  State<KartuNamaApp> createState() => _KartuNamaAppState();
}

class _KartuNamaAppState extends State<KartuNamaApp> {
  ThemeMode _mode = ThemeMode.system;

  void _gantiTema(Brightness saatIni) {
    setState(() {
      _mode = saatIni == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Nama Digital',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF02569B)),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF02569B),
          brightness: Brightness.dark,
        ),
      ),
      home: HalamanProfil(onGantiTema: _gantiTema),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key, required this.onGantiTema});

  final void Function(Brightness saatIni) onGantiTema;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final skema = tema.colorScheme;
    final teks = tema.textTheme;
    final gelap = tema.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kartu Nama Digital'),
        actions: [
          IconButton(
            tooltip: 'Ganti tema',
            onPressed: () => onGantiTema(tema.brightness),
            icon: Icon(gelap ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 56,
                backgroundColor: skema.primaryContainer,
                child: Text('TM', style: teks.headlineMedium),
              ),
              const SizedBox(height: 16),
              Text(
                'Muhammad Tsabat Muhyiyuddin',
                style: teks.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Text(
                'Mahasiswa Ilmu Komputer · UNIMED',
                style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
              ),
              const SizedBox(height: 16),
              const Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('Flutter')),
                  Chip(label: Text('Dart')),
                  Chip(label: Text('Kelas PSIK24D')),
                ],
              ),
              const SizedBox(height: 16),
              const Card(
                child: Column(
                  children: [
                    BarisKontak(
                      ikon: Icons.badge_outlined,
                      judul: 'NIM 4243250002',
                    ),
                    Divider(height: 1),
                    BarisKontak(ikon: Icons.code, judul: 'github.com/tsabat15'),
                    Divider(height: 1),
                    BarisKontak(
                      ikon: Icons.location_on_outlined,
                      judul: 'Medan, Sumatera Utara',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const TombolIkuti(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tantangan 3: baris kontak yang menampilkan SnackBar saat ditekan.
class BarisKontak extends StatelessWidget {
  const BarisKontak({super.key, required this.ikon, required this.judul});

  final IconData ikon;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(judul),
      onTap: () =>
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Disalin: $judul'))),
    );
  }
}
