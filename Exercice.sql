





	declare
	i number;
	begin 
	i:=1;
	loop 
	dbms_output.put_line(i);
	i:=i+1;
	exit when (i=100);
	end loop; 
	end;
	/

	declare
	i number;
	j number;
	M number;
	begin 
	i:=5;
	j:=1;
	M:=i*j;
	loop 
	M:=i*j;
	dbms_output.put_line(i||'x'||j||'='||M);
	j:=j+1;
	exit when j=13;
	end loop ;
	end;
	/

		declare
	i number;
	begin 
	i:=1;
	while(i<=100)
	loop 
	dbms_output.put_line(i);
	i:=i+1;
	end loop; 
	end;
	/

	declare
i BINARY_INTEGER;
j BINARY_INTEGER;
k BINARY_INTEGER;
l BINARY_INTEGER;
begin 
i:= dbms_random.value(1,4);
loop 
j:= dbms_random.value(1,4);
exit when j!=i;
end loop;
loop 
k:= dbms_random.value(1,4);
exit when j!=k and k!=i;
end loop;
loop 
l:= dbms_random.value(1,4);
exit when l!=k and l!=j and l!=i;
end loop;
dbms_output.put_line(i);
dbms_output.put_line(j);
dbms_output.put_line(k);
dbms_output.put_line(l);
end;
/


	declare
	M number;
	begin
	FOR x in 1..12
	loop 
	FOR z in 1..12
	loop 
	M:=x*z;
	dbms_output.put_line(x||' x '||z||' = '||M);
	end loop;
	end loop; 
	end;
	/

	