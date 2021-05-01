# movie info
# 1. movie popularity ranked by credits

drop table if exists popular_movie_by_credit ;
create table popular_movie_by_credit as
select movie_name, average from movie_grade inner join movie_name 
order by average desc;

/*
# 2. movie popularity ranked by the number of review counts
drop table if exists popular_movie_by_review_count;
create table popular_movie_by_review_count as 
select movie_name, review_count from movie_grade inner join movie_name
order by review_count desc;

# 3. movieType popularity from director's view
drop table if exists popular_movieType_by_director;
create table popular_movieType_by_director as
select genre, count(genre) from movie_director inner join movie_type
order by count(genre) desc;

# 4. movieType popularity from audience's view by credit
drop table if exists popular_movieType_by_audience_credit;
create table popular_movieType_by_audience_credit as
select genre, avg(average) from movie_type inner join movie_grade
group by genre
order by avg(average) desc;
# 4. (2)movieType popularity from audience's view by review_count
drop table if exists popular_movieType_by_audience_reviewCount;
create table popular_movieType_by_audience_reviewCount as
select genre, avg(review_count) from movie_type inner join movie_grade
group by genre 
order by avg(review_count) desc;


# 5. the trend of movie every ten years
# (1). language popularity from 1960-1980,1981-2000,2001-2020
drop table if exists language_pop_60_80;
create table language_pop_60_80 as
select movie_language, count(movie_language)
from movie_pubdate inner join movie_language
where pubdate between '1960-00-00' and '1980-12-31'
group by movie_language
order by count(movie_language) desc;

drop table if exists language_pop_81_00;
create table language_pop_81_00 as
select movie_language, count(movie_language)
from movie_pubdate inner join movie_language
where pubdate between '1981-00-00' and '2000-12-31'
group by movie_language
order by count(movie_language) desc;

drop table if exists language_pop_01_20;
create table language_pop_01_20 as
select movie_language, count(movie_language)
from movie_pubdate inner join movie_language
where pubdate between '2001-00-00' and '2020-12-31'
group by movie_language
order by count(movie_language) desc;

# (2). country popularity 
drop table if exists country_pop_60_80;
create table country_pop_60_80 as
select country, count(country)
from movie_pubdate inner join movie_country
where pubdate between '1960-00-00' and '1980-12-31'
group by country
order by count(country) desc;

drop table if exists country_pop_81_00;
create table country_pop_81_00 as
select country, count(country)
from movie_pubdate inner join movie_country
where pubdate between '1981-00-00' and '2000-12-31'
group by country
order by count(country) desc;

drop table if exists country_pop_01_20;
create table country_pop_01_20 as
select country, count(country)
from movie_pubdate inner join movie_country
where pubdate between '2001-00-00' and '2020-12-31'
group by country
order by count(country) desc;

# (3). movie_publication place popularity
drop table if exists pubPlace_pop_60_80;
create table pubPlace_pop_60_80 as
select place
from movie_pubdate 
where pubdate between '1960-00-00' and '1980-12-31'
group by place
order by count(place) desc;

drop table if exists pubPlace_pop_81_00;
create table pubPlace_pop_81_00 as
select place
from movie_pubdate 
where pubdate between '1981-00-00' and '2000-12-31'
group by place
order by count(place) desc;

drop table if exists pubPlace_pop_01_20;
create table pubPlace_pop_01_20 as
select place
from movie_pubdate 
where pubdate between '2001-00-00' and '2020-12-31'
group by place
order by count(place) desc;



# 6. percentage of high quality users 没法做，没有user注册年龄信息

# 7. info of commercial valuable directors (directing most in top 1000 ranked movies)
drop table if exists top_1000_movies;
create table top_1000_movies as 
select movie_id, average from movie_grade
order by average desc limit 1000;

drop table if exists valued_director_info;
create table valued_director_info as
select movie_person_name, constella, birthday, birthplace, count(movie_director_id) as num_being_directors
from movie_director inner join top_1000_movies
inner join movie_person
group by movie_director_id
order by count(movie_director_id) desc;

# 8. info of commercial valuable actors (acting most in top 1000 ranked movies)
drop table if exists valued_actor_info;
create table valued_actor_info as
select movie_person_name, constella, birthday, birthplace, count(movie_actor_id) as num_being_actors
from movie_actor inner join top_1000_movies
inner join movie_person
group by movie_actor_id
order by count(movie_actor_id) desc;
# 9. info of commercial valuable writers (writing most in top 1000 ranked movies)
drop table if exists valued_writer_info;
create table valued_writer_info as
select movie_person_name, constella, birthday, birthplace, count(movie_writer_id) as num_movies_write
from movie_writer inner join top_1000_movies
inner join movie_person
group by movie_writer_id
order by count(movie_writer_id) desc;

# 10. movie duration info
drop table if exists duration_info;
create table duration_info as
select movie_name, sum(duration) as total_duration_with_unit_minutes
from movie_name inner join movie_episode 
group by movie_id
order by sum(duration) desc;

# 11. all-around movie persons (全能电影人，多种职业，职业越多越全能)
drop table if exists movie_person_prof_info;
create table movie_person_prof_info as
select movie_person_name, profession from 
movie_person inner join movie_person_prof
group by movie_person_id
order by count(movie_person_id) desc;

drop table if exists movie_person_prof_rank;
create table movie_person_prof_rank as
select distinct movie_person_name, count(movie_person_id) as num_prof
from movie_person inner join movie_person_prof
group by movie_person_id
order by count(movie_person_id);

# 12. relationship between age and movie type
drop table if exists avg_user_age_of_every_movie_type;
create table avg_user_age_of_every_movie_type as
select avg(age),movie_type
from user_info inner join movie inner join movie_type
group by movie_type;

drop table if exists favourite_movie_type_for_every_age;
create table favourite_movie_type_for_every_age as
select age, max(count(movie_type)) as favourite_movie_type
from user_info inner join movie inner join movie_type
group by age asc;

# book info
# 13. book popularity ranked by credits and review counts
drop table if exists pop_books;
create table pop_books as
select origin_name, subtitle from
book_name inner join book_grade
order by average and reviews_count desc;

# 14. author popularity (writing the most in top 1000 books)
drop table if exists pop_authors;
create table pop_authors as
select user_name as author_name, birthday, count(book_id) as nums_of_book_write from
book_person join book_author on book_person.user_id = book_author.book_author_id
where book_id in (
select book_id from book_grade order by average and reviews_count desc limit 1000)
group by book_author_id
order by count(book_id) desc;

# 15. number of book published by publishers rank
drop table if exists num_books_publisher_published;
create table num_books_publisher_published as
select distinct press, count(book_id) as num_of_books_published
from book_publication
group by press 
order by count(book_id) desc;

# 16. publisher popularity (publishing most in top 1000 books)
drop table if exists pop_publisher;
create table pop_publisher as
select distinct press, count(book_id) as num_of_top_1000_books_published
from book_publication where book_id in
(select book_id from book_grade order by average and reviews_count desc limit 1000)
group by press
order by count(book_id) desc;

# 17. average book price of publishers
drop table if exists price_publisher;
create table price_publisher as
select press, avg(price)
from book_publication
group by press
order by avg(price);

# 18. average book price written by every writer
drop table if exists price_writer;
create table price_writer as
select distinct user_name as writer_name, avg(price)
from book_author join book_person on book_author.book_author_id = book_person.user_id
join book_publication on book_author.book_id = book_publication.book_id
group by user_id 
order by avg(price) desc;

# 19. number of writers connected to every publisher
drop table if exists publisher_connect_writer;
create table publisher_connect_writer as
select distinct press, count(book_author_id)
from book_publication inner join book_author
group by press
order by count(book_author_id) desc;

# 20. most valuable writer for each publisher
drop table if exists most_valu_writer_for_each_publisher;
create table most_valu_writer_for_each_publisher as
select distinct press, user_name as writer_name, max(count(book_author_id)) as num_of_books
from book_author join book_person on book_author.book_author_id = book_person.user_id
join book_publication on book_author.book_id = book_publication.book_id
group by press;

# 21. publish year rank (the year when most number of books published comes the first)
drop table if exists publish_year_rank;
create table publish_year_rank as
select distinct publish_year, count(book_id) as num_of_books_published
from book_publication 
group by publish_year
order by count(book_id);

# 22. productivity of every writer (total page number of every writer rank) 
drop table if exists productivity;
create table productivity as 
select user_name as writer_name, sum(page_num) as total_page_write
from book_author join book_person on book_author.book_author_id = book_person.user_id
join book_publication on book_author.book_id = book_publication.book_id
group by user_id 
order by sum(page_num) desc;

# 23. translator popularity (who translate most books comes the first)
drop table if exists translator_pop;
create table translator_pop as
select user_name as translator_name, count(book_id) as num_book_translate
from book_translator_id join book_person on book_translator_id.book_translator_id = book_person.user_id
group by book_translator_id
order by count(book_id) desc;

# 24. common books read by shanghai people
select distinct origin_name, subtitle, count(book_id) as num_of_people_read
from book_name inner join user_book
join user_info inner join user_info
where address = '上海'
group by book_id
order by count(book_id) desc;

*/