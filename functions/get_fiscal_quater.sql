CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quater`(
     calendar_date date
) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare month int;
    declare qtr char(2);
    set month=month(calendar_date);
case
 when month in(9,10,11) then 
  set qtr="q1";
 when month in(12,1,2) then 
  set qtr="q2";
 when month in(3,4,5) then 
  set qtr="q3";
 else
 set qtr="q4";
end case;
return qtr;
END