/* Q.84 
Write a Query to update the Facebook advertisers status using the daily_pay table. 
Advertiser is a two-column table containing the user id and their payment status based 
on the last payment and daily_pay table has current information about their payment. 
Only advertisers who paid will show up in this table.
 Output the user id and current payment status sorted by the user id.  */

CREATE TABLE advertiser(
        user_id VARCHAR(20),
		status VARCHAR(20)
    );
INSERT INTO advertiser 
VALUES
        ('BING','NEW'),
        ('YAHOO','NEW'),
        ('ALIBABA','EXISTING');

CREATE TABLE daily_pay(
        user_id VARCHAR(20),
        paid DECIMAL
    );
INSERT INTO daily_pay 
VALUES
        ('YAHOO',45.00),
        ('ALIBABA',100.00),
        ('TARGET',13.00);

SELECT