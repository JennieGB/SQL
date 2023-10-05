-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS seconds;
DELIMITER $$
CREATE FUNCTION seconds(seconds BIGINT) RETURNS VARCHAR(255)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
DECLARE timing VARCHAR(255);
IF seconds < 60 THEN
    SET timing = CONCAT(seconds, ' seconds');
ELSEIF seconds >= 60 AND seconds < 3600 THEN
    SET timing = CONCAT(FLOOR(seconds / 60), ' minutes ', seconds % 60, ' seconds');
ELSEIF seconds >= 3600 AND seconds < 86400 THEN
    SET timing = CONCAT(FLOOR(seconds / 3600), ' hours ', FLOOR(seconds / 3600) % 60, ' minutes ', FLOOR(seconds / 3600) % 3600, ' seconds');
ELSE 
    SET timing = CONCAT(FLOOR(seconds / 86400), ' days ', MOD(seconds, 86400) DIV 3600, ' hours ', MOD(MOD(seconds, 86400), 3600) DIV 60, ' minuites ', MOD(MOD(MOD(seconds, 86400), 3600), 60), ' seconds');

END IF;
RETURN timing;
    END $$
DELIMITER ;
SELECT seconds(123456);

-- -----------------------------------------
-- Второй вариант

DROP FUNCTION seconds;
DELIMITER $$
CREATE FUNCTION seconds (second INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN 
DECLARE sec INT DEFAULT second;
DECLARE name VARCHAR (255);
DECLARE time INT;
IF second  > 86400 THEN
SET time = FLOOR(second / 86400);
SET name = CONCAT(time,  'days ');
SET second = second - 86400 * time;
SET time = FLOOR(second / 3600);
SET name = CONCAT(name, time,'hours ');
SET second = second - time * 3600;
SET time = FLOOR(second / 60);
SET name = CONCAT(name, time, 'minutes ');
SET second = second - time * 60;
SET name = CONCAT(name, second, 'seconds');
RETURN name;

ELSE
SET name = 'количество секунд не должно быть менее 86400';
END IF;
 RETURN name;
END $$
DELIMITER ;

SELECT seconds(23456);
-- -----------------------------------------------------------------------------------
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
DROP PROCEDURE  IF EXISTS even;
DELIMITER $$
CREATE PROCEDURE even(begining INT, ending INT)
BEGIN
    DECLARE i INT DEFAULT begining;
    DECLARE evens TEXT DEFAULT NULL;
    WHILE  i <= ending DO
        IF i % 2 = 0 THEN
            IF evens IS NULL THEN
                SET evens = CONCAT(i);
            ELSE
                SET evens = CONCAT(evens, ', ', i);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;
    SELECT evens;
END $$
DELIMITER ;
CALL even(1, 10);
-- ----------------------------------------------------------------------------------------
-- Второй вариант

DROP FUNCTION IF EXISTS even;
DELIMITER $$
CREATE FUNCTION even(begining INT, ending INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
	DECLARE a INT;
	DECLARE b TEXT;
	
	SET a = IF(begining % 2 = 1, begining + 1, begining);
	
	WHILE a <= ending DO
		SET  b = CONCAT_WS(", ", b, a);
		SET a = a + 2;
	END WHILE;
	
	RETURN b;
END $$
DELIMITER ;

SELECT even(1, 10);