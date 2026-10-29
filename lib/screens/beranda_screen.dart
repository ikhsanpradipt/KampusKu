import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mata_kuliah.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  static const _jadwal = [
    MataKuliah(
      kode: 'IF-024',
      nama: 'Pemrograman Mobile II',
      sks: 3,
      hari: 'Senin',
    ),
    MataKuliah(kode: 'IF-021', nama: 'Basis Data', sks: 3, hari: 'Selasa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KampusKu')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              DateFormat('EEEE, d MMMM y', 'id_ID').format(DateTime.now()),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          for (final mk in _jadwal)
            ListTile(
              leading: const Icon(Icons.class_),
              title: Text(mk.nama),
              subtitle: Text('${mk.kode} · ${mk.hari} · ${mk.sks} SKS'),
            ),
        ],
      ),
    );
  }
}
