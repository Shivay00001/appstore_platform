import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Orders')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Retail CRM Development', style: Theme.of(context).textTheme.titleLarge),
                      const Chip(label: Text('₹25k budget'), backgroundColor: Colors.indigo),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Looking for a Flutter developer to build a custom CRM for a local retail shop. Needs inventory management and billing.',
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                        child: const Text('Place Bid'),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
                        child: const Text('Chat'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Post Requirement'),
        icon: const Icon(Icons.post_add),
      ),
    );
  }
}
