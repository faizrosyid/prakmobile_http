import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api_data_source.dart';
import 'users_model.dart';
import 'detail_user.dart';

class PageListUsers extends StatelessWidget {
  const PageListUsers({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Users", style: GoogleFonts.acme()),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            UsersModel usersModel = UsersModel.fromJson(snapshot.data);
            return _buildSuccessSection(usersModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(UsersModel data) {
    return ListView.builder(
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        var user = data.data![index];
        return _buildItemUsers(context, data.data![index]);
      },
    );
  }

  Widget _buildItemUsers(BuildContext context, Data userData) {
    return InkWell(
      onTap: () async {
        final id = userData.id;
        final detailData = await ApiDataSource.instance.loadDetailUser(id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HalamanDetail(detailData: detailData);
        }));
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  userData.avatar!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userData.firstName! + " " + userData.lastName!, style: GoogleFonts.acme()),
                Text(userData.email!, style: GoogleFonts.acme()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
