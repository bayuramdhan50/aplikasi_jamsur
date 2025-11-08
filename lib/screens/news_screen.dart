import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<News> newsList = [
      News(
        title: 'Teknologi AI Semakin Berkembang Pesat di Indonesia',
        category: 'Teknologi',
        date: '9 Nov 2025',
        imageUrl: 'T',
        description:
            'Perkembangan kecerdasan buatan di Indonesia menunjukkan tren positif dengan banyaknya startup yang fokus di bidang AI.',
        author: 'Ahmad Tech',
      ),
      News(
        title: 'Ekonomi Digital Indonesia Tumbuh 20% di Tahun Ini',
        category: 'Ekonomi',
        date: '8 Nov 2025',
        imageUrl: 'E',
        description:
            'Pertumbuhan ekonomi digital mencapai rekor baru dengan peningkatan signifikan di sektor e-commerce dan fintech.',
        author: 'Siti Ekonomi',
      ),
      News(
        title: 'Olahraga Nasional Raih Prestasi di Kompetisi Asia',
        category: 'Olahraga',
        date: '7 Nov 2025',
        imageUrl: 'O',
        description:
            'Tim nasional berhasil meraih medali emas dalam berbagai cabang olahraga di ajang kompetisi tingkat Asia.',
        author: 'Budi Sport',
      ),
      News(
        title: 'Pendidikan Online Menjadi Tren Baru di Era Modern',
        category: 'Pendidikan',
        date: '6 Nov 2025',
        imageUrl: 'P',
        description:
            'Platform pendidikan online semakin diminati dengan berbagai fitur interaktif yang memudahkan proses belajar.',
        author: 'Dewi Edukasi',
      ),
      News(
        title: 'Kesehatan Masyarakat Meningkat dengan Program Vaksinasi',
        category: 'Kesehatan',
        date: '5 Nov 2025',
        imageUrl: 'K',
        description:
            'Program vaksinasi nasional berhasil meningkatkan imunitas masyarakat terhadap berbagai penyakit.',
        author: 'Dr. Eko',
      ),
      News(
        title: 'Wisata Lokal Mulai Bangkit Pasca Pandemi',
        category: 'Travel',
        date: '4 Nov 2025',
        imageUrl: 'W',
        description:
            'Sektor pariwisata domestik menunjukkan pemulihan yang menggembirakan dengan kunjungan wisatawan meningkat.',
        author: 'Fitri Travel',
      ),
      News(
        title: 'Inovasi Energi Terbarukan Untuk Masa Depan',
        category: 'Lingkungan',
        date: '3 Nov 2025',
        imageUrl: 'L',
        description:
            'Indonesia mengembangkan berbagai proyek energi terbarukan untuk mengurangi ketergantungan pada energi fosil.',
        author: 'Gunawan Green',
      ),
      News(
        title: 'Kuliner Nusantara Mendunia di Festival Internasional',
        category: 'Kuliner',
        date: '2 Nov 2025',
        imageUrl: 'F',
        description:
            'Makanan khas Indonesia mendapat sambutan luar biasa di festival kuliner internasional.',
        author: 'Chef Hana',
      ),
      News(
        title: 'Startup Indonesia Raih Pendanaan Fantastis',
        category: 'Bisnis',
        date: '1 Nov 2025',
        imageUrl: 'B',
        description:
            'Beberapa startup lokal berhasil mendapatkan pendanaan miliaran rupiah dari investor asing.',
        author: 'Indra Bisnis',
      ),
      News(
        title: 'Film Indonesia Berjaya di Festival Film Asia',
        category: 'Hiburan',
        date: '31 Okt 2025',
        imageUrl: 'H',
        description:
            'Karya sineas Indonesia meraih penghargaan bergengsi di ajang festival film tingkat Asia.',
        author: 'Jasmine Cinema',
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade50, Colors.white],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: Colors.orange.shade700,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Berita Terkini',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange.shade800, Colors.orange.shade600],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.article, color: Colors.orange.shade700),
                    const SizedBox(width: 8),
                    Text(
                      '${newsList.length} Artikel Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.update,
                            size: 16,
                            color: Colors.orange.shade700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Terbaru',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final news = newsList[index];
                  return _buildNewsCard(context, news, index);
                }, childCount: newsList.length),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, News news, int index) {
    final categoryColors = <String, MaterialColor>{
      'Teknologi': Colors.blue,
      'Ekonomi': Colors.green,
      'Olahraga': Colors.red,
      'Pendidikan': Colors.purple,
      'Kesehatan': Colors.teal,
      'Travel': Colors.orange,
      'Lingkungan': Colors.lightGreen,
      'Kuliner': Colors.amber,
      'Bisnis': Colors.indigo,
      'Hiburan': Colors.pink,
    };

    final color = categoryColors[news.category] ?? Colors.grey;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _showNewsDetail(context, news, color);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Header
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color.shade300, color.shade600],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.article,
                        size: 80,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          news.category,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      news.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: color.shade100,
                          child: Text(
                            news.author[0],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            news.author,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          news.date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNewsDetail(BuildContext context, News news, MaterialColor color) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.zero,
                children: [
                  // Handle Bar
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header Image
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [color.shade300, color.shade600],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.article,
                        size: 100,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Category Badge
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: color.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.category, size: 16, color: color),
                          const SizedBox(width: 6),
                          Text(
                            news.category,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      news.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Author & Date
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: color.shade100,
                          child: Text(
                            news.author[0],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.author,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                news.date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Divider(color: Colors.grey.shade200),

                  const SizedBox(height: 20),

                  // Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      news.description +
                          '\n\n' +
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.\n\n' +
                          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n' +
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
