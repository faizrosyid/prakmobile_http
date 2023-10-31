import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'users_model.dart';
import 'detail_user.dart';

class PageListUsers extends StatelessWidget {
  const PageListUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Users"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            UsersModel usersModel=UsersModel.fromJson(snapshot.data);
            return _buildSuccessSection(usersModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(UsersModel data){
    return ListView.builder(
      itemCount: data.data!.length,
      itemBuilder:(BuildContext context, int index){

        return _buildItemUsers(data.data![index]);
      });
  }

  Widget _buildItemUsers(Data userData){
    return InkWell(
      onTap: (){
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(userData.avatar!),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userData.firstName! + "" +userData.lastName!),
                Text(userData.email!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
