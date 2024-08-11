import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_project/modules/widgets/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/model.dart';
import '../../services/service.dart';

class ListingComponent extends StatelessWidget {
  const ListingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const ListingCardComponent(
            type: DataType.country,
          ),
          const ListingCardComponent(
            type: DataType.state,
          ),
          const ListingCardComponent(
            type: DataType.city,
          ),
          SizedBox(height: 40.h,)
        ],
      ),
    );
  }
}

class ListingCardComponent extends StatelessWidget {
  const ListingCardComponent({super.key, required this.type});

  final DataType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            switch (type) {
              DataType.country => "Country",
              DataType.state => "State",
              DataType.city => "City",
            },
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          SizedBox(height: 8.h,),
          StreamBuilder(
            stream: FireStoreDataViewService().getTypeFunction(type),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List countries = snapshot.data?.docs ?? [];
              if (countries.isEmpty) {
                return ItemCard(
                    name: switch (type) {
                  DataType.country => "Country not found",
                  DataType.state => "State not found",
                  DataType.city => "City not found",
                });
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  FireStoreDataModel country = countries[index]?.data();
                  return ItemCard(name: country.name);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
