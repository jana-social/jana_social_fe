<h1> Jana Social </h1>

[Render](https://jana-social-fe.onrender.com) <br>
[Back End Repo](https://github.com/jana-social/jana_social) <br>
[DB schema](https://erd.dbdesigner.net/designer/schema/1690390259-jana_social) <br>
[Full team Miro board](https://miro.com/app/board/uXjVMz_g040=/) <br>
[Users team Miro board](https://miro.com/app/board/uXjVMz5BkDM=/) <br>
[Events team Miro board](https://miro.com/app/board/uXjVMz4nZmc=/)


<h2> Teams </h2>

<h3> Users Team </h3>

 - Lauren Golden: [GitHub](https://github.com/goldenll) | [LinkedIn](https://www.linkedin.com/in/goldenll/)
 - Alex Kiselich: [GitHub](https://github.com/AlexKiselich) | [LinkedIn](https://www.linkedin.com/in/alexanderkiselich/)
 - Garrett Gregor: [GitHub](https://github.com/garrettgregor) | [LinkedIn](https://www.linkedin.com/in/garrett-gregor/)
 - Andy Weissman: [GitHub](https://github.com/andyweissman6) | [LinkedIn](https://www.linkedin.com/in/andy-weissman/)

<h3> Events Team </h3>

 - Jeff Nelson: [GitHub](https://github.com/jpnelson85) | [LinkedIn](https://www.linkedin.com/in/jeff-nelson-307aba45/)
 - Sarah Garlock: [GitHub](https://github.com/sarahgarlock) | [LinkedIn](https://www.linkedin.com/in/sarah-garlock-795855195/)
 - Jesse Thomas: [GitHub](https://github.com/jgthomas-12) | [LinkedIn](https://www.linkedin.com/in/jesse-g-thomas/)
 - Austin Woods: [GitHub](https://github.com/boomclear) | [LinkedIn](https://www.linkedin.com/in/austin-woods-1830aa195/)

<h3> Location/Friends Team </h3>

 - Myles Nottingham: [GitHub](https://github.com/MylesNottingham) | [LinkedIn](https://www.linkedin.com/in/mylesnottingham/)
 - Blaine Glasgow: [GitHub](https://github.com/GlowMunch) | [LinkedIn](https://www.linkedin.com/in/blaine-glasgow-134a9017a/)
 - Amy Spears: [GitHub](https://github.com/Amspears007) | [LinkedIn](https://www.linkedin.com/in/amy-marie-spears-900997105/)
 - Steven Stackhouse: [GitHub](https://github.com/stackmm) | [LinkedIn](https://www.linkedin.com/in/steven-stackhouse/)

 <h3> How to install the project?</h3>

- Fork and clone this repo
- Run `bundle install`
- Run `rails db:{create,migrate,seed}`
- User will need to sign up for a mapquest api key [here](https://developer.mapquest.com/)
- User will need to sign up for a unsplash api key and create account [here](https://unsplash.com/documentation#creating-a-developer-account)
- `bundle exec rspec` to run the test suite


<h3> JSON Contract</h3>


This endpoint will return all users within the specific distance input radius

    Status: 200 OK
    Description: Successful response with list of users where zipcode/address resides within radius of the distance typed in by the user typed in Returns users based on search distance.
    Data Format: An array of user hash objects with keys "id", "type" and "attributes".

  Status: 200 OK
```json
{
  "data": [
    {
      "id": "1",
      "type": "user",
      "attributes": {
        "username": "amyisfun",
        "email": "am123@gmail.com",
        "zipcode": "63637",
        "bio": "Caretaker for 43 yo sister with learning disabilities",
        "likes": "being outside",
        "dislikes": "loud crowds",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
      }
    },
     {
      "id": "2",
      "type": "user",
      "attributes": {
        "username": "LGisgreat",
        "email": "LG123@gmail.com",
        "zipcode": "63637",
        "bio": "Caretaker for sister in mid thirties with learning disabilities",
        "likes": "quiet activities",
        "dislikes": "lots of people",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
      }
    }
  ]
}
```
// a get request with :zipcode and :radius
// I should get back an array of user objects
// with this information attatched
```json
{"data":
  [
    {"id":"1",
    "type":"user",
    "attributes":
      {
        "username":"schroederJerde",
        "bio":"Lorem ipsum dolor sit amet",
        "likes":"consectetur adipiscing elit",
        "dislikes":"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        "profile_image_link":"https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
      }
    }
  ]
}
```
