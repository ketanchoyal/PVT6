import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/friendsAndContacts/addContactPage.dart';
import 'package:frontend/loginFiles/MySignInPage.dart';

import '../../customAppBar.dart';
import '../addDogTest.dart';

class SearchBreeds extends StatefulWidget {
  SearchBreeds({Key key, this.title}) : super(key: key);
  final String title;

  @override
  SearchBreedState createState() => new SearchBreedState();
}

class SearchBreedState extends State<SearchBreeds> {
  TextEditingController editingController = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  String filter;

  final duplicateItems = [
    Breed('Mixed Breed'),
    Breed('Afador'),
    Breed('Affenhuahua'),
    Breed('Affenpinscher'),
    Breed('Afghan Hound'),
    Breed('Airedale Terrier'),
    Breed('Akbash'),
    Breed('Akita'),
    Breed('Akita Chow'),
    Breed('Akita Pit'),
    Breed('Akita Shepherd'),
    Breed('Alaskan Klee Kai'),
    Breed('Alaskan Malamute'),
    Breed('American Bulldog'),
    Breed('American English Coonhound'),
    Breed('American Eskimo Dog'),
    Breed('American Foxhound'),
    Breed('American Hairless Terrier'),
    Breed('American Leopard Hound'),
    Breed('American Pit Bull Terrier'),
    Breed('American Pugabull'),
    Breed('American Staffordshire Terrier'),
    Breed('American Water Spaniel'),
    Breed('Anatolian Shepherd Dog'),
    Breed('Appenzeller Sennenhunde'),
    Breed('Auggie'),
    Breed('Aussiedoodle'),
    Breed('Aussiepom'),
    Breed('Australian Cattle Dog'),
    Breed('Australian Kelpie'),
    Breed('Australian Retriever'),
    Breed('Australian Shepherd'),
    Breed('Australian Shepherd Husky'),
    Breed('Australian Shepherd Lab Mix'),
    Breed('Australian Shepherd Pit Bull Mix'),
    Breed('Australian Terrier'),
    Breed('Azawakh'),
    Breed('Barbet'),
    Breed('Basenji'),
    Breed('Bassador'),
    Breed('Basset Fauve de Bretagne'),
    Breed('Basset Hound'),
    Breed('Basset Retriever'),
    Breed('Bavarian Mountain Scent Hound'),
    Breed('Beabull'),
    Breed('Beagle'),
    Breed('Beaglier'),
    Breed('Bearded Collie'),
    Breed('Bedlington Terrier'),
    Breed('Belgian Malinois'),
    Breed('Belgian Sheepdog'),
    Breed('Belgian Tervuren'),
    Breed('Berger Picard'),
    Breed('Bernedoodle'),
    Breed('Bernese Mountain Dog'),
    Breed('Bichon Frise'),
    Breed('Biewer Terrier'),
    Breed('Black and Tan Coonhound'),
    Breed('Black Mouth Cur'),
    Breed('Black Russian Terrier'),
    Breed('Bloodhound'),
    Breed('Blue Lacy'),
    Breed('Bluetick Coonhound'),
    Breed('Bocker'),
    Breed('Boerboel'),
    Breed('Boglen Terrier'),
    Breed('Bohemian Shepherd'),
    Breed('Bolognese'),
    Breed('Borador'),
    Breed('Border Collie'),
    Breed('Border Sheepdog'),
    Breed('Border Terrier'),
    Breed('Bordoodle'),
    Breed('Borzoi'),
    Breed('BoShih'),
    Breed('Bossie'),
    Breed('Boston Boxer'),
    Breed('Boston Terrier'),
    Breed('Bouvier des Flandres'),
    Breed('Boxador'),
    Breed('Boxer'),
    Breed('Boxerdoodle'),
    Breed('Boxmatian'),
    Breed('Boxweiler'),
    Breed('Boykin Spaniel'),
    Breed('Bracco Italiano'),
    Breed('Braque du Bourbonnais'),
    Breed('Briard'),
    Breed('Brittany'),
    Breed('Broholmer'),
    Breed('Brussels Griffon'),
    Breed('Bugg'),
    Breed('Bull-Pei'),
    Breed('Bull Terrier'),
    Breed('Bullador'),
    Breed('Bullboxer Pit'),
    Breed('Bulldog'),
    Breed('Bullmastiff'),
    Breed('Bullmatian'),
    Breed('Cairn Terrier'),
    Breed('Canaan Dog'),
    Breed('Cane Corso'),
    Breed('Cardigan Welsh Corgi'),
    Breed('Carolina Dog'),
    Breed('Catahoula Bulldog'),
    Breed('Catahoula Leopard Dog'),
    Breed('Caucasian Shepherd Dog'),
    Breed('Cav-a-Jack'),
    Breed('Cavachon'),
    Breed('Cavador'),
    Breed('Cavalier King Charles Spaniel'),
    Breed('Cavapoo'),
    Breed('Cesky Terrier'),
    Breed('Chabrador'),
    Breed('Cheagle'),
    Breed('Chesapeake Bay Retriever'),
    Breed('Chi Chi'),
    Breed('Chi-Poo'),
    Breed('Chigi'),
    Breed('Chihuahua'),
    Breed('Chilier'),
    Breed('Chinese Crested'),
    Breed('Chinese Shar-Pei'),
    Breed('Chinook'),
    Breed('Chion'),
    Breed('Chipin'),
    Breed('Chiweenie'),
    Breed('Chorkie'),
    Breed('Chow Chow'),
    Breed('Chow Shepherd'),
    Breed('Chug'),
    Breed('Chusky'),
    Breed('Cirneco dell’Etna'),
    Breed('Clumber Spaniel'),
    Breed('Cockalier'),
    Breed('Cockapoo'),
    Breed('Cocker Spaniel'),
    Breed('Collie'),
    Breed('Corgi Inu'),
    Breed('Corgidor'),
    Breed('Corman Shepherd'),
    Breed('Coton de Tulear'),
    Breed('Curly-Coated Retriever'),
    Breed('Dachsador'),
    Breed('Dachshund'),
    Breed('Dalmatian'),
    Breed('Dandie Dinmont Terrier'),
    Breed('Daniff'),
    Breed('Deutscher Wachtelhund'),
    Breed('Doberdor'),
    Breed('Doberman Pinscher'),
    Breed('Docker'),
    Breed('Dogo Argentino'),
    Breed('Dogue de Bordeaux'),
    Breed('Dorgi'),
    Breed('Dorkie'),
    Breed('Doxiepoo'),
    Breed('Doxle'),
    Breed('Drentsche Patrijshond'),
    Breed('Drever'),
    Breed('Dutch Shepherd'),
    Breed('English Cocker Spaniel'),
    Breed('English Foxhound'),
    Breed('English Setter'),
    Breed('English Springer Spaniel'),
    Breed('English Toy Spaniel'),
    Breed('Entlebucher Mountain Dog'),
    Breed('Estrela Mountain Dog'),
    Breed('Eurasier'),
    Breed('Field Spaniel'),
    Breed('Finnish Lapphund'),
    Breed('Finnish Spitz'),
    Breed('Flat-Coated Retriever'),
    Breed('Fox Terrier'),
    Breed('French Bulldog'),
    Breed('French Bullhuahua'),
    Breed('French Spaniel'),
    Breed('Frenchton'),
    Breed('Frengle'),
    Breed('German Pinscher'),
    Breed('German Shepherd Dog'),
    Breed('German Shepherd Pit Bull'),
    Breed('German Shepherd Rottweiler Mix'),
    Breed('German Sheprador'),
    Breed('German Shorthaired Pointer'),
    Breed('German Spitz'),
    Breed('German Wirehaired Pointer'),
    Breed('Giant Schnauzer'),
    Breed('Glen of Imaal Terrier'),
    Breed('Goberian'),
    Breed('Goldador'),
    Breed('Golden Cocker Retriever'),
    Breed('Golden Mountain Dog'),
    Breed('Golden Retriever'),
    Breed('Golden Retriever Corgi'),
    Breed('Golden Shepherd'),
    Breed('Goldendoodle'),
    Breed('Gollie'),
    Breed('Gordon Setter'),
    Breed('Great Dane'),
    Breed('Great Pyrenees'),
    Breed('Greater Swiss Mountain Dog'),
    Breed('Greyador'),
    Breed('Greyhound'),
    Breed('Hamiltonstovare'),
    Breed('Hanoverian Scenthound'),
    Breed('Harrier'),
    Breed('Havanese'),
    Breed('Hokkaido'),
    Breed('Horgi'),
    Breed('Huskita'),
    Breed('Huskydoodle'),
    Breed('Ibizan Hound'),
    Breed('Icelandic Sheepdog'),
    Breed('Irish Red and White Setter'),
    Breed('Irish Setter'),
    Breed('Irish Terrier'),
    Breed('Irish Water Spaniel'),
    Breed('Irish Wolfhound'),
    Breed('Italian Greyhound'),
    Breed('Jack-A-Poo'),
    Breed('Jack Chi'),
    Breed('Jack Russell Terrier'),
    Breed('Jackshund'),
    Breed('Japanese Chin'),
    Breed('Japanese Spitz'),
    Breed('Korean Jindo Dog'),
    Breed('Karelian Bear Dog'),
    Breed('Keeshond'),
    Breed('Kerry Blue Terrier'),
    Breed('King Shepherd'),
    Breed('Komondor'),
    Breed('Kooikerhondje'),
    Breed('Kuvasz'),
    Breed('Kyi-Leo'),
    Breed('Lab Pointer'),
    Breed('Labernese'),
    Breed('Labmaraner'),
    Breed('Labrabull'),
    Breed('Labradane'),
    Breed('Labradoodle'),
    Breed('Labrador Retriever'),
    Breed('Labrastaff'),
    Breed('Labsky'),
    Breed('Lagotto Romagnolo'),
    Breed('Lakeland Terrier'),
    Breed('Lancashire Heeler'),
    Breed('Leonberger'),
    Breed('Lhasa Apso'),
    Breed('Lhasapoo'),
    Breed('Lowchen'),
    Breed('Maltese'),
    Breed('Maltese Shih Tzu'),
    Breed('Maltipoo'),
    Breed('Manchester Terrier'),
    Breed('Mastador'),
    Breed('Mastiff'),
    Breed('Miniature Pinscher'),
    Breed('Miniature Schnauzer'),
    Breed('Morkie'),
    Breed('Mudi'),
    Breed('Mutt'),
    Breed('Neapolitan Mastiff'),
    Breed('Newfoundland'),
    Breed('Norfolk Terrier'),
    Breed('Norwegian Buhund'),
    Breed('Norwegian Elkhound'),
    Breed('Norwegian Lundehund'),
    Breed('Norwich Terrier'),
    Breed('Nova Scotia Duck Tolling Retriever'),
    Breed('Old English Sheepdog'),
    Breed('Otterhound'),
    Breed('Papillon'),
    Breed('Papipoo'),
    Breed('Peekapoo'),
    Breed('Pekingese'),
    Breed('Pembroke Welsh Corgi'),
    Breed('Petit Basset Griffon Vendeen'),
    Breed('Pharaoh Hound'),
    Breed('Pitsky'),
    Breed('Plott'),
    Breed('Pocket Beagle'),
    Breed('Pointer'),
    Breed('Polish Lowland Sheepdog'),
    Breed('Pomapoo'),
    Breed('Pomchi'),
    Breed('Pomeagle'),
    Breed('Pomeranian'),
    Breed('Pomsky'),
    Breed('Poochon'),
    Breed('Poodle'),
    Breed('Portuguese Podengo Pequeno'),
    Breed('Portuguese Water Dog'),
    Breed('Pug'),
    Breed('Pugalier'),
    Breed('Puggle'),
    Breed('Puginese'),
    Breed('Puli'),
    Breed('Pyredoodle'),
    Breed('Pyrenean Shepherd'),
    Breed('Rat Terrier'),
    Breed('Redbone Coonhound'),
    Breed('Rhodesian Ridgeback'),
    Breed('Rottador'),
    Breed('Rottle'),
    Breed('Rottweiler'),
    Breed('Saint Berdoodle'),
    Breed('Saint Bernard'),
    Breed('Saluki'),
    Breed('Samoyed'),
    Breed('Samusky'),
    Breed('Schipperke'),
    Breed('Schnoodle'),
    Breed('Scottish Deerhound'),
    Breed('Scottish Terrier'),
    Breed('Sealyham Terrier'),
    Breed('Sheepadoodle'),
    Breed('Shepsky'),
    Breed('Shetland Sheepdog'),
    Breed('Shiba Inu'),
    Breed('Shichon'),
    Breed('Shih-Poo'),
    Breed('Shih Tzu'),
    Breed('Shiloh Shepherd'),
    Breed('Shiranian'),
    Breed('Shollie'),
    Breed('Shorkie'),
    Breed('Siberian Husky'),
    Breed('Silken Windhound'),
    Breed('Silky Terrier'),
    Breed('Skye Terrier'),
    Breed('Sloughi'),
    Breed('Small Munsterlander Pointer'),
    Breed('Soft Coated Wheaten Terrier'),
    Breed('Spanish Mastiff'),
    Breed('Spinone Italiano'),
    Breed('Springador'),
    Breed('Stabyhoun'),
    Breed('Staffordshire Bull Terrier'),
    Breed('Standard Schnauzer'),
    Breed('Sussex Spaniel'),
    Breed('Swedish Vallhund'),
    Breed('Terripoo'),
    Breed('Texas Heeler'),
    Breed('Tibetan Mastiff'),
    Breed('Tibetan Spaniel'),
    Breed('Tibetan Terrier'),
    Breed('Toy Fox Terrier'),
    Breed('Treeing Tennessee Brindle'),
    Breed('Treeing Walker Coonhound'),
    Breed('Valley Bulldog'),
    Breed('Vizsla'),
    Breed('Weimaraner'),
    Breed('Welsh Springer Spaniel'),
    Breed('Welsh Terrier'),
    Breed('West Highland White Terrier'),
    Breed('Westiepoo'),
    Breed('Whippet'),
    Breed('Whoodle'),
    Breed('Wirehaired Pointing Griffon'),
    Breed('Xoloitzcuintli'),
    Breed('Yorkipoo'),
    Breed('Yorkshire Terrier'),
  ];
  var items = List<String>();
  String selectedBreed = '';

