/* Table Function for Random Variables */
/*First we must create our nested table collection type */

create or replace type strings_t is table of varchar2(100);

/*Then we create our  fuction named  random_strings */

Create or replace function random_strings (count_in IN Integer)
return strings_t
IS
  /* we  must absolutaly initalize our nested table collection */

l_strings  strings_t:= strings_t();

 begin
   
   /*Then you can extend room for random string variables inside of collection with 'EXTEND' method */ 
   
 l_strings.EXTEND (count_in);
 
 for indx in 1..count_in loop
 l_strings(indx):= DBMS_RANDOM.string('u',10);
 END LOOP;
 
 RETURN l_strings;
 
 
 End;

 /* I can use function inside of PL SQL block */

 declare 
 l_strings  strings_t := random_strings(5);
 begin
  for idx in 1 ..l_strings.count
  loop
  dbms_output.put_line(l_strings(idx));
  end loop ;
 
 end;



















