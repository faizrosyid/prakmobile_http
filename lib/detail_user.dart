import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'users_model.dart';

class HalamanDetail extends StatelessWidget {
  final Map<String, dynamic> detailData;
  const HalamanDetail ({super.key, required this.detailData});


  @override
  Widget build(BuildContext context) {
    print(detailData);
    final userData = detailData['data'];
    final user = Data.fromJson(userData);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User", style: GoogleFonts.acme()),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
              ),
              if (user.firstName != null && user.lastName != null)
                Text(
                  "${user.firstName!} ${user.lastName!}", style: GoogleFonts.acme(fontSize: 25),
                )
              else
                Text("Nama Tidak Ditemukan", style: GoogleFonts.acme()),
              SizedBox(height: 10),
              if (user.avatar != null)
                Image(image: NetworkImage(user.avatar!))
              else
                Text("Gambar Tidak Ditemukan", style: GoogleFonts.acme()),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user.firstName != null && user.lastName != null)
                    Text(
                      "First Name\t: ${user.firstName!}", style: GoogleFonts.acme(),
                    )
                  else
                  Text("Nama Tidak Ditemukan", style: GoogleFonts.acme()),
                  Text(
                      "Last Name\t\t: ${user.lastName!}", style: GoogleFonts.acme()
                  ),
                  if (user.email != null)
                    Text(
                      "Email\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${user.email!}", style: GoogleFonts.acme()
                    )
                  else
                    Text("Email Tidak Ditemukan", style: GoogleFonts.acme()),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
