import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mata_kuliah.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  static const _jadwal = [
    MataKuliah(kode: 'IF-103',nama: 'Keamanan Informasi',sks: 3,hari: 'Selasa'),
    MataKuliah(kode: 'IF-P02',nama: 'Sistem Informasi Enterprise',sks: 3,hari: 'Rabu'),
    MataKuliah(kode: 'IF-102', nama: 'Keamanan Jaringan', sks: 3, hari: 'Rabu'),
    MataKuliah(kode: 'IF-025', nama: 'Pemrograman Web I', sks: 3, hari: 'Rabu'),
    MataKuliah(kode: 'IF-024',nama: 'Pemrograman Mobile II',sks: 3,hari: 'Kamis'),
    MataKuliah(kode: 'IF-U06', nama: 'Bahasa Indonesia', sks: 2, hari: 'Kamis'),
    MataKuliah(kode: 'IF-027',nama: 'Sistem Mikroprosessor',sks: 3,hari: 'Kamis'),
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
