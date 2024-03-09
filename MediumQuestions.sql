-- Write Query to return email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered Alphabetically by email starting with letter A

select distinct email, first_name, last_name
from customer
JOIN invoice on customer.customer_id = invoice.customer_id
JOIN invoice_line on invoice_line.invoice_id = invoice.invoice_id
WHERE track_id IN(
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
ORDER BY email;


-- Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands

select artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
from track
join album ON album.album_id = track.album_id
join artist ON artist.artist_id = album.artist_id
join genre ON genre.genre_id = track.genre_id
where genre.name LIKE 'Rock'
group by artist.artist_id
order by number_of_songs DESC
limit 10;

-- Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. 
-- Order by the song length with the longest songs listed first

SELECT name, milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;