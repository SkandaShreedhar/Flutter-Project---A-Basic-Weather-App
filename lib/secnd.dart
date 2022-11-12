
Padding(
padding: const EdgeInsets.all(8.0),
child: Text(' ${snapshot.data['name'].toString()}',
style: TextStyle(
color: Colors.white,
fontSize: 50,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
),
),
),
const Icon(
Icons.sunny,
color: Colors.yellow,
size: 80,
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text('${snapshot.data['temp'].toString()} °C',
style: TextStyle(
color: Colors.white,
fontSize: 80,
fontWeight: FontWeight.w500,
fontStyle: FontStyle.normal,
),
),
),
Padding(
padding: const EdgeInsets.all(4.0),
child: Text(snapshot.data['description'].toString(),
style: TextStyle(
color: Colors.white,
fontStyle: FontStyle.italic,
fontWeight: FontWeight.w400,
fontSize: 40,
),
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text('${snapshot.data['low'].toString()} °C min',
style: TextStyle(
color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
),
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text('${snapshot.data['high'].toString()} °C max',
style: TextStyle(
color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
),
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text('Humidity : ${snapshot.data['humidity'].toString()} %',
style: TextStyle(
color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
),
),
),
Text('Pressure : ${snapshot.data['pressure'].toString()}',
style: TextStyle(
color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.italic,
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text('Country : ${snapshot.data['country'].toString()}',
style: TextStyle(
color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.italic,
),
),
),
Text("Rate our app!",
style: TextStyle(
fontStyle: FontStyle.italic,
fontWeight: FontWeight.w400,
fontSize: 50,
color: Colors.white,
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: RatingBar.builder(
initialRating: 3,
minRating: 1,
direction: Axis.horizontal,
allowHalfRating: true,
itemCount: 5,
itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
itemBuilder: (context, _) => Icon(
Icons.star,
color: Colors.amber,
),
onRatingUpdate: (rating) {
print(rating);
},
)
), ],