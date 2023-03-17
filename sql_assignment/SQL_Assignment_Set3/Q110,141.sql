/* Q.110 Write a query to find the node type of Binary Tree ordered by the value of the node. 
   Output one of the following for each node:
   ● Root: If node is root node.
   ● Leaf: If node is leaf node.
   ● Inner: If node is neither root nor leaf node. */

CREATE TABLE bst(
		n INT,
		p INT
	);
INSERT INTO bst 
VALUES
		(1,2),
		(3,2),
		(6,8),
		(9,8),
		(2,5),
		(8,5),
		(5,NULL);

SELECT n,
      CASE
         WHEN n NOT IN 
                       (SELECT DISTINCT p 
                        FROM bst 
                        WHERE p IS NOT NULL) 
                        THEN 'LEAF'
         WHEN p IS NULL THEN 'ROOT'
         ELSE 'INNER'
         END AS type_of_node
 FROM bst
 ORDER BY n