import 'package:flutter/material.dart';
import 'package:kmdha/constant/img_constants.dart';

class AccountOptions {
  final String title;
  final IconData icon;
  final Function onTap;
  AccountOptions(
      {required this.title, required this.icon, required this.onTap});
}

class AccountScreen extends StatelessWidget {
  final List<AccountOptions> accList = [
    AccountOptions(
        title: "Manage Address", icon: Icons.location_on, onTap: () {}),
    AccountOptions(
        title: "Register as KDP", icon: Icons.person_add, onTap: () {}),
    AccountOptions(title: "Help & Support", icon: Icons.help, onTap: () {}),
    AccountOptions(title: "Like US", icon: Icons.thumb_up, onTap: () {}),
    AccountOptions(title: "Share App", icon: Icons.share, onTap: () {}),
  ];

  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Image img = Image.network(shopImageNetwork1);
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "ACCOUNT",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        userCard(img),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: accList
                        .map((option) => AccountOption(option: option))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        const OtherLinks(),
      ],
    );
  }

  Padding userCard(Image img) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 35,
                    foregroundImage: img.image,
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Rashi Garg",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.verified,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "rashigarg@97gmail.com",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Color.fromARGB(255, 0, 127, 231)),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "My Ratings",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 127, 231)),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AccountOption extends StatelessWidget {
  final AccountOptions option;

  const AccountOption({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(option.icon),
      title: Text(option.title),
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 20),
      onTap: () => option.onTap(),
    );
  }
}

class OtherLinks extends StatelessWidget {
  const OtherLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String label in [
              "Contact Us",
              "About Us",
              "Privacy Policy",
              "Terms & Conditions",
              "Return Policy",
              "Logout",
              "V 2.5.01",
            ])
              newLink(label),
          ],
        ),
      ),
    );
  }

  Padding newLink(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
