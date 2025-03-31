# Design Document

By Vinicius Tomsic

Video overview: <(https://youtu.be/2IRZN0FCVuU)E>

## Scope

My database purpose is to create a base where people could evaluate albuns, see best albuns ratings or select albuns from one or another artists.
So I'm including in my db: name, genre, year and other information about albuns, besides that I'm including information about the artists.

## Functional Requirements

The user should be able to see users ratings, his own rating and to search albuns from a certain country, artist or genre. He will be able to filter and se only the best ratings albums too.
The sql has its own limitations like its not possible to search for name of the members of a specific band for example. Or to see the genre of a unique album (you can see the genre of the band itself).

## Representation

### Entities

The entities are user, album, artist and rating, each etities have its own atribute. The types were select based on the information will be put in each row, like the rating is a decimal integer rounded, the user's nickname need to be a text not null, in general every important information has a not null constrain.

* User: id wich unique identifies the user, first_name and last_name wich must be no NULL since we want to have enough information about each USER, and nickname
* Artist: name of the artist, year (optional) the year of born or in case of a band is the year of creation of the band, country, genre in wich we can see the main genre of the artist (this is a limitation, since one artist can have musics of diferents types).
* Album: name, artist id, year
* Ratings: rating, user_id, album_id, date. Each line will be a

### Relationships

![ER Diagram](diagram.png)

* An artist has none, one or many albums
* An album necesseraly has at least one artist and none or various ratings from users
* The user can have one or many ratings

## Optimizations

The optimizations implemented in this database are designed to enhance its overall performance and usability. A key focus was placed on optimizing the artist name, as this is one of the most common and straightforward aspects users search for when looking for their favorite bands or musicians. This ensures faster and more efficient retrieval of data related to artists.

Additionally, an optimization was applied to the album name, which is particularly useful when users are seeking specific details about an album, such as its release date, tracklist, or associated artists. By prioritizing this aspect, the database can handle album-related queries with improved accuracy and speed.

Lastly, I implemented an optimization for the user name, which enhances the performance of queries and processes related to individual users. This adjustment ensures that the system can quickly identify and retrieve data associated with specific users, thereby providing a smoother experience, especially for user-centric operations such as personalized recommendations, playlists, or account management.

## Limitations

This design is too much simple and has its limitations like, you'll not be able to see the name of the artists of an specific band, or the genre of an album, and lacks off user's information too.
Another point is that we are not storing any informations about the songs themselves, so if an artist doesnt have an album or if he has only an EP or colabs we will not be able to see that, its a problem than could be solved adding couple of tables to describe the musics and its relations with the album or the artists. 
