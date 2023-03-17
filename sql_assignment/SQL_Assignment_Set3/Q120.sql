/* Q.81 
Write a SQL Query to find the number of prime and non-prime items that can be stored 
in the 500,000 square feet warehouse. Output the item type and number of items to be stocked. */

CREATE TABLE inventory(
        item_id INT,
        item_type VARCHAR(20),
        item_category VARCHAR(20),
        square_foot FLOAT
    );
INSERT INTO inventory 
VALUES
        (1374,'PRIME_ELIGIBLE','MINI FRIDGE',68.00),
        (4245,'NOT_PRIME','STANDING LAMP',26.40),
        (2452,'PRIME_ELIGIBLE','TELEVISION',85.00),
        (3255,'NOT_PRIME','SIDE TABLE',22.60),
        (1672,'PRIME_ELIGIBLE','LAPTOP',8.50);
	
 WITH cte AS (   
				SELECT item_type,
						SUM(square_foot) AS square_foot_per_item,
						COUNT(*) AS count_items
				FROM inventory
				GROUP BY item_type
			),

	prime_eli AS(
				   SELECT item_type,
							(500000 - (square_foot_per_item * FLOOR(500000/square_foot_per_item))) AS area_left 
					FROM cte
                    WHERE item_type = 'PRIME_ELIGIBLE'
				)
                  
  SELECT item_type,           
		 CASE WHEN item_type = 'PRIME_ELIGIBLE' THEN FLOOR(500000/square_foot_per_item)*count_items
			  ELSE FLOOR(( SELECT area_left FROM prime_eli) /square_foot_per_item) * count_items
              END AS item_count
  FROM cte
				