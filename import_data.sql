
#book


/*load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_id.csv" 
into table book_id 
fields terminated by ',' 
lines terminated by '\n'
(book_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_name.csv" 
into table book_name 
fields terminated by ',' 
lines terminated by '\n'
(book_id, subtitle, origin_name);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book_person\\book_person.csv" 
into table book_person 
fields terminated by ',' 
lines terminated by '\n'
(book_person_id, book_person_name, sex, birthday, country, chinese_name, english_name);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_author.csv" 
into table book_author 
fields terminated by ',' 
lines terminated by '\n'
(book_id, book_author_id);


load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_grade.csv" 
into table book_grade 
fields terminated by ',' 
lines terminated by '\n'
(book_id, avergae, reviews_count);




load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_translator.csv" 
into table book_translator 
fields terminated by ',' 
lines terminated by '\n'
(book_id, book_translator_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_press.csv" 
into table book_press 
fields terminated by ',' 
lines terminated by '\n'
(press_name, press_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\book\\book_bookid_press_id.csv" 
into table book_bookid_pressid 
fields terminated by ',' 
lines terminated by '\n'
(press_id, book_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_id.csv" 
into table movie_id 
fields terminated by ',' 
lines terminated by '\n'
(movie_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_name.csv" 
into table movie_name 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, movie_name);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie_person\\movie_person.csv" 
into table movie_person 
fields terminated by ',' 
lines terminated by '\n'
(movie_person_id, movie_person_name, gender, constella, birthday, birthplace);*/

/*load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie_person\\movie_person_prof.csv" 
into table movie_person_prof 
fields terminated by ',' 
lines terminated by '\n'
(movie_person_id, profession);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_writer.csv" 
into table movie_writer 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, movie_writer_id);


load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_actor.csv" 
into table movie_actor 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, movie_actor_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_director.csv" 
into table movie_director 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, movie_director_id);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_country.csv" 
into table movie_country 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, country);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_episode.csv" 
into table movie_eposide 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, episode, duration);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_grade.csv" 
into table movie_grade 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, average, review_count);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_language.csv" 
into table movie_language 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, movie_language);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_pubdate.csv" 
into table movie_pubdate 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, pubdate, place);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\movie\\movie_type.csv" 
into table movie_type 
fields terminated by ',' 
lines terminated by '\n'
(movie_id, genre);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\user\\user.csv" 
into table user_info 
fields terminated by ',' 
lines terminated by '\n'
(user_id, age, address);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\user\\user_book.csv" 
into table user_book 
fields terminated by ',' 
lines terminated by '\n'
(user_id, book_id);*/

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Result_1\\user\\user_movie.csv" 
into table user_movie 
fields terminated by ',' 
lines terminated by '\n'
(user_id, movie_id);

/*
select * from book_name;

truncate table book_name;

set global max_allowed_packet = 2*10*1024*1024;

show variables like '%max_allowed_packet%%';
*/