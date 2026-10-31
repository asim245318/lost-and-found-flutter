// Mobile Application Development (SE323) - Assignment #02
// Name: Asim | Reg#: 245318
// Campus Lost & Found

import 'package:flutter/material.dart';

void main() => runApp(const LostFoundApp());

class LostFoundApp extends StatelessWidget {
  const LostFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Lost & Found',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ItemListScreen(),
    );
  }
}

class Item {
  final String name;
  final String location;
  final String status; // 'Lost' or 'Found'
  final String description;
  final String date;
  final String contact;
  final IconData icon;

  const Item({
    required this.name,
    required this.location,
    required this.status,
    required this.description,
    required this.date,
    required this.contact,
    required this.icon,
  });
}

const List<Item> items = [
  Item(
    name: 'Black Backpack',
    location: 'Library, 2nd Floor',
    status: 'Lost',
    description: 'Black backpack with a laptop charger and two notebooks inside.',
    date: '27 Oct 2026',
    contact: 'Admin Office, Block A',
    icon: Icons.backpack,
  ),
  Item(
    name: 'Student ID Card',
    location: 'Cafeteria',
    status: 'Found',
    description: 'University ID card found near the counter. Name is partly faded.',
    date: '28 Oct 2026',
    contact: 'Cafeteria Manager',
    icon: Icons.badge,
  ),
  Item(
    name: 'Casio Calculator',
    location: 'CS Lab 3',
    status: 'Found',
    description: 'Scientific calculator left on a desk after the lab session.',
    date: '26 Oct 2026',
    contact: 'Lab Assistant, CS Dept',
    icon: Icons.calculate,
  ),
  Item(
    name: 'Car Keys (Honda)',
    location: 'Parking Lot B',
    status: 'Lost',
    description: 'Honda key with a red keychain and a small flashlight.',
    date: '29 Oct 2026',
    contact: 'Security Office',
    icon: Icons.vpn_key,
  ),
  Item(
    name: 'Blue Water Bottle',
    location: 'Sports Ground',
    status: 'Found',
    description: 'Blue steel water bottle with a sticker on the side.',
    date: '25 Oct 2026',
    contact: 'Sports Office',
    icon: Icons.local_drink,
  ),
  Item(
    name: 'Wireless Earbuds',
    location: 'Lecture Hall 5',
    status: 'Lost',
    description: 'White earbuds in a charging case with a scratched lid.',
    date: '30 Oct 2026',
    contact: 'Admin Office, Block A',
    icon: Icons.headphones,
  ),
  Item(
    name: 'Prescription Glasses',
    location: 'Mosque Corridor',
    status: 'Found',
    description: 'Black-framed glasses in a brown case.',
    date: '24 Oct 2026',
    contact: 'Security Office',
    icon: Icons.visibility,
  ),
  Item(
    name: 'Programming Textbook',
    location: 'Block C, Room 12',
    status: 'Lost',
    description: 'C++ textbook with handwritten notes on the first page.',
    date: '28 Oct 2026',
    contact: 'CS Department Office',
    icon: Icons.menu_book,
  ),
  Item(
    name: 'USB Flash Drive',
    location: 'Computer Lab 1',
    status: 'Found',
    description: '32GB silver USB drive found plugged into a lab PC.',
    date: '29 Oct 2026',
    contact: 'Lab Assistant, CS Dept',
    icon: Icons.usb,
  ),
  Item(
    name: 'Grey Hoodie',
    location: 'Bus Stop',
    status: 'Lost',
    description: 'Grey zip hoodie, size M, with a university logo.',
    date: '27 Oct 2026',
    contact: 'Transport Office',
    icon: Icons.checkroom,
  ),
];

Color statusColor(String status) =>
    status == 'Lost' ? Colors.red : Colors.green;

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: statusColor(item.status).withOpacity(0.15),
                    child: Icon(item.icon, color: statusColor(item.status)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(child: Text(item.location)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.status,
                          style: TextStyle(
                            color: statusColor(item.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailScreen(item: item),
                        ),
                      );
                    },
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  const ItemDetailScreen({super.key, required this.item});

  Widget _row(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(value, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: statusColor(item.status).withOpacity(0.15),
                child: Icon(item.icon,
                    size: 50, color: statusColor(item.status)),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Chip(
                label: Text(
                  item.status.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: statusColor(item.status),
              ),
            ),
            const SizedBox(height: 16),
            _row(Icons.label, 'Item Name', item.name),
            _row(Icons.location_on, 'Location', item.location),
            _row(Icons.calendar_today, 'Date', item.date),
            _row(Icons.description, 'Description', item.description),
            _row(Icons.contact_phone, 'Contact', item.contact),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
