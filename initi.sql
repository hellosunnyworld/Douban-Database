
create schema DouBan;

use DouBan;


#book_name

create table book_id(
	book_id int,
    primary key(book_id)
)character set = utf8;

create table book_name(
	book_id int,
    subtitle text,
    origin_name text,
    primary key(book_id),
    foreign key(book_id) references book_id(book_id)
)character set = utf8;


# book person
create table book_person(
	book_person_id int,
    book_person_name text default null,
    sex text default null,
    birthday date default null,
    country text default null,
    chinese_name text default null,
    english_name text default null,
    primary key(book_person_id)
)character set = utf8;


create table book_author(
	book_id int,
    book_author_id int,
    primary key(book_id,book_author_id)
    #foreign key(book_id) references book_id(book_id)
    #foreign key(book_author_id) references book_person(book_person_id)
)character set = utf8;


create table book_grade(
	book_id int,
    avergae float(2,1),
    reviews_count int,
    primary key(book_id),
    foreign key(book_id) references book_id(book_id)
)character set = utf8;


create table book_translator(
	book_id int,
    book_translator_id int,
    primary key(book_id,book_translator_id),
    foreign key(book_id) references book_id(book_id),
	foreign key(book_translator_id) references book_person(book_person_id)
)character set = utf8;

create table book_press(
	press_name text,
    press_id int,
    primary key(press_id)
)character set = utf8;

create table book_bookid_pressid(
	press_id int,
    book_id int,
    primary key(book_id,press_id),
    foreign key(book_id) references book_id(book_id),
    foreign key(press_id) references book_press(press_id)
)character set = utf8;

# movie

create table movie_id(
	movie_id int,
    primary key(movie_id)
)character set = utf8;

create table movie_name(
	movie_id int,
    movie_name text,
    primary key(movie_id),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;

# movie person
create table movie_person(
	movie_person_id int,
    movie_person_name text,
    gender text,
    constella text,
    birthday date,
    birthplace text,
    primary key(movie_person_id)
)character set = utf8;

create table movie_person_prof(
	movie_person_id int,
    profession varchar(20),
    primary key(movie_person_id, profession),
    foreign key(movie_person_id) references movie_person(movie_person_id)
)character set = utf8;

create table movie_writer(
	movie_id int,
    movie_writer_id int,
    primary key(movie_id, movie_writer_id),
	foreign key(movie_id) references movie_id(movie_id),
    foreign key(movie_writer_id) references movie_person(movie_person_id)
)character set = utf8;

create table movie_actor(
	movie_id int,
    movie_actor_id int,
    primary key(movie_id, movie_actor_id),
    foreign key(movie_id) references movie_id(movie_id),
    foreign key(movie_actor_id) references movie_person(movie_person_id)
)character set = utf8;

create table movie_director(
	movie_id int,
    movie_director_id int,
    primary key(movie_id, movie_director_id),
    foreign key(movie_id) references movie_id(movie_id),
    foreign key(movie_director_id) references movie_person(movie_person_id)
)character set = utf8;


create table movie_country(
	movie_id int,
    country varchar(50),
    primary key(movie_id, country),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;


create table movie_eposide(
	movie_id int,
    episode int,
    duration int,
    primary key(movie_id),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;

create table movie_grade(
	movie_id int, 
    average float(2,1),
    review_count int,
    primary key(movie_id),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;

create table movie_language(
	movie_id int,
    movie_language varchar(50),
    primary key(movie_id, movie_language),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;

create table movie_pubdate(
	movie_id int,
    pubdate date,
    place varchar(50),
    primary key(movie_id, pubdate),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;

create table movie_type(
	movie_id int,
    genre varchar(50),
    primary key(movie_id, genre),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;


# user
create table user_info(
	user_id int,
    age int,
    address text,
    primary key(user_id)
) character set = utf8;


create table user_book(
	user_id int,
    book_id int,
    primary key(book_id, user_id),
    foreign key(user_id) references user_info(user_id),
    foreign key(book_id) references book_id(book_id)
)character set = utf8;



create table user_movie(
	user_id int,
    movie_id int,
    primary key(user_id, movie_id),
    foreign key(user_id) references user_info(user_id),
    foreign key(movie_id) references movie_id(movie_id)
)character set = utf8;