  @override
  void initState() {
    duplicateItems.forEach((item) {
      items.add(item.breed);
    });
    editingController.addListener(() {
      setState(() {
        filter = editingController.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return new GestureDetector(
        onTap: () {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: colorBeige,
            body: Column(children: <Widget>[
              GradientAppBar(
                "Breed",
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Select a breed from the list below",
                    style: style.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    width: 400,
                    height: 65,
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: editingController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Search Breed",
                          hintText: "ex: Whippet",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                  Container(
                      color: Colors.grey,
                      width: 420,
                      height: 200,
                      child: Card(
                        child: new ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            String c = items?.elementAt(index);
                            return filter == null || filter == ""
                                ? new Card(
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: ListTile(
                                      onTap: () {
                                        setState(() {
                                          selectedBreed = c;
                                          finalBreed = c;
                                        });
                                      },
                                      leading: CircleAvatar(
                                        child: Icon(
                                          FontAwesomeIcons.dog,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: colorDarkRed,
                                      ),
                                      title: Text(items[index] ?? ""),
                                    ),
                                  )
                                : items[index]
                                        .toLowerCase()
                                        .contains(filter.toLowerCase())
                                    ? new Card(
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: ListTile(
                                          onTap: () {
                                            setState(() {
                                              selectedBreed = c;
                                              finalBreed = c;
                                            });
                                            if (!currentFocus.hasPrimaryFocus) {
                                              currentFocus.unfocus();
                                            }
                                          },
                                          leading: CircleAvatar(
                                              child: Icon(
                                            FontAwesomeIcons.dog,
                                            color: Colors.white,
                                          )),
                                          title: Text(items[index] ?? ""),
                                        ),
                                      )
                                    : new Container();
                          },
                        ),
                      )),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 90,
                        child: Image.asset("logoprototype.png"),
                      ),
                      Text(
                        "Selected breed: ",
                        style: style.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  if (selectedBreed != "")
                    Card(
                      color: colorPrimaryRed,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            FontAwesomeIcons.dog,
                            color: Colors.white,
                          ),
                          backgroundColor: colorDarkRed,
                        ),
                        title: Text(selectedBreed),
                      ),
                    )
                ],
              ),
            ])));
  }
}
