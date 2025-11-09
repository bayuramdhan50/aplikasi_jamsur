import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(
        name: 'Andi Pratama',
        phone: '+62 856-2341-8765',
        email: 'andi.pratama@gmail.com',
        imageUrl: 'A',
      ),
      Contact(
        name: 'Bella Kusuma',
        phone: '+62 857-3452-9876',
        email: 'bella.kusuma@yahoo.com',
        imageUrl: 'B',
      ),
      Contact(
        name: 'Chandra Wijaya',
        phone: '+62 858-4563-0987',
        email: 'chandra.wijaya@outlook.com',
        imageUrl: 'C',
      ),
      Contact(
        name: 'Diana Permatasari',
        phone: '+62 859-5674-1098',
        email: 'diana.permata@hotmail.com',
        imageUrl: 'D',
      ),
      Contact(
        name: 'Eko Saputra',
        phone: '+62 851-6785-2109',
        email: 'eko.saputra@gmail.com',
        imageUrl: 'E',
      ),
      Contact(
        name: 'Farah Nabila',
        phone: '+62 852-7896-3210',
        email: 'farah.nabila@yahoo.com',
        imageUrl: 'F',
      ),
      Contact(
        name: 'Gilang Ramadhan',
        phone: '+62 853-8907-4321',
        email: 'gilang.ramadhan@gmail.com',
        imageUrl: 'G',
      ),
      Contact(
        name: 'Hendra Gunawan',
        phone: '+62 854-9018-5432',
        email: 'hendra.gunawan@outlook.com',
        imageUrl: 'H',
      ),
      Contact(
        name: 'Intan Purnama',
        phone: '+62 855-0129-6543',
        email: 'intan.purnama@gmail.com',
        imageUrl: 'I',
      ),
      Contact(
        name: 'Joko Wibowo',
        phone: '+62 877-1230-7654',
        email: 'joko.wibowo@yahoo.com',
        imageUrl: 'J',
      ),
      Contact(
        name: 'Kartika Sari',
        phone: '+62 878-2341-8765',
        email: 'kartika.sari@hotmail.com',
        imageUrl: 'K',
      ),
      Contact(
        name: 'Lukman Hakim',
        phone: '+62 879-3452-9876',
        email: 'lukman.hakim@gmail.com',
        imageUrl: 'L',
      ),
      Contact(
        name: 'Maya Anggraini',
        phone: '+62 881-4563-0987',
        email: 'maya.anggraini@outlook.com',
        imageUrl: 'M',
      ),
      Contact(
        name: 'Noval Firmansyah',
        phone: '+62 882-5674-1098',
        email: 'noval.firmansyah@yahoo.com',
        imageUrl: 'N',
      ),
      Contact(
        name: 'Olivia Rahmawati',
        phone: '+62 883-6785-2109',
        email: 'olivia.rahmawati@gmail.com',
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
