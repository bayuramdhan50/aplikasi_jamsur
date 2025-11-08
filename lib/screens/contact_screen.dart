import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(
        name: 'Ahmad Fauzi',
        phone: '+62 812-3456-7890',
        email: 'ahmad.fauzi@email.com',
        imageUrl: 'A',
      ),
      Contact(
        name: 'Siti Nurhaliza',
        phone: '+62 813-4567-8901',
        email: 'siti.nurhaliza@email.com',
        imageUrl: 'S',
      ),
      Contact(
        name: 'Budi Santoso',
        phone: '+62 814-5678-9012',
        email: 'budi.santoso@email.com',
        imageUrl: 'B',
      ),
      Contact(
        name: 'Dewi Lestari',
        phone: '+62 815-6789-0123',
        email: 'dewi.lestari@email.com',
        imageUrl: 'D',
      ),
      Contact(
        name: 'Eko Prasetyo',
        phone: '+62 816-7890-1234',
        email: 'eko.prasetyo@email.com',
        imageUrl: 'E',
      ),
      Contact(
        name: 'Fitri Handayani',
        phone: '+62 817-8901-2345',
        email: 'fitri.handayani@email.com',
        imageUrl: 'F',
      ),
      Contact(
        name: 'Gunawan Wijaya',
        phone: '+62 818-9012-3456',
        email: 'gunawan.wijaya@email.com',
        imageUrl: 'G',
      ),
      Contact(
        name: 'Hana Permata',
        phone: '+62 819-0123-4567',
        email: 'hana.permata@email.com',
        imageUrl: 'H',
      ),
      Contact(
        name: 'Indra Kusuma',
        phone: '+62 821-1234-5678',
        email: 'indra.kusuma@email.com',
        imageUrl: 'I',
      ),
      Contact(
        name: 'Jasmine Putri',
        phone: '+62 822-2345-6789',
        email: 'jasmine.putri@email.com',
        imageUrl: 'J',
      ),
      Contact(
        name: 'Kemal Ardiansyah',
        phone: '+62 823-3456-7890',
        email: 'kemal.ardi@email.com',
        imageUrl: 'K',
      ),
      Contact(
        name: 'Linda Maharani',
        phone: '+62 824-4567-8901',
        email: 'linda.maharani@email.com',
        imageUrl: 'L',
      ),
      Contact(
        name: 'Muhammad Rizki',
        phone: '+62 825-5678-9012',
        email: 'muhammad.rizki@email.com',
        imageUrl: 'M',
      ),
      Contact(
        name: 'Nina Sari',
        phone: '+62 826-6789-0123',
        email: 'nina.sari@email.com',
        imageUrl: 'N',
      ),
      Contact(
        name: 'Omar Abdullah',
        phone: '+62 827-7890-1234',
        email: 'omar.abdullah@email.com',
        imageUrl: 'O',
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade50, Colors.white],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: Colors.purple.shade600,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Daftar Kontak',
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
                      colors: [Colors.purple.shade700, Colors.purple.shade500],
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
                    Icon(Icons.contact_phone, color: Colors.purple.shade600),
                    const SizedBox(width: 8),
                    Text(
                      '${contacts.length} Kontak Tersimpan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
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
                  final contact = contacts[index];
                  return _buildContactCard(context, contact, index);
                }, childCount: contacts.length),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.add_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Fitur tambah kontak akan segera hadir!'),
                ],
              ),
              backgroundColor: Colors.purple.shade600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        backgroundColor: Colors.purple.shade600,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, Contact contact, int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.cyan,
      Colors.amber,
    ];

    final color = colors[index % colors.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _showContactDetail(context, contact);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Circle Avatar
                Hero(
                  tag: 'contact_${contact.name}',
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [color.shade400, color.shade700],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        contact.imageUrl,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Contact Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            contact.phone,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              contact.email,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Action Buttons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.green.shade600,
                        size: 22,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Memanggil ${contact.name}...'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue.shade600,
                        size: 22,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Mengirim pesan ke ${contact.name}...',
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showContactDetail(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.purple.shade600,
                child: Text(
                  contact.imageUrl,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                contact.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildInfoRow(Icons.phone, 'Telepon', contact.phone),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.email, 'Email', contact.email),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.phone),
                      label: const Text('Panggil'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.message),
                      label: const Text('Pesan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.purple.shade600, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
