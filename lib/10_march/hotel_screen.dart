import 'package:flutter/material.dart';
import 'package:flutter_learning/10_march/hotel_model.dart';

class HotelListScreen extends StatefulWidget {
  const HotelListScreen({super.key});

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime List'),
      ),
      body: FutureBuilder(
        future: getFutureValue(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error.toString()}'));
            }
            //Data exists scenario
            if (snapshot.data == null) {
              return Center(child: Text('No data available'));
            }
            List<HotelModel> hotelList = snapshot.data!;

            return ListView.builder(
                itemBuilder: (context, index) {
                  return buildHotelData(hotelList[index]);
                },
                itemCount: hotelList.length);
          }
          return Center(child: Text('Loading...'));
        },
      ),
    );
  }

  Widget buildHotelData(HotelModel hotel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Image.network(
                hotel.hotelImages?.first ?? '',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text((hotel.hotelRating ?? 4).toString()),
                          Icon(Icons.star)
                        ],
                      ),
                    ),
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Icon(Icons.favorite),
                      Icon(Icons.menu),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.hotelName ?? '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        hotel.address?.city ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    children: [Text('Rs. 1500/-'), Text('Incl. Taxes')],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<HotelModel>> getFutureValue() async {
    await Future.delayed(Duration(microseconds: 3));
    List<HotelModel> list = [];
    for (var element in dummyJson) {
      HotelModel hotelModel =
          HotelModel.fromJson(element as Map<String, dynamic>);
      list.add(hotelModel);
    }
    return list;
  }

  var dummyJson = [
    {
      "id": "hsid1615071587-15136983",
      "name": "Hotel Virad",
      "img": [
        {
          "url":
              "https://i.travelapi.com/lodging/25000000/24050000/24047700/24047605/0fdf9e2c_b.jpg"
        }
      ],
      "rt": 3,
      "gl": {"ln": "75.99273", "lt": "10.993039"},
      "ad": {
        "adr": "National Highway",
        "adr2": "Kottakkal",
        "postalCode": "676501",
        "city": {"name": "Tirur"},
        "state": {},
        "country": {"name": "India"},
        "ctn": "Tirur",
        "cn": "India"
      },
      "pt": "HOTEL",
      "pops": [
        {
          "fc": ["ROOM ONLY"],
          "tpc": 3281.84,
          "cb": 0.0
        }
      ],
      "uid": "15136983",
      "lhc": "19990",
      "istjv": false
    },
    {
      "id": "hsid1615071587-16797149",
      "name": "Luxora Hotel And Spa",
      "img": [
        {
          "url":
              "https://i.travelapi.com/lodging/46000000/45830000/45822000/45821944/53099010_b.jpg"
        }
      ],
      "rt": 3,
      "gl": {"ln": "75.9076", "lt": "11.070962"},
      "ad": {
        "adr": "NH Highway, Mamburam Post",
        "adr2": "Thalappara, Malappuram",
        "postalCode": "676306",
        "city": {"name": "Tirurangadi"},
        "state": {},
        "country": {"name": "India"},
        "ctn": "Tirurangadi",
        "cn": "India"
      },
      "pt": "HOTEL",
      "pops": [
        {
          "fc": ["ROOM ONLY"],
          "tpc": 4712.28,
          "cb": 0.0
        }
      ],
      "uid": "16797149",
      "lhc": "13376",
      "istjv": false
    }
  ];
}
